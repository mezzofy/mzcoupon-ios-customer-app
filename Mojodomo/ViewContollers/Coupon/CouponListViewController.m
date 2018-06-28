//
//  CouponListViewController.m
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "UIImageView+WebCache.h"

#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "CouponListViewController.h"
#import "CouponCell.h"
#import "CouponDetailViewController.h"
#import "Common.h"
#import "CouponModule.h"



#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface CouponListViewController (){
    NSMutableArray *arrcouponList;
    NSString* currentselection;
    CouponModule *modcoupn;
    NSNumber* _totalrows;
    NSMutableArray *arrProductImageList;
    UIImageView *bgView;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;

@end

@implementation CouponListViewController
@synthesize segmentedControl,pcampId,pparent;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@",[pcoupon status]);
    [self refreshcontroller];
    
    
    modcoupn=[[CouponModule alloc]init];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    
    latitude=[NSNumber numberWithDouble:curlatitude];
    longitude=[NSNumber numberWithDouble:curlongitude];
    [NSThread detachNewThreadSelector:@selector(LoadDataFromServer) toTarget:self  withObject:nil];

   
    
}
-(void)LoadDataFromServer{
    UIActivityView* actvityview = [Common getActivityViewerwithTitle:@"Loading..."];
    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
    
    [modcoupn getCampaignCouponListFromServer:pcampId CouponStatus:@"A" Offset:1];
    
    [Common hideActivityViewer:actvityview];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.tableView.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    
   
}
- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    for (UIView* view in bgView.subviews){
        [view removeFromSuperview];
    }
    
    // Return the number of sections.
    if ([modcoupn getActiveCouponCampaignId:pcampId]>0) {
        return [modcoupn getActiveCouponCampaignId:pcampId];
    }
    else {
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-coupon.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"DIGITALCOUPONS", nil);
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        
        [bgView addSubview:messageLabel];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CouponCell";
    
    CouponCell *cell =(CouponCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TblCouponData *objcoupon=[modcoupn getActiveCouponCampaignId:pcampId ByOffset:indexPath.row];

    
    [cell.lblcouponName setText:[objcoupon productDesc]];
    cell.lblmerchantname.text=[objcoupon couponName];
    
    if(objcoupon.endDate.length>10){
        NSString *newStr = [[objcoupon endDate] substringWithRange:NSMakeRange(0, 10)];
        
        NSTimeInterval timest = [newStr  doubleValue];
        NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy"];
        NSString *enddate = [formatter stringFromDate:dt];
        [cell.lblexpiryDate setText:enddate];
    }

    
    [cell.prodimg sd_setImageWithURL:[NSURL URLWithString:[objcoupon productImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
    
    if (objcoupon.referEmail == NULL)
        [cell.lblsellprice setText:[objcoupon couponNo]];
    else
        [cell.lblsellprice setText:[NSString stringWithFormat:NSLocalizedString(@"SENDASGIFT", nil),[objcoupon couponNo]]];
    
    
    
    

              [objcoupon setTrack:NSLocalizedString(@"NEW", nil)];

    cell.imgBadge.hidden = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TblCouponData *objcoupon=[modcoupn getCampaignWithCouponType:@"A" ByOffset:indexPath.row];

    if([[objcoupon couponStatus] isEqualToString:@"A"])
        [self performSegueWithIdentifier:@"showcoupondetail" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showcoupondetail"] ) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TblCouponData *objcoupon=[modcoupn getCampaignWithCouponType:@"A" ByOffset:indexPath.row];
        CouponDetailViewController *coupondtlvc = segue.destinationViewController;
        coupondtlvc.pcouponId=objcoupon.couponId;
        
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        [modloader loadProductDetails:[objcoupn prodId] latitude:latitude longitude:longitude];
    }
}


#pragma mark - coupon pagination

-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    //Clear loaded data
    //    _rowsCount = 0;
    [self loadNextBatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",
                             [formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [refresh endRefreshing];
}


#pragma mark - Data loading logic
- (void)loadNextBatch {
    //    _isLoading = YES;
    //    if (![self footerActivityIndicatorView])
    //        [self addFooterActivityIndicatorWithHeight:80.f];//Add ENFooterActivityIndicatorView to tableView's footer
    //
    //    if (_rowsCount < [_totalrows intValue])
    [self performSelectorOnMainThread:@selector(addNewData) withObject:nil waitUntilDone:FALSE ];
    //    else
    //        [self removeFooterActivityIndicator];
}

- (void)addNewData {
    
//    dispatch_queue_t processQueue = dispatch_queue_create("Process Queue",NULL);
    
//    dispatch_async(processQueue, ^{
    
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        [modloader loadCouponDetaillist:[Common staffid] prod:[pcoupon productId] stat:[pcoupon status] offset:0 size:[pcoupon.couponCount intValue]];
//       // NSString *count=objrespons.size;
//       // _rowsCount +=[count intValue];
//        //        TblCoupon *objtrans = [modloader getCouponList:[Common staffid] prod:[pcoupon productId] stat:[pcoupon status] offset:0 size:[pcoupon.couponCount intValue]];
//        
//        //[modloader pageLoadCouponList:objtrans.couponList];
//        
//        CouponModule *daocpn=[[CouponModule alloc]init];
//        arrcouponList=[daocpn getCouponproductList:[pcoupon status] prod:[pcoupon productId]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    });
}
@end
