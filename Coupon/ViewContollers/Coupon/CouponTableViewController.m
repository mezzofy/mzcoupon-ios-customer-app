//
//  CouponTableViewController.m
//  CouponWallet
//
//  Created by Inforios on 11/05/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "CouponTableViewController.h"
#import "UIImageView+WebCache.h"

#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "CouponCell.h"
#import "CouponListViewController.h"
#import "Common.h"
#import "CouponDetailViewController.h"
#import "SiteViewController.h"
#import "MassRedemViewController.h"
#import "CouponModule.h"
#import "ProductModule.h"
#import "TblProduct.h"
#import "TblCampaignImage.h"

#import "SiteModule.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface CouponTableViewController (){
    
    CouponModule *modcoupon;
    ProductModule *modprod;
    NSString* currentselection;
    
    UIActivityIndicatorView *activeIndicator;
    NSNumber* _totalrows;
    NSNumber* totcount;
    NSNumber *size;
    UIView* actvityview;
    NSMutableArray *arrProductImageList;
    UIImageView *bgView;
    
    
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}

@property (nonatomic, assign) NSInteger rowsCount;
@property (nonatomic, assign) NSInteger pagesize;
@end

@implementation CouponTableViewController
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    modcoupon=[[CouponModule alloc]init];
    modprod=[[ProductModule alloc]init];
    _pagesize=1;
    currentselection = @"A";
    [self refreshcontroller];
    
    //Location current
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
    
    [self performSelectorOnMainThread:@selector(loader:) withObject:self waitUntilDone:NO];
    

}
-(void)loader:(NSObject *)pself{
    
    if ([currentselection isEqualToString:@"R"] || [currentselection isEqualToString:@"E"]) {
        
        [modcoupon getCouponListFromServerCouponStatus:currentselection Offset:_pagesize];
        [self.tableView reloadData];
    }
    else{
        [modcoupon getCouponCountListfromServer:@"A" Offset:_pagesize];
        [self.tableView reloadData];
    }

}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController setToolbarHidden:YES];
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.tableView.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    //    CouponModule *modcpn = [[CouponModule alloc]init];
    //    [modcpn deleteAllCouponlist:currentselection];
    //
    //    LoaderModule *modloader = [[LoaderModule alloc]init];
    //    [modloader getCoupon:[Common staffid] offset:0 size:10 Type:currentselection];
    //
    //    objrespons =[Common dataResponse];
    //    _totalrows=@([objrespons.total intValue]);
    //    CouponModule *daocpn=[[CouponModule alloc]init];
    //    arrcouponList=[daocpn getCouponstatusList:currentselection];
    //
//    [self.tableView reloadData];
    
}
-(void)viewDidAppear:(BOOL)animated {
     [self performSelectorOnMainThread:@selector(loader:) withObject:self waitUntilDone:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowcount=0;
    for (UIView* view in bgView.subviews){
        [view removeFromSuperview];
    }
    
    if([currentselection isEqualToString:@"A"]){
        rowcount=0;
        rowcount=[modcoupon getCampaigncountWithCouponCount];
    }
    else if([currentselection isEqualToString:@"R"]||[currentselection isEqualToString:@"E"]){
        rowcount=0;
        rowcount = [modcoupon getCampaigncountWithCouponType:currentselection];
        
    }
    if(rowcount==0){
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
    
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Couponcell";
    
    CouponCell *cell =(CouponCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    _rowsCount=indexPath.row+3;
    if ([currentselection isEqualToString:@"R"] || [currentselection isEqualToString:@"E"]){
        TblCouponData *objcoup=[modcoupon getCampaignWithCouponType:currentselection ByOffset:indexPath.row];
        [cell.lblCouponCount setHidden:YES];
        [cell.lblsellprice setHidden:NO];
        [cell.lblexpiryDate setHidden:NO];
        cell.lblmerchantname.text= [objcoup couponName];
        [cell.lblcouponName setText:[objcoup campaignDesc]];
        if(objcoup.endDate.length>10){
            NSString *newStr = [[objcoup endDate] substringWithRange:NSMakeRange(0, 10)];
            
            NSTimeInterval timest = [newStr  doubleValue];
            NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd-MM-yyyy"];
            NSString *enddate = [formatter stringFromDate:dt];
            [cell.lblexpiryDate setText:enddate];
        }
        [cell.prodimg sd_setImageWithURL:[NSURL URLWithString:[objcoup productImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
        
        
        if (objcoup.referEmail == NULL){
            if ([[objcoup couponStatus]isEqualToString:@"E"]){
                if([[objcoup brand]isEqualToString:@"F"])
                    [cell.lblsellprice setText:[NSString stringWithFormat:@"Free Coupon"]];
                else
                [cell.lblsellprice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objcoup sellingPrice]]];
            }
        }
        else
            [cell.lblsellprice setText:[NSString stringWithFormat:NSLocalizedString(@"SENDASGIFT", nil),[objcoup couponNo]]];
        
        
        
        
        if(objcoup.track == NULL)
        {
            if ([[objcoup orderType] isEqualToString:@"R"]) {
                [objcoup setTrack:NSLocalizedString(@"REDEEMED", nil)];
            }else{
                [objcoup setTrack:NSLocalizedString(@"NEW", nil)];
            }
        }
        
        
        if ([[objcoup couponStatus] isEqualToString:@"R"]) {
            
            if( [objcoup orderNo] == nil){
                [cell.lblsellprice setText:NSLocalizedString(@"REDEEMED", nil)];
                
                NSTimeInterval epoch = [objcoup.hashCode  doubleValue];
                NSDate * dt = [NSDate dateWithTimeIntervalSince1970:epoch];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd-MM-yyyy"];
                NSString *outputDateString = [formatter stringFromDate:dt];
                
                [cell.lblexpiryDate setText:outputDateString];
                
            }else if([objcoup.track isEqualToString:@"Done"]){
                [cell.lblexpiryDate setText:[objcoup orderNo]];
                [cell.lblsellprice setText:NSLocalizedString(@"REDEEMED", nil)];
            }else{
                [cell.lblexpiryDate setText:[objcoup orderNo]];
                [cell.lblsellprice setText:[objcoup track]];
            }
        }
    }else{
        
        TblProduct *objprod=[[TblProduct alloc]init];
        objprod=[modcoupon getCampaignWithCouponCountByOffset:indexPath.row];
        cell.lblmerchantname.text= [objprod campaignName];
        [cell.lblCouponCount setHidden:NO];
        [cell.lblsellprice setHidden:YES];
        [cell.lblcouponName setText:[objprod campaignDesc]];
        [cell.lblCouponCount setText:[objprod size]];
        arrProductImageList=[modprod getCampaignImg:[objprod campaignId]];
        
        if ([arrProductImageList count]>0) {
            TblCampaignImage *tblcamp=[arrProductImageList objectAtIndex:0];
            
            [cell.prodimg sd_setImageWithURL:[NSURL URLWithString:[tblcamp campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
        }else
            [cell.prodimg sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
        
        
        if ([[objprod dailyLimitType] isEqualToString:@"A"]) {
            [cell.lblsellprice setHidden:NO];
            [cell.lblsellprice setAdjustsFontSizeToFitWidth:YES];
            NSString *redeem = NSLocalizedString(@"left", nil);
            [cell.lblsellprice setText:[NSString stringWithFormat:@"%@:%@",redeem,[objprod redemptionQuota]]];
        }
        
        //[cell.lblexpiryDate setHidden:YES];
        [cell.lblexpiryDate setAdjustsFontSizeToFitWidth:YES];
        NSString *exp = NSLocalizedString(@"Expiryin", nil);
        NSString *day = NSLocalizedString(@"days", nil);
        NSString *hour = NSLocalizedString(@"Hours", nil);
        if(objprod.endDate.length>10){
            NSString *newStr = [[objprod endDate] substringWithRange:NSMakeRange(0, 10)];
            
            NSTimeInterval timest = [newStr  doubleValue];
            NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd-MM-yyyy"];
            NSString *enddate = [formatter stringFromDate:dt];
            [cell.lblexpiryDate setText:enddate];
        }
        if ([[objprod expiryname]isEqualToString:@"D"]) {
            [cell.lblexpiryDate setText:[NSString stringWithFormat:@"%@ %@ %@",exp,[objprod expirydue],day]];
        }else  if ([[objprod expiryname]isEqualToString:@"H"]) {
            [cell.lblexpiryDate setText:[NSString stringWithFormat:@"%@ %@ %@",exp,[objprod expirydue],hour]];
        }else
            cell.lblexpiryDate.text=@"";
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([currentselection isEqualToString:@"R"]){
        [self performSegueWithIdentifier:@"showreedemlist" sender:self];
    }else if ([currentselection isEqualToString:@"E"]){
        [self performSegueWithIdentifier:@"showexpirylist" sender:self];
    }   else{
        [self performSegueWithIdentifier:@"showlistcoupon" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([currentselection isEqualToString:@"R"]){
        if ([segue.identifier isEqualToString:@"showreedemlist"]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            TblCouponData *objcoup=[modcoupon getCampaignWithCouponType:currentselection ByOffset:indexPath.row];
            CouponDetailViewController *editdoc = segue.destinationViewController;
            editdoc.pcouponId=objcoup.couponId;
        }
        
    }else if ([currentselection isEqualToString:@"E"]){
        if ([segue.identifier isEqualToString:@"showexpirylist"]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            TblCouponData *objcoup=[modcoupon getCampaignWithCouponType:currentselection ByOffset:indexPath.row];
            CouponDetailViewController *editdoc = segue.destinationViewController;
            editdoc.pcouponId=objcoup.couponId;
        
        }
        
    }
    else{
        if ([segue.identifier isEqualToString:@"showlistcoupon"]) {
            NSIndexPath *indxPath = [self.tableView indexPathForSelectedRow];
            TblProduct *objprod=[modcoupon getCampaignWithCouponCountByOffset:indxPath.row];
            CouponListViewController *couponlistvc = segue.destinationViewController;
            couponlistvc.pcampId = objprod.campaignId;
            
//        }else if ([segue.identifier isEqualToString:@"showchoosesite"]) {
//            SiteViewController *vcsite = segue.destinationViewController;
            
        }else if ([segue.identifier isEqualToString:@"showchoosecouplist"]) {
                        TblSite *objsite = (TblSite*)sender;
                        MassRedemViewController *vccoupon = segue.destinationViewController;
                        vccoupon.MerchantId = [Common merchantid];
                        vccoupon.Siteid = objsite.siteId;
            
        }
    }
}

-(IBAction)btnSelect:(id)sender{
//            [self performSegueWithIdentifier:@"showchoosemert" sender:self];
             
            SiteModule* modsite = [[SiteModule alloc]init];
            NSMutableArray *arraysitelist=[modsite getAllSiteFromTable];
    
            if([arraysitelist count] >= 1)
                [self performSegueWithIdentifier:@"showchoosesite" sender:nil];
            else if(arraysitelist.count==1)
                [self performSegueWithIdentifier:@"showchoosecouplist" sender:arraysitelist[0]];
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"message:nil delegate:self
                                                      cancelButtonTitle:NSLocalizedString(@"ok",nil)
                                                      otherButtonTitles:nil, nil];
                [alert show];
            }
                
    
}




-(IBAction)indexChanged:(UISegmentedControl *)sender
{
    _pagesize=1;
    switch (sender.selectedSegmentIndex)
    {
        case 0:{
            currentselection = @"A";
            break;
        }
        case 1:{
            currentselection = @"R";
            break;
        }
        case 2:{
            currentselection = @"E";
            break;
        }
    }
    if ([currentselection isEqualToString:@"R"] || [currentselection isEqualToString:@"E"])
        [modcoupon getCouponListFromServerCouponStatus:currentselection Offset:_pagesize];
    else
        [modcoupon getCouponCountListfromServer:@"A" Offset:_pagesize];
        
        [self.tableView reloadData];
    
  
    
}

-(void) scrollToTop
{
    if ([self numberOfSectionsInTableView:self.tableView] > 0)
    {
        NSIndexPath* top = [NSIndexPath indexPathForRow:NSNotFound inSection:0];
        [self.tableView scrollToRowAtIndexPath:top atScrollPosition:UITableViewScrollPositionTop animated:FALSE];
    }
}

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
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    
    NSAttributedString *updtitle = [[NSAttributedString alloc] initWithString:lastUpdated
                                                                   attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:updtitle];
    
     refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    _pagesize=1;
    if ([currentselection isEqualToString:@"R"] || [currentselection isEqualToString:@"E"])
        [modcoupon getCouponListFromServerCouponStatus:currentselection Offset:_pagesize];
    else
        [modcoupon getCouponCountListfromServer:@"A" Offset:_pagesize];
    
     [self.tableView reloadData];
    [refresh endRefreshing];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_rowsCount < [[Common dataResponse].totalsize integerValue]){
        if(_pagesize*20 < _rowsCount){
            _pagesize=_pagesize+1;
            if ([currentselection isEqualToString:@"R"] || [currentselection isEqualToString:@"E"])
                [modcoupon getCouponListFromServerCouponStatus:currentselection Offset:_pagesize];
            else
                [modcoupon getCouponCountListfromServer:@"A" Offset:_pagesize];
            
            [self.tableView reloadData];
        }
    }
}
- (IBAction)btnBack_Modal_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    



@end
