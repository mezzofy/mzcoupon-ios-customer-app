//
//  ProductDetailController.m
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "ProductDetailController.h"

#import "UIImageView+WebCache.h"

#import "SiteMapController.h"
#import "SiteListTableViewController.h"
#import "TermsConditionView.h"
#import "ProductViewCell.h"
#import "TblProductOrderModel.h"
#import "TodaysMenuController.h"
#import "Dbhelp.h"
#import "TblProductOrderDtl.h"
#import "Utils.h"
#import "CartViewController.h"
#import "PagedImageScrollView.h"
#import "CouponPaymentModule.h"
#import "ImageViewController.h"
#import "XCDYouTubeVideoPlayerViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>
#import "Branch.h"
#import "BranchUniversalObject.h"
#import "BranchLinkProperties.h"
#import "DLManager.h"
#import "ProductModule.h"
#import "SiteModule.h"
#import "CampaingroupDao.h"
#import "LoaderModule.h"
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "TblCampaignImage.h"
#import "CartModule.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface ProductDetailController () {

    NSMutableArray *arrSiteList;
    NSString *Quatity;
    NSNumber *_txnQty;
    double _txntotal;
    ProductViewCell *cellgeneral;
    TblProduct *objprod;
    NSMutableArray *productImages;
    PagedImageScrollView *pageScrollView ;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
}
@end

@implementation ProductDetailController
@synthesize campid,btnclick,btnfav,ChannelCode;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    
    objprod=[[TblProduct alloc]init];
    _txnQty = [NSNumber numberWithInt:1];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self LoadDataFromServer];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)LoadDataFromServer{
    ProductModule *modprod=[[ProductModule alloc]init];
    [modprod loadProductDetailsFromServerCampaignID:campid Latitude:curlatitude Longitude:curlongitude];
    
    objprod=[modprod getProductsDetail:campid];
    
    productImages=[[NSMutableArray alloc]init];
    productImages=[modprod getCampaignImg:campid];
    
    SiteModule *daoSite = [[SiteModule alloc]init];
    arrSiteList = [daoSite getSiteFromTable:campid];
    self.title = [objprod campaignName];
    
    if ([[objprod brand]isEqualToString:@"F"]) {
        [btnclick setTitle:NSLocalizedString(@"DOWNLOADCOUPON", nil) forState:UIControlStateNormal];
        
    }   else if ([[objprod brand]isEqualToString:@"C"]){
        _txntotal = [self getCartItemTotal];
        NSString *str=[NSString stringWithFormat:NSLocalizedString(@"ADDTOCARTQTY",nil), [NSString stringWithFormat:@"%@ %.2f",[Common getMerchantCurrency],_txntotal]];
        [btnclick setTitle:str forState:UIControlStateNormal];
        
    }
    btnfav.target = self;
    btnfav.action = @selector(btnFavourite_Touch:);
    if([objprod.favourite isEqualToString:@"Y"])
        [btnfav setImage:[UIImage imageNamed:@"starz.png"]];
    else
        [btnfav setImage:[UIImage imageNamed:@"star.png"]];
    

    [self.tableView reloadData];
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)addPlayButton:(NSString*)videoid {
    int size = cellgeneral.bounds.size.height/2;
    int x =cellgeneral.bounds.size.width/2;
    int y =cellgeneral.bounds.size.height/2;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(x-(size/2),y-(size/2), size, size);
    
    UIImage *buttonBkground;
    buttonBkground = [UIImage imageNamed:@"video-play-button.png"];
    UIImage *newImage = [buttonBkground stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnplayvideo:) forControlEvents:UIControlEventTouchUpInside];
    [cellgeneral addSubview:button];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
 
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cellgeneral = [tableView dequeueReusableCellWithIdentifier:@"cellimg" forIndexPath:indexPath];
            
            if ([productImages count]>0) {
                pageScrollView = [[PagedImageScrollView alloc] initWithFrame:cellgeneral.bounds];
                [pageScrollView setScrollViewUrlContents:productImages];
                [cellgeneral  addSubview:pageScrollView];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
                
                tapGesture.numberOfTapsRequired=1;
                [cellgeneral.imgProduct setUserInteractionEnabled:YES];
                [cellgeneral addGestureRecognizer:tapGesture];
                
            }else{
                [cellgeneral.imgProduct setImage:[UIImage imageNamed:@"noimg.jpg"]];
                cellgeneral.imgProduct.frame = CGRectMake(0, 0, self.view.frame.size.width,290);
                cellgeneral.imgProduct.contentMode = UIViewContentModeScaleAspectFill;
                cellgeneral.imgProduct.clipsToBounds = YES;
            }
            if([objprod videoUrl] != Nil && [objprod.videoUrl length] > 0){
                [self addPlayButton:[objprod videoUrl]];
            }
           cell = cellgeneral;
        } else if (indexPath.row == 1) {
            ProductViewCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"cellmer" forIndexPath:indexPath];
            cellproduct.lblProductName.text = [objprod campaignName];
            
            cell = cellproduct;
        } else if (indexPath.row == 2) {
            ProductViewCell *cellprice = [tableView dequeueReusableCellWithIdentifier:@"cellprice" forIndexPath:indexPath];
            
            NSMutableAttributedString *originalPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"ORIGINAL", nil),[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod orginalPrice]]]];
            
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
            NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
            [formatter setGroupingSeparator:groupingSeparator];
            [formatter setGroupingSize:3];
            [formatter setAlwaysShowsDecimalSeparator:NO];
            [formatter setUsesGroupingSeparator:YES];
            NSString *formattedString = [objprod sellingPrice];
            NSMutableAttributedString *nowPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"NOW", nil),[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],formattedString]]];
            
            [originalPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [originalPrice length])];
            
            [originalPrice addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [originalPrice length])];
            
            if ([objprod.brand isEqualToString:@"F"])
                cellprice.lblPrice.text = [NSString stringWithFormat:@"Free Coupon"];
            else
                cellprice.lblPrice.attributedText =  originalPrice;
            if([objprod.brand isEqualToString:@"C"])
            cellprice.lblNowPrice.attributedText = nowPrice;
            else
                cellprice.lblNowPrice.hidden=YES;
            //distance
            NSString *sold = NSLocalizedString(@"sold",nil);
            NSString *left = NSLocalizedString(@"left",nil);
            NSString *due = NSLocalizedString(@"Expiryin",nil);
//            NSString *limit = NSLocalizedString(@"limit",nil);
            [cellprice.lblDistance setAdjustsFontSizeToFitWidth:YES];
           
//            if ([[objprod dailyLimitType]isEqualToString:@"A"]) {
//                cellprice.lblDistance.hidden = NO;
            cellprice.lblDistance.text = [NSString stringWithFormat:@"%@ %d",left,([objprod.totalRedeem intValue]-[objprod.issuedcoupon intValue])];
//            }else
//                cellprice.lblDistance.hidden = YES;

            [cellprice.lblDownload setAdjustsFontSizeToFitWidth:YES];
            cellprice.lblDownload.text = [NSString stringWithFormat:@"%@ %@",sold,[objprod issuedcoupon]];
            [cellprice.lblExpirydays setAdjustsFontSizeToFitWidth:YES];
            NSString *day = NSLocalizedString(@"days", nil);
            NSString *hour = NSLocalizedString(@"Hours", nil);
            if ([[objprod expiryname]isEqualToString:@"D"]) {
                [cellprice.lblExpirydays setText:[NSString stringWithFormat:@"%@ %@ %@",due,[objprod expirydue],day]];
            }else  if ([[objprod expiryname]isEqualToString:@"H"]) {
                [cellprice.lblExpirydays setText:[NSString stringWithFormat:@"%@ %@ %@",due,[objprod expirydue],hour]];
            }
            
            cell = cellprice;
        } else if (indexPath.row == 3) {
            ProductViewCell *celltop = [tableView dequeueReusableCellWithIdentifier:@"celltop" forIndexPath:indexPath];
            cell = celltop;
        } else if (indexPath.row == 4) {
            ProductViewCell *cellproddesctitle = [tableView dequeueReusableCellWithIdentifier:@"cellproddesctitle" forIndexPath:indexPath];
            cell = cellproddesctitle;
        } else if (indexPath.row == 5) {
            ProductViewCell *cellproddesc = [tableView dequeueReusableCellWithIdentifier:@"cellproddesc" forIndexPath:indexPath];
            
            cellproddesc.lblProductDesc.text = [objprod campaignDesc];
            
            cell = cellproddesc;
        }else if (indexPath.row == 6) {
            ProductViewCell *celltc = [tableView dequeueReusableCellWithIdentifier:@"celltc" forIndexPath:indexPath];
            celltc.txttermcond.text = [objprod campaignTc];
            cell = celltc;
        }else if (indexPath.row == 7) {
            ProductViewCell *cellmenu = [tableView dequeueReusableCellWithIdentifier:@"cellmenu" forIndexPath:indexPath];
           
            
            NSMutableArray *arryitem=[[NSMutableArray alloc]init];
            if ([arryitem count]>0) {
                [cellmenu.contentView setHidden:false];
            }
            else{
                [cellmenu.contentView setHidden:true];
            }
            
            cell = cellmenu;
        }  else if (indexPath.row == 8) {
            ProductViewCell *cellspacer1 = [tableView dequeueReusableCellWithIdentifier:@"cellspacer1" forIndexPath:indexPath];
            cell = cellspacer1;
        }else if (indexPath.row == 9) {
            ProductViewCell *celltc = [tableView dequeueReusableCellWithIdentifier:@"cellqty" forIndexPath:indexPath];
            if ([[objprod brand]isEqualToString:@"C"]){
                [celltc.stepper addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventValueChanged];
                celltc.lblQty.text = [NSString stringWithFormat:NSLocalizedString(@"Qty",nil),_txnQty];
            } else {
                [celltc.contentView setHidden:true];
            }
            cell = celltc;
            
        }
        else if (indexPath.row == 10) {
            ProductViewCell *cellspacer = [tableView dequeueReusableCellWithIdentifier:@"cellspacer2" forIndexPath:indexPath];
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
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ((indexPath.section == 0) && (indexPath.row == 0)) {
        return 250.0;
    }else     if ((indexPath.section == 0) && (indexPath.row == 1)) {
        NSString *trimmedString = [objprod.campaignName stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]}
                                                      context:nil];
        
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 5)) {
        
        NSString *trimmedString = [objprod.campaignDesc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290,9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}
                                                      context:nil];
        return textRect.size.height+10;
        
        
    }else     if ((indexPath.section == 0) && (indexPath.row == 6)) {
        NSString *trimmedString = [objprod.campaignTc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}
                                                      context:nil];
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 3)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 8)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 10)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 12)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 2)) {
        return 60;
    }else     if ((indexPath.section == 0) && (indexPath.row == 11)) {
        return 60;
    }else     if ((indexPath.section == 0) && (indexPath.row == 9)) {
        if ([[objprod brand]isEqualToString:@"C"])
            return 40;
        else
            return 0;
    }
    else     if ((indexPath.section == 0) && (indexPath.row == 7)) {
//        ProductModule *daoItem = [[ProductModule alloc]init];
        NSMutableArray *arryitem=[[NSMutableArray alloc]init];
        if ([arryitem count]>0) {
            return 35;
        } else {
            return 0;
        }
        return 30;
    }
    return 30;
}

#pragma mark - UIScrollView delegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yPos = -scrollView.contentOffset.y;
    if (yPos > 0) {
        CGRect imgRect = cellgeneral.imgProduct.frame;
        imgRect.origin.y = scrollView.contentOffset.y;
        imgRect.size.height = 290+yPos;
        cellgeneral.imgProduct.frame = imgRect;
        
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer*)sender{
    
    [self performSegueWithIdentifier:@"showimage" sender:self];
    
}
- (IBAction)btnFavourite_Touch:(id)sender {
    
    
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if([objprod.favourite isEqualToString:@"Y"]){
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"N" tblindex:@"campaignId" tblvalue:objprod.campaignId];
        [btnfav setImage:[UIImage imageNamed:@"star.png"]];
    }
    else{
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"Y" tblindex:@"campaignId" tblvalue:objprod.campaignId];
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"channelCode" flagvalue:ChannelCode tblindex:@"campaignId" tblvalue:objprod.campaignId];
        [btnfav setImage:[UIImage imageNamed:@"starz.png"]];
    }
    ProductModule *modprod=[[ProductModule alloc]init];
    objprod=[modprod getProductsDetail:campid];
    [self.tableView reloadData];
    
}

- (IBAction)stepperTapped:(UIStepper *)sender{
    int value = (int)[sender value]+1;
    if (value !=0) {
        _txnQty = [NSNumber numberWithInt:value];
        [self.tableView reloadData];
    }
    if ([[objprod brand]isEqualToString:@"C"]){
        
        _txntotal = [self getCartItemTotal];
        
        NSString *str=[NSString stringWithFormat:NSLocalizedString(@"ADDTOCARTQTY",nil), [NSString stringWithFormat:@"%@ %.2f",[Common getMerchantCurrency],_txntotal]];
        [btnclick setTitle:str forState:UIControlStateNormal];
    }
    
}

- (IBAction)btnAddCart_Touch:(id)sender {
    
    if ([[Common getCustomertype]isEqualToString:@"G"]) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@""
                                              message:NSLocalizedString(@"Pleasesignuptocontinue",nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       Dbhelp* db = [[Dbhelp alloc]init];
                                       [db DeleteTables];
                                       NSBundle *bundle = [NSBundle mainBundle];
                                       NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
                                       UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
                                       UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
                                       
                                       [self presentViewController:vc animated:NO completion:^{[[NSNotificationCenter defaultCenter] postNotificationName:@"GuestSignOut" object:@"GuestSignOut"];}];
                                   }];

        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){}];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
    }else if (([[Common getCustomertype]isEqualToString:@"F"] ||[[Common getCustomertype]isEqualToString:@"C"])&&([[objprod brand]isEqualToString:@"F"] )) {
        CouponPaymentModule *modcoup=[[CouponPaymentModule alloc]init];
       
        NSString * couponcount=[modcoup checkAvalibalityInServer:[objprod campaignId] CouponQuantity:[NSString stringWithFormat:@"%@",_txnQty]];
        if([couponcount isEqualToString:@"0"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:[NSString stringWithFormat:@"%@ Coupons Not Avaliable",_txnQty]
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           
                                       }];
            [alertController addAction:okAction];

            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
        }else{
            NSString *strcode =  [[NSUUID UUID] UUIDString];
            
            ProductOrderListDataModel *objprodOdrList=[[ProductOrderListDataModel alloc]init];
            ProductOrderData *tblprod=[[ProductOrderData alloc]init];
            [tblprod setCustomerId:[Common getCustomerId]];
            [tblprod setPoNo:strcode];
            [tblprod setPoStatus:@"A"];
            [tblprod setPayReceipt:@""];
            [tblprod setPayResponse:@"0"];
            [tblprod setCouponType:@"F"];
            
            ProductOrderDtlData *tblproddtl=[[ProductOrderDtlData alloc]init];
            [tblproddtl setCampaignId:[objprod campaignId]];
            [tblproddtl setCampaignQty:[NSString stringWithFormat:@"%@",_txnQty]];
            
            ProductOrderDataModel *tblproOdrmd=[[ProductOrderDataModel alloc]init];
            [tblproOdrmd setPodetail:tblproddtl];
            NSMutableArray *arrmod=[[NSMutableArray alloc]init];
            [arrmod addObject:tblproOdrmd];
            
            [objprodOdrList setPo:tblprod];
            [objprodOdrList setPodetails:arrmod];
            NSString *retval;
            if([objprod.favourite isEqualToString:@"Y"])
                retval =[modcoup downloadFreeCouponWithChannelFromServer:objprod.channelCode Data:objprodOdrList];
            else
                retval =[modcoup downloadFreeCouponWithChannelFromServer:ChannelCode Data:objprodOdrList];
        
        if ([retval isEqualToString:@"SUCCESS"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:NSLocalizedString(@"DOWNLOADEDCOUPON", nil)
                                                  message:NSLocalizedString(@"DOWNLOADEDCOUPONMSG", nil)
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           [self.navigationController popViewControllerAnimated:YES];
                                       }];
            [alertController addAction:okAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
        }else{
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:retval
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           
                                       }];
            [alertController addAction:okAction];

            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
        }
        }
    }
    
    else if (([[Common getCustomertype]isEqualToString:@"F"] ||[[Common getCustomertype]isEqualToString:@"C"])&&([[objprod brand]isEqualToString:@"C"] )) {
        CouponPaymentModule *modcoup=[[CouponPaymentModule alloc]init];
        
        //check coupon avaliablity
        NSString * couponcount=[modcoup checkAvalibalityInServer:[objprod campaignId] CouponQuantity:[NSString stringWithFormat:@"%@",_txnQty]];
        if([couponcount isEqualToString:@"0"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:[NSString stringWithFormat:@"%@ Coupons Not Avaliable",_txnQty]
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           
                                       }];
            [alertController addAction:okAction];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
        }else{
            //add to cart function
            CartModule *modcart=[[CartModule alloc]init];
            [objprod setProductQty:[NSString stringWithFormat:@"%@",_txnQty]];
            [objprod setTotalPrice:[NSString stringWithFormat:@"%.2f",[self getCartItemTotal]]];
            if(productImages.count>0){
                TblCampaignImage *objimg=productImages[0];
                [objprod setCampaignImage:objimg.campaignImage];
            }
            [objprod setChannelCode:ChannelCode];
            BOOL res = [modcart addCartItemsData:objprod];
            if (res){
                [[NSNotificationCenter defaultCenter] postNotificationName:@"CartList" object:@"List"];
                UIAlertController *alertController = [UIAlertController
                                                      alertControllerWithTitle:NSLocalizedString(@"ADDEDTOCART", nil)
                                                      message:NSLocalizedString(@"ADDEDTOCARTMSG", nil)
                                                      preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"OK", nil)
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action){
                                               [self.navigationController popViewControllerAnimated:YES];
                                           }];
                [alertController addAction:okAction];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self presentViewController:alertController animated:YES completion:nil];
                });
            }else{
                UIAlertController *alertController = [UIAlertController
                                                      alertControllerWithTitle:@"Error"
                                                      message:@"Some Thing Went Wrong Plz Check"
                                                      preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"OK", nil)
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action){
                                               
                                           }];
                [alertController addAction:okAction];
               
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self presentViewController:alertController animated:YES completion:nil];
                });
            }
        }
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField tag] == 1) {
        _txnQty = [NSNumber numberWithInt:[[textField text] intValue]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
     if ([segue.identifier isEqualToString:@"sitelist"]) {
        SiteListTableViewController *vcsitelist = segue.destinationViewController;
        vcsitelist.arrSiteList = arrSiteList;
    }
    else if ([segue.identifier isEqualToString:@"read"]) {
        TermsConditionView *terms = segue.destinationViewController;
        terms.reviewUrl = objprod.reviewUrl;
    }
    else if ([segue.identifier isEqualToString:@"trmenu"]) {
        
        TodaysMenuController *menu = segue.destinationViewController;
//        menu.nGroupProdId = [tblProd prodId];
//       modloader = [[LoaderModule alloc]init];
        //[modloader loadProductDetails:[tblProd prodId]];
//        [modloader loadProductDetails:[tblProd prodId] latitude:latitude longitude:longitude];
    } else if ([segue.identifier isEqualToString:@"showimage"]) {
        NSLog(@"%ld", (long) scrollpage);
//        tblProdimg=[productImages objectAtIndex:scrollpage];
        ImageViewController *menu = segue.destinationViewController;
        menu.arrPhotos=productImages;
        menu.scrolpage=scrollpage;
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(double)getCartItemTotal{
    double retval = 0;
    
    double itemprice =[[objprod sellingPrice] doubleValue];
    
    retval = [_txnQty intValue] * itemprice;
    
    return retval;
}

// Merchant Hotline
- (IBAction)btncallPhone:(id)sender {
    if([Common getMerchantHotline])
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", [Common getMerchantHotline]]]];
    else{
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@""
                                              message:@"Unable to make a Call"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
        [alertController addAction:okAction];
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
    
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnShare:(id)sender {
    NSString *imageurl=@"";
    if(productImages.count>0){
       TblCampaignImage *objimg=productImages[0];
        imageurl=[objimg campaignImage];
    }
   
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageurl]]];
    
   
    NSString *prodname= [objprod campaignName];
    
    NSString *price= [NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod sellingPrice]];
    BranchUniversalObject *branchUniversalObject = [[BranchUniversalObject alloc] initWithCanonicalIdentifier:[NSString stringWithFormat:@"Coupon://ProductDtl?prodId=%@",[objprod campaignId]]];
    branchUniversalObject.title = [objprod campaignName];
    
    branchUniversalObject.imageUrl =imageurl ;
    
    
    BranchLinkProperties *linkProperties = [[BranchLinkProperties alloc] init];
    linkProperties.feature = @"sharing";
    
    
    [branchUniversalObject getShortUrlWithLinkProperties:linkProperties andCallback:^(NSString *url, NSError *err) {

        NSArray *itemsToShare = @[img,prodname,price,url];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll]; //or whichever you don't need
        [self presentViewController:activityVC animated:YES completion:nil];
    }];
}

- (IBAction)btnplayvideo:(id)sender {
    
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:[objprod videoUrl]];
    videoPlayerViewController.preferredVideoQualities = @[ @(XCDYouTubeVideoQualitySmall240), @(XCDYouTubeVideoQualityMedium360) ];
    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
    [videoPlayerViewController.moviePlayer play];
    
    //    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:[tblProd videoUrl]];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:videoPlayerViewController.moviePlayer];
    //    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
}

- (void) moviePlayerPlaybackDidFinish:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:notification.object];
    MPMovieFinishReason finishReason = [notification.userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] integerValue];
    if (finishReason == MPMovieFinishReasonPlaybackError)
    {
        NSError *error = notification.userInfo[XCDMoviePlayerPlaybackDidFinishErrorUserInfoKey];
        NSLog(@"%@",error);
        // Handle error
    }
}


@end
