//
//  SpecialProductController.m
//  EB
//
//  Created by Kaliyarajalu on 04/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "SpecialProductController.h"
#import "LoaderModule.h"
#import "UIImageView+WebCache.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "ProductDetailController.h"
#import "CustomCell.h"
#import "ProductViewCell.h"
#import "Utils.h"
#import "Common.h"
#import "ProductModule.h"
#import "TblCampaignImage.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
@interface SpecialProductController () {
    NSMutableArray *arrProductList;
    NSMutableArray *arrProductImageList;
    CustomCell *cellImg;
    ProductModule *modprod;
    UIActivityIndicatorView *activeIndicator;
    NSNumber* _totalrows;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}

@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;

@end

@implementation SpecialProductController
@synthesize campgrpId;

- (void)viewDidLoad {
    [super viewDidLoad];
    modprod=[[ProductModule alloc]init];
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
    
    
    
    //Image Logo
    UIImageView *navigationImage=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x, 0, 100, 30)];
    navigationImage.image=[UIImage imageNamed:@"navlogo.png"];
    
    self.navigationItem.titleView = navigationImage;
    
    navigationImage.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   if([modprod getCampaignGroupDetailcountCampaignGroupId:campgrpId]>0)
        return [modprod getCampaignGroupDetailcountCampaignGroupId:campgrpId]+1;
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = NULL;
    
    // Configure the cell...
    
    if (indexPath.row == 0) {
        
        cellImg = [tableView dequeueReusableCellWithIdentifier:@"celltheme" forIndexPath:indexPath];
        
        TblCampaign *objcamp=[modprod getCampaignGroup:campgrpId];
        
        
        [cellImg.imgSpecials sd_setImageWithURL:[NSURL URLWithString:[objcamp campgrpImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
        
        
        
        
        cell = cellImg;
        
    } else if (indexPath.row > 0) {
        
        ProductViewCell *cells = [tableView dequeueReusableCellWithIdentifier:@"cellspl" forIndexPath:indexPath];
        TblProduct *tblprod = [modprod getCampaignGroupDetailbyCampaignGroupId:campgrpId Offset:indexPath.row-1];
        
        arrProductImageList=[modprod getCampaignImg:[tblprod campaignId]];
        
        if ([arrProductImageList count]>0) {
            TblCampaignImage *tblcamp=[arrProductImageList objectAtIndex:0];
            
            [cells.imgProduct sd_setImageWithURL:[NSURL URLWithString:[tblcamp campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
            
        }else{
            [cells.imgProduct  setImage:[UIImage imageNamed:@"noimg.jpg"]];
        }
        //cat img
        [cells.imgCatg setHidden:YES];
        
        
        cells.lblProductName.text = tblprod.campaignName;
        [cells.lblProductName setAdjustsFontSizeToFitWidth:YES];
        
        if ([tblprod.brand isEqualToString:@"F"]) {
            cells.lblOriginalPrice.hidden=YES;
        }
        else{
            cells.lblOriginalPrice.hidden=NO;
            NSDictionary* attrs = @{ NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
            
            NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod orginalPrice]] attributes:attrs];
            
            cells.lblOriginalPrice.attributedText = attrText;
        }
        //        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        //        [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
        //        NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
        //        [formatter setGroupingSeparator:groupingSeparator];
        //        [formatter setGroupingSize:3];
        //        [formatter setAlwaysShowsDecimalSeparator:NO];
        //        [formatter setUsesGroupingSeparator:YES];
        //        NSString *formattedString = [formatter stringFromNumber:[tblprod sellingPrice]];
        if([tblprod.brand isEqualToString:@"F"])
            cells.lblPrice.text =[NSString stringWithFormat:@"Free Coupon"];
        else
            cells.lblPrice.text =[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod sellingPrice]];
        
        //remark
        cells.lblFreeText1.text = [tblprod campaignNote1];
        cells.lblFreeText2.text = [tblprod campaignNote2];
        cells.lblFreeText3.text = [tblprod campaignNote3];
        
        //Distance
        NSString *sold = NSLocalizedString(@"sold",nil);
        NSString *left = NSLocalizedString(@"left",nil);
        NSString *due = NSLocalizedString(@"Expiryin",nil);
        NSString *day = NSLocalizedString(@"days", nil);
        NSString *hour = NSLocalizedString(@"Hours", nil);
        [cells.lblDistance setAdjustsFontSizeToFitWidth:YES];
        if ([[tblprod dailyLimitType]isEqualToString:@"A"]) {
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod redeemcoupon],left,[tblprod totalRedeem]];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod redeemcoupon],left,[tblprod totalRedeem]];
            }
        }else {
            
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                           %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod redeemcoupon]];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                   %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod redeemcoupon]];
            }
            
        }
        
        //Hotdeals
        if ([[Common hotdeals]isEqualToString:@"S"]) {
            cells.imgHotdeals.hidden = NO;
            cells.lblHotdeals.hidden = NO;
            cells.lblHotdeals.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
        }else {
            cells.imgHotdeals.hidden = YES;
            cells.lblHotdeals.hidden = YES;
        }
        
        
        //fav
        cells.btnFavourite.tag = indexPath.row;
        [cells.btnFavourite addTarget:self action:@selector(btnFavourite_Touch:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([tblprod.favourite isEqualToString:@"Y"]) {
            [cells.btnFavourite setImage:[UIImage imageNamed:@"starz.png"] forState:UIControlStateNormal];
        } else {
            [cells.btnFavourite setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        }
        cell=cells;
    
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 175;
    } else {
        return 320;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
    if ([modprod getCampaignGroupDetailcountCampaignGroupId:campgrpId] > 0) {
        TblProduct *tblProd = [modprod getCampaignGroupDetailbyCampaignGroupId:campgrpId Offset:indPath.row-1];
        if ([segue.identifier isEqualToString:@"spldetail"]) {
            ProductDetailController *proDetails = segue.destinationViewController;
            proDetails.campid = [tblProd campaignId];
        }
    }
}

- (IBAction)btnFavourite_Touch:(id)sender {
    
    TblProduct *tblprod = [modprod getCampaignGroupDetailbyCampaignGroupId:campgrpId Offset:[sender tag]-1];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if([tblprod.favourite isEqualToString:@"Y"])
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"N" tblindex:@"campaignId" tblvalue:tblprod.campaignId];
    else
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"Y" tblindex:@"campaignId" tblvalue:tblprod.campaignId];
    

    [self.tableView reloadData];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)refreshcontroller
{
    
    [modprod loadCampaigngroupsAndDetailsfromserverLatitude:curlatitude Longitude:curlongitude];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    [modprod loadCampaigngroupsAndDetailsfromserverLatitude:curlatitude Longitude:curlongitude];
    [self.tableView reloadData];
    [refresh endRefreshing];
}




@end
