//
//  OutletDetailViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 04/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "OutletDetailViewController.h"
#import "DeliveryCell.h"
#import "UIImageView+WebCache.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "ProductViewCell.h"
#import "Common.h"
#import "Utils.h"
#import "ProductDetailController.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
@interface OutletDetailViewController (){
//    TblSite *objsite;
    NSMutableArray *arrcouponList;
    NSMutableArray *arrProductImageList;
    UIActivityIndicatorView *activeIndicator;
    UIView* actvityview;
    NSNumber* _totalrows;
//    DataReaponseModel *objrespons;
   
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;

@end

@implementation OutletDetailViewController
@synthesize nsiteid;

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    
//    SiteModule *daosite = [[SiteModule alloc]init];
//    objsite = [daosite getoutletById:nsiteid];
//    
//    self.title = [objsite merchantName];
    
    [self refreshcontroller];
    
//    activeIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    // Coupon / Redeem / Expiry List
    //Process
//    actvityview = [Common getActivityViewer];
//    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
    
    //This block runs when the table view scrolled to the bottom
    __weak typeof(self) weakSelf = self; //Don't forget to make weak pointer to self
    [self setTableScrolledDownBlock:^void() {
        //Put here your data loading logic
        if (!weakSelf.isLoading)
            [weakSelf loadNextBatch];
    }];
    
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    JsonProductList *objtrans = [modloader getProductOutletList:nsiteid offset:0 size:10];
//    [modloader pageLoadProductOutletList:objtrans.products latitude:latitude longitude:longitude];
//    
//    objrespons=[Common dataResponse];
//    _totalrows=@([objrespons.total intValue]);
   // _totalrows = [objtrans totalCount];
    
//    if(actvityview)
//        [Common hideActivityViewer:actvityview];
//    
//    [Common hideActivityViewer:activeIndicator];

}
- (void)loadProductList {
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    arrcouponList = [daoProduct getProductOutletList:nsiteid];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    [self loadProductList];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==8)
        return [arrcouponList count];
    else
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
    // Configure the cell...
   
//        if (indexPath.section == 0) {
//            DeliveryCell *cellgeneral = [tableView dequeueReusableCellWithIdentifier:@"celllogo" forIndexPath:indexPath];
//            [cellgeneral.merctlogo sd_setImageWithURL:[NSURL URLWithString:[objsite merchantLogo]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//             [cellgeneral.imgSite sd_setImageWithURL:[NSURL URLWithString:[objsite backgroundImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//            cell = cellgeneral;
//            
//        } else if (indexPath.section == 1) {
//            DeliveryCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"celldesc" forIndexPath:indexPath];
//            cellproduct.lblmertDesc.text = [objsite merchantDesc];
//            cell = cellproduct;
//        }
//        else if (indexPath.section == 2) {
//            DeliveryCell *cellspace = [tableView dequeueReusableCellWithIdentifier:@"cellspace" forIndexPath:indexPath];
//            cell = cellspace;
//        } else if (indexPath.section == 3) {
//            DeliveryCell *celltop = [tableView dequeueReusableCellWithIdentifier:@"celldetail" forIndexPath:indexPath];
//            celltop.lblSiteName.text = [objsite siteName];
//            celltop.lblSiteAddress.text =[objsite siteAddress];
//            cell = celltop;
//        } else if (indexPath.section == 4) {
//            DeliveryCell *cellproddesctitle = [tableView dequeueReusableCellWithIdentifier:@"cellspace1" forIndexPath:indexPath];
//            cell = cellproddesctitle;
//        } else if (indexPath.section == 5) {
//            DeliveryCell *cellproddesc = [tableView dequeueReusableCellWithIdentifier:@"cellphone" forIndexPath:indexPath];
//            cellproddesc.lblContact.text = [objsite siteContact];
//            cell = cellproddesc;
//        } else if (indexPath.section == 6) {
//            DeliveryCell *cellproddesctitle = [tableView dequeueReusableCellWithIdentifier:@"cellspace2" forIndexPath:indexPath];
//            cell = cellproddesctitle;
//        }  else if (indexPath.section == 7) {
//            DeliveryCell *cellhowto = [tableView dequeueReusableCellWithIdentifier:@"celloffer" forIndexPath:indexPath];
//            cell = cellhowto;
//            
//        } else if (indexPath.section == 8) {
//            ProductViewCell *cellcpn = [tableView dequeueReusableCellWithIdentifier:@"cellcoupon" forIndexPath:indexPath];
//            // Configure the cell...
//            TblProduct *tblprod;
//            tblprod=[arrcouponList objectAtIndex:indexPath.row];
//            
//            ProductModule *daoProduct = [[ProductModule alloc]init];
//            arrProductImageList=[daoProduct getProductimagelist:[tblprod prodId]];
//            
//            if ([arrProductImageList count]>0) {
//                TblProductImage *tblimg=[arrProductImageList objectAtIndex:0];
//                [cellcpn.imgProduct sd_setImageWithURL:[NSURL URLWithString:[tblimg productImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//                
//            }else{
//                [cellcpn.imgProduct  setImage:[UIImage imageNamed:@"noimg.jpg"]];
//            }
//            if (![[tblprod catgimage] isEqual:@""]) {
//                [cellcpn.imgCatg sd_setImageWithURL:[NSURL URLWithString:[tblprod catgimage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//            }else{
//                [cellcpn.imgCatg  setImage:[UIImage imageNamed:@"Point Of Interest.png"]];
//            }
//            
//            cellcpn.lblProductName.text = [tblprod productName];
//            
//            CompanyModule *daoComp = [[CompanyModule alloc]init];
//            TblCompany* tblComp = [daoComp getCompanyDetail:[Common compid]];
//            if ([[tblprod originalPrice] isEqualToNumber:[NSNumber numberWithDouble:0]]) {
//                cellcpn.lblOriginalPrice.hidden=YES;
//            }
//            else{
//                cellcpn.lblOriginalPrice.hidden=NO;
//                NSDictionary* attrs = @{ NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
//                
//                NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",[tblComp currency],[tblprod originalPrice]] attributes:attrs];
//                
//                cellcpn.lblOriginalPrice.attributedText = attrText;
//            }
//            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//            [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//            NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//            [formatter setGroupingSeparator:groupingSeparator];
//            [formatter setGroupingSize:3];
//            [formatter setAlwaysShowsDecimalSeparator:NO];
//            [formatter setUsesGroupingSeparator:YES];
//            NSString *formattedString = [formatter stringFromNumber:[tblprod sellingPrice]];
//           
//            cellcpn.lblPrice.text = [NSString stringWithFormat:@"%@ %@",[tblComp currency],formattedString];
//            
//            //remark
//            cellcpn.lblFreeText1.text = [tblprod note1];
//            cellcpn.lblFreeText2.text = [tblprod note2];
//            cellcpn.lblFreeText3.text = [tblprod note3];
//            
//            //Distance
//            NSString *sold = NSLocalizedString(@"sold",nil);
//            NSString *left = NSLocalizedString(@"left",nil);
//            NSString *due = NSLocalizedString(@"Expiryin",nil);
//            NSString *day = NSLocalizedString(@"days", nil);
//            NSString *hour = NSLocalizedString(@"Hours", nil);
//            [cellcpn.lblDistance setAdjustsFontSizeToFitWidth:YES];
//            //NSString *infinity = @"\u221E";
//            if ([[tblprod dailyLimitType]isEqualToString:@"A"]) {
//                if ([[tblprod expiryname]isEqualToString:@"D"]) {
//                    cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod soldCoupon],left,[tblprod redemptionQuota]];
//                }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
//                    cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod soldCoupon],left,[tblprod redemptionQuota]];
//                }
//            }else {
//                if (IS_IPHONE_6_PLUS){
//                    if ([[tblprod expiryname]isEqualToString:@"D"]) {
//                        cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                         %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod soldCoupon]];
//                    }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
//                        cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                         %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod soldCoupon]];
//                    }
//                }else {
//                if ([[tblprod expiryname]isEqualToString:@"D"]) {
//                    cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                           %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod soldCoupon]];
//                }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
//                    cellcpn.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                   %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod soldCoupon]];
//                    }
//                }
//            }
//
//            //fav
//            cellcpn.btnFavourite.tag = [[tblprod prodId] intValue];
//            [cellcpn.btnFavourite addTarget:self action:@selector(btnFavourite_Touch:) forControlEvents:UIControlEventTouchUpInside];
//            
//            NSString *retval = [daoProduct getFavouriteStatusById:[tblprod prodId]];
//            if ([retval isEqualToString:@"Y"]) {
//                [cellcpn.btnFavourite setImage:[UIImage imageNamed:@"GETSO_UI_11OCT2016-09.png"] forState:UIControlStateNormal];
//            } else {
//                [cellcpn.btnFavourite setImage:[UIImage imageNamed:@"GETSO_UI_11OCT2016-08.png"] forState:UIControlStateNormal];
//            }
//            cell = cellcpn;
//        }
    
    return cell;
    
}
- (IBAction)btnFavourite_Touch:(id)sender {
    
//    NSLog(@"prod %ld", (long)[sender tag]);
//    
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    
//    NSNumber *prodid = [NSNumber numberWithInt:(int)[sender tag]];
//    NSString *retval = [daoProduct getFavouriteStatusById:prodid];
//    if ([retval isEqualToString:@"Y"]) {
//        [daoProduct updateFavourite:prodid Status:@"N"];
//    } else {
//        [daoProduct updateFavourite:prodid Status:@"Y"];
//    }
    [self loadProductList];
    [self.tableView reloadData];
}

- (IBAction)btnBack_Touch:(id)sender{
     [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnshare_Touch:(id)sender{
    
//    NSString *merchtname= [objsite merchantName];
//    NSString *merchtdesc= [objsite merchantDesc];
//    NSString *sitename= [objsite siteName];
//    NSString *siteaddrss= [objsite siteAddress];
//    NSString *sitecont= [objsite siteContact];
//
//    NSArray *itemsToShare = @[merchtname,merchtdesc,sitename,siteaddrss,sitecont];
//    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
//    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll]; //or whichever you don't need
//    [self presentViewController:activityVC animated:YES completion:nil];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 175;
    }
    else if(indexPath.section == 1)
    {
   
//    NSString *trimmedString = [objsite.merchantDesc stringByTrimmingCharactersInSet:
//                               [NSCharacterSet whitespaceCharacterSet]];
//    CGSize maximumLabelSize = CGSizeMake(370, 9999); // this width will be as per your requirement
//    CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
//                                                  options:NSStringDrawingUsesLineFragmentOrigin
//                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
//                                                  context:nil];
//    return textRect.size.height+20;
    }
   else if(indexPath.section == 3)
    {
        return 110;
    }
    else if(indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6 )
    {
        return 5;
    }
    
    else if(indexPath.section == 7)
    {
        if ([arrcouponList count]>0) {
            return 50;
        } else {
            return 0;
        }
    }

     else if(indexPath.section == 8)
    {
        return 320;
    }
    
    return 50;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showcoupon"]) {
        
//        NSIndexPath *indxPath = [self.tableView indexPathForSelectedRow];
//        TblProduct *tblProd=[arrcouponList objectAtIndex:indxPath.row];
//        ProductDetailController *proDetails = segue.destinationViewController;
//        proDetails.nProdid = [tblProd prodId];
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//       // [modloader loadProductDetails:[tblProd prodId]];
//        [modloader loadProductDetails:[tblProd prodId] latitude:latitude longitude:longitude];
    }
}
#pragma mark - Product Pagination
-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    //Clear loaded data
    _rowsCount = 0;
    
//    ProductModule *modprd = [[ProductModule alloc]init];
//    [modprd updateAllProductAssignedStatus:@"U"];
    [self loadNextBatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [refresh endRefreshing];
    
}

#pragma mark - Data loading logic
- (void)loadNextBatch {
    _isLoading = YES;
    if (![self footerActivityIndicatorView])
        [self addFooterActivityIndicatorWithHeight:80.f];//Add ENFooterActivityIndicatorView to tableView's footer
    
    if (_rowsCount <= [_totalrows intValue])
        [self performSelectorOnMainThread:@selector(addNewData) withObject:nil waitUntilDone:FALSE ];
    else
        [self removeFooterActivityIndicator];
}

- (void)addNewData {
    
    dispatch_queue_t processQueue = dispatch_queue_create("Process Queue",NULL);
    
//    dispatch_async(processQueue, ^{
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        //NSString *count=objrespons.size;
//       //_rowsCount += [count intValue];
//        JsonProductList *objtrans= [modloader getProductOutletList:nsiteid offset:_rowsCount size:10];
//        objrespons =[Common dataResponse];
//        _totalrows=@([objrespons.total intValue]);
//        NSString *count=objrespons.size;
//        _rowsCount +=[count intValue];
//       [modloader pageLoadProductOutletList:objtrans.products latitude:latitude longitude:longitude];
//    
//        [self loadProductList];
//        
//        [modloader loadCategoryList];
//   
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _isLoading = NO;
//            [self.tableView reloadData];
//            
//            if (_rowsCount == [_totalrows intValue])
//                [self removeFooterActivityIndicator];
//        });
//        
//    });
}

@end
