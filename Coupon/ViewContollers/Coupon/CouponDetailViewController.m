//
//  CouponDetailViewController.m
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "CouponDetailViewController.h"
#import "ProductViewCell.h"
#import "CouponCell.h"
#import "SiteListTableViewController.h"
#import "TermsConditionView.h"
#import "ScanCouponViewController.h"
#import "HowToRedeemView.h"
#import "TodaysMenuController.h"
#import "DeliveryController.h"
#import "OrderDetailController.h"
#import "PagedImageScrollView.h"
#import "SendGiftViewController.h"
#import "SiteModule.h"
#import "TblCouponData.h"
#import "CouponModule.h"
#import "Branch.h"
#import "BranchUniversalObject.h"
#import "BranchLinkProperties.h"
#import "DLManager.h"
#import "CouponOrderModule.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface CouponDetailViewController (){
    NSMutableArray *arrcoupList;
    ProductViewCell *cellgeneral;
    CouponCell *cellcoupon;
    NSMutableArray *arrSiteList;
    NSMutableArray *arrProductImageList;
    TblCouponData *objcoupon;
    CouponModule *modcoupon;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}

@end

@implementation CouponDetailViewController
@synthesize btnRedeem,pcouponId;


- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandlerX:)
                                                 name:@"dismissscan" object:nil];
    objcoupon=[[TblCouponData alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    modcoupon=[[CouponModule alloc]init];
    
    objcoupon=[modcoupon getCouponDetailsWhereCouponId:pcouponId];
     self.title = [objcoupon couponName];
    SiteModule *modSite = [[SiteModule alloc]init];
    arrSiteList =[modSite getSiteFromTable:objcoupon.campaignId];
    
    if (![objcoupon.couponStatus isEqualToString:@"A"]) {
        btnRedeem.hidden = true;
    }
//
//    if ([pcoupon.flag isEqualToString:@"N"]) {
//        
//        NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v6/notification_release/%@",[pcoupon couponId]] param:nil];
//        if(data) {
//            NSError* error;
//            NSDictionary* json = [NSJSONSerialization
//                                  JSONObjectWithData:data
//                                  options:kNilOptions
//                                  error:&error];
//            if ([json objectForKey:@"response"]) {
//                NSDictionary *arritemres = [json objectForKey:@"response"];
//                NSString* response_code = [arritemres valueForKey:@"response_code"];
//                
//                if ([response_code isEqualToString:@"0"]){
//                    NSDictionary *resdict=[json objectForKey:@"notification"];
//                    if ([resdict valueForKey:@"couponId"]) {
//                        
//                        NSString *strCoupon = [resdict valueForKey:@"couponId"];
//                        NSString *strFlag = [resdict valueForKey:@"flag"];
//                        
//                        CouponModule *modcoup = [[CouponModule alloc]init];
//                        [modcoup updateCouponFlag:strCoupon Flag:strFlag];
//                        
//                    }
//                }
//                //Update Coupon count
//                CouponModule *daoCoupon = [[CouponModule alloc]init];
//                NSNumber *badge = [daoCoupon getUnreadTrack];
//                [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[badge integerValue]];
//            }
//        }
//    }
}

- (void)viewDidAppear:(BOOL)animated {
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
//    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"specialbgx.jpg"]];
//    self.tableView.backgroundView.layer.zPosition -= 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
   
        if (indexPath.row == 0) {
            cellgeneral = [tableView dequeueReusableCellWithIdentifier:@"cellimg" forIndexPath:indexPath];
            
            [cellgeneral.imgProduct sd_setImageWithURL:[NSURL URLWithString:[objcoupon productImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
            
            if (objcoupon.referEmail == NULL)
                [cellgeneral.lblemail setText:@""];
            else
                [cellgeneral.lblemail setText:[NSString stringWithFormat:NSLocalizedString(@"SENTGIFTEMAIL", nil),@"EMamil REfrer"]];
           
            
            NSDictionary* attrs = @{
                                    NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                    };
            
            NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",@"INR",[objcoupon orginalPrice]] attributes:attrs];
            cellgeneral.lblOriginalPrice.attributedText = attrText;
            
            cell = cellgeneral;
            
        } else if (indexPath.row == 1) {
            ProductViewCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"cellmer" forIndexPath:indexPath];
            cellproduct.lblProductName.text = [objcoupon couponName];
            
            cell = cellproduct;
        } else if (indexPath.row == 2) {
            ProductViewCell *cellprice = [tableView dequeueReusableCellWithIdentifier:@"cellprice" forIndexPath:indexPath];
            if([objcoupon.brand isEqualToString:@"F"])
                cellprice.lblPrice.text = [NSString stringWithFormat:@"Free Coupon"];
            else
                cellprice.lblPrice.text = [NSString stringWithFormat:@"%@ %@",@"INR",[objcoupon sellingPrice]];
//            NSMutableAttributedString *originalPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"ORIGINAL", nil),[NSString stringWithFormat:@"%@ %@",@"INR",[objcoupon orginalPrice]]]];
//            NSMutableAttributedString *nowPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"NOW", nil),[NSString stringWithFormat:@"%@ %@",@"INR",[objcoupon sellingPrice]]]];
//            
//            [originalPrice addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [originalPrice length])];
//            
//            [originalPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [originalPrice length])];
//            if ([[tblProd originalPrice] isEqualToNumber:[NSNumber numberWithDouble:0]]) {
//                cellprice.lblPrice.attributedText = nowPrice;
//            }else{
//                NSMutableAttributedString *price = [originalPrice mutableCopy];
//                [price appendAttributedString:nowPrice];
//                
//                [cellprice.lblPrice setAttributedText:price];
//            }
            
            cell = cellprice;
        } else if (indexPath.row == 3) {
            CouponCell *cellexpiry = [tableView dequeueReusableCellWithIdentifier:@"cellexpiry" forIndexPath:indexPath];
            if(objcoupon.endDate.length>10){
                NSString *newStr = [[objcoupon endDate] substringWithRange:NSMakeRange(0, 10)];
                
                NSTimeInterval timest = [newStr  doubleValue];
                NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd-MM-yyyy"];
                NSString *enddate = [formatter stringFromDate:dt];
            cellexpiry.lblexpiryDate.text = [NSString stringWithFormat:NSLocalizedString(@"EXPIRYDATE", nil),enddate];
            }
            if ([[objcoupon dailyLimitType] isEqualToString:@"A"]) {
                cellexpiry.lblRedeemLeft.hidden=NO;
                [cellexpiry.lblRedeemLeft setAdjustsFontSizeToFitWidth:YES];
                NSString *redeem = NSLocalizedString(@"left", nil);
                cellexpiry.lblRedeemLeft.text = [NSString stringWithFormat:@"%@:%@",redeem,[objcoupon redemptionQuota]];
            }else {
                cellexpiry.lblRedeemLeft.hidden=YES;
            }
            cell = cellexpiry;
        } else if (indexPath.row == 4) {
            ProductViewCell *celltop = [tableView dequeueReusableCellWithIdentifier:@"celltop" forIndexPath:indexPath];
            cell = celltop;
        } else if (indexPath.row == 5) {
            cellcoupon = [tableView dequeueReusableCellWithIdentifier:@"cellcoupon" forIndexPath:indexPath];
            cellcoupon.lblcouponno.text = [objcoupon couponNo];
            cell = cellcoupon;
        } else if (indexPath.row == 6) {
            ProductViewCell *cellproddesctitle = [tableView dequeueReusableCellWithIdentifier:@"cellproddesctitle" forIndexPath:indexPath];
            cell = cellproddesctitle;
        } else if (indexPath.row == 7) {
            ProductViewCell *cellproddesc = [tableView dequeueReusableCellWithIdentifier:@"cellproddesc" forIndexPath:indexPath];
            cellproddesc.lblProductDesc.text = [objcoupon productDesc];
            cell = cellproddesc;
        } else if (indexPath.row == 8) {
            ProductViewCell *celltc = [tableView dequeueReusableCellWithIdentifier:@"celltc" forIndexPath:indexPath];
            celltc.txttermcond.text = [objcoupon campaignTc];
            cell = celltc;
        } else if (indexPath.row == 9) {
            ProductViewCell *cellmenu = [tableView dequeueReusableCellWithIdentifier:@"cellmenu" forIndexPath:indexPath];
                [cellmenu.contentView setHidden:true];
            cell = cellmenu;
            
        } else if (indexPath.row == 10) {
            ProductViewCell *cellspacer = [tableView dequeueReusableCellWithIdentifier:@"cellspacer" forIndexPath:indexPath];
            cell = cellspacer;
        } else if (indexPath.row == 11) {
            ProductViewCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"cellnotes" forIndexPath:indexPath];
            [cellproduct.btnSupport addTarget:self action:@selector(btncallPhone:) forControlEvents:UIControlEventTouchUpInside];
            [cellproduct.btnShare addTarget:self action:@selector(btnShare:) forControlEvents:UIControlEventTouchUpInside];
            cell = cellproduct;
        } else if (indexPath.row == 12) {
            ProductViewCell *cellbottom = [tableView dequeueReusableCellWithIdentifier:@"cellbottom" forIndexPath:indexPath];
            cell = cellbottom;
        }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ((indexPath.section == 0) && (indexPath.row == 0)) {
        return 290.0;
    }else     if ((indexPath.section == 0) && (indexPath.row == 1)) {
        NSString *trimmedString = [objcoupon.couponName stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]}
                                                      context:nil];
        
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 7)) {
        NSString *trimmedString = [objcoupon.productDesc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                      context:nil];
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 8)) {
        NSString *trimmedString = [objcoupon.campaignTc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                      context:nil];
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 2)) {
        return 20;
    }else     if ((indexPath.section == 0) && (indexPath.row == 3)) {
        return 25;
    }else     if ((indexPath.section == 0) && (indexPath.row == 4)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 10)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 11)) {
        return 60;
    }
    else     if ((indexPath.section == 0) && (indexPath.row == 12)) {
        return 10;
    }
    else     if ((indexPath.section == 0) && (indexPath.row == 9)) {
        return 0;
    }
    return 30;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showsitelist"]) {
        SiteListTableViewController *vcsitelist = segue.destinationViewController;
        vcsitelist.arrSiteList = arrSiteList;
    }
    else if ([segue.identifier isEqualToString:@"showread"]) {
        TermsConditionView *terms = segue.destinationViewController;
        terms.reviewUrl = [objcoupon reviewUrl];
    }
    else if ([segue.identifier isEqualToString:@"ordertype"]) {
        DeliveryController *delivery = segue.destinationViewController;
        delivery.objcoupon = objcoupon;
        delivery.strType =@"scan";
        delivery.pparent = self;
        
    }
    
    else if ([segue.identifier isEqualToString:@"showscan"]) {
        
        ScanCouponViewController *scan = segue.destinationViewController;
        scan.objcoupon = objcoupon;
        scan.strType =@"scan";
        scan.pparent = self;
    }  else if ([segue.identifier isEqualToString:@"detail"]) {
        
        OrderDetailController *order = segue.destinationViewController;
        order.CouponId = [objcoupon couponId];
    }   else if ([segue.identifier isEqualToString:@"howto"]) {
        HowToRedeemView *show = segue.destinationViewController;
        
        
    } else if ([segue.identifier isEqualToString:@"trmenu"]) {
        TodaysMenuController *menu = segue.destinationViewController;
//        menu.nGroupProdId = [tblProd prodId];
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        // [modloader loadProductDetails:[tblProd prodId]];
//        [modloader loadProductDetails:[tblProd prodId] latitude:latitude longitude:longitude];
    } else if ([segue.identifier isEqualToString:@"showgift"]) {
        SendGiftViewController *gift = segue.destinationViewController;
        gift.couponID = [objcoupon couponId];
    }
    
}

- (IBAction)btnRedeem_Touch:(id)sender {
    TblCouponData *serobjcoupon=[modcoupon getCouponDetailsFromServer:[objcoupon couponId]];
    if([serobjcoupon.couponStatus isEqualToString:@"R"]){
        [self performSegueWithIdentifier:@"alreadyredeem" sender:self];
    } else {
//               NSString *stockqty=[modcoupon getCouponStockDetailsFromServerCampaignId:[objcoupon campaignId] couponId:[objcoupon couponId]];

        
        NSString *stockqty=[modcoupon RedeemCouponStockDetailsFromServerCampaignId:[objcoupon campaignId] couponId:[objcoupon couponId]];
        
//        if([stockqty intValue]>0){
            if(objcoupon.couponStatus){
//                    if ([[objcoupon pickup] isEqualToString:@"A"] || [[objcoupon delivery] isEqualToString:@"A"] || [[objcoupon booking] isEqualToString:@"A"] || [[objcoupon outcall] isEqualToString:@"A"]){
//                        [self performSegueWithIdentifier:@"ordertype" sender:self];
//                    }else{
                        [self performSegueWithIdentifier:@"showscan" sender:self];
//                    }
//                }
           }else{
            [self performSegueWithIdentifier:@"notdone" sender:self];
            //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Product Out of Stock"
            //                            message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //        [alert show];
        }
        
    }

}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btncallPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", [Common getMerchantHotline]]]];
}
- (IBAction)btnShare:(id)sender {
    
//    NSString *imageurl=@"";
//    if(productImages.count>0){
//        TblCampaignImage *objimg=productImages[0];
//        imageurl=[objimg campaignImage];
//    }
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[objcoupon productImageurl]]]];
    
    
    NSString *prodname= [objcoupon couponName];
    
    NSString *price= [NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objcoupon sellingPrice]];
    BranchUniversalObject *branchUniversalObject = [[BranchUniversalObject alloc] initWithCanonicalIdentifier:[NSString stringWithFormat:@"Coupon://CouponDtl?couponId=%@",[objcoupon couponId]]];
    branchUniversalObject.title = [objcoupon couponName];
    
    branchUniversalObject.imageUrl =[objcoupon productImageurl] ;
    
    
    BranchLinkProperties *linkProperties = [[BranchLinkProperties alloc] init];
    linkProperties.feature = @"sharing";
    
    
    [branchUniversalObject getShortUrlWithLinkProperties:linkProperties andCallback:^(NSString *url, NSError *err) {
        
        NSArray *itemsToShare = @[img,prodname,price,url];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll]; //or whichever you don't need
        [self presentViewController:activityVC animated:YES completion:nil];
    }];

}

- (IBAction)btnOrder_Touch:(id)sender {
    CouponOrderModule *modcupodr=[[CouponOrderModule alloc]init];
    [modcupodr getCouponOrderDetailsFromServer:objcoupon.couponId];
    TblOrderData *objorder=[modcupodr getCouponOrderData:objcoupon.couponId];
    if (objorder)
        [self performSegueWithIdentifier:@"detail" sender:self];
    
    else
        [self performSegueWithIdentifier:@"instoreredeem" sender:self];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
   
}

-(void)myNotificationListHandlerX:(NSNotification *)notice {
    
    NSString *strDone = [notice object];
    if ([strDone isEqualToString:@"donescan"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.tableView reloadData];
    }
}

@end
