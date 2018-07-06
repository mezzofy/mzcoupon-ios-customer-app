//
//  FavouriteController.m
//  EB
//
//  Created by Kaliyarajalu on 02/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "UIImageView+WebCache.h"

#import "FavouriteController.h"
#import "ProductDetailController.h"
#import "ProductViewCell.h"
#import "Utils.h"
#import "Common.h"
#import "ProductModule.h"
#import "TblCampaignImage.h"
#import "LoaderModule.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

@interface FavouriteController () {
    NSMutableArray *arrFavourite;
    NSMutableArray *arrProductImageList;
    ProductModule *modprod;
    UIImageView *bgView;
    
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}

@end

@implementation FavouriteController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modprod = [[ProductModule alloc]init];
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
   
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    [self.tableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 5;
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    for (UIView *subview in [bgView subviews]) {
        [subview removeFromSuperview];
    }
    if([modprod getFavCampaigncount:@""] >0) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 1;
    }
    else {
        
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-fav.png"];
        [bgView addSubview:dot];

        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"NOTHINGHEREYETBOOKMARKYOURFAVOURITEPRODUCTSFOREASYFUTUREREFERENCE", nil);
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        
        [bgView addSubview:messageLabel];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return 0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [modprod getFavCampaigncount:@""];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    TblProduct *tblprod = [modprod getFavCampaignbyOffset:@"" Offset:indexPath.row];
    
 
        
        arrProductImageList=[modprod getCampaignImg:[tblprod campaignId]];
        
        if ([arrProductImageList count]>0) {
            TblCampaignImage *tblcamp=[arrProductImageList objectAtIndex:0];
            
            [cell.imgProduct sd_setImageWithURL:[NSURL URLWithString:[tblcamp campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
            
        }else{
            [cell.imgProduct  setImage:[UIImage imageNamed:@"noimg.jpg"]];
        }
        //cat img
        [cell.imgCatg setHidden:YES];
        
        
        cell.lblProductName.text = tblprod.campaignName;
        [cell.lblProductName setAdjustsFontSizeToFitWidth:YES];
        
        if ([tblprod.brand isEqualToString:@"F"]) {
            cell.lblOriginalPrice.hidden=YES;
        }
        else{
            cell.lblOriginalPrice.hidden=NO;
            NSDictionary* attrs = @{ NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
            
            NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod orginalPrice]] attributes:attrs];
            
            cell.lblOriginalPrice.attributedText = attrText;
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
            cell.lblPrice.text =[NSString stringWithFormat:@"Free Coupon"];
        else
            cell.lblPrice.text =[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod sellingPrice]];
        
        //remark
        cell.lblFreeText1.text = [tblprod campaignNote1];
        cell.lblFreeText2.text = [tblprod campaignNote2];
        cell.lblFreeText3.text = [tblprod campaignNote3];
        
        //Distance
        NSString *sold = NSLocalizedString(@"sold",nil);
        NSString *left = NSLocalizedString(@"left",nil);
        NSString *due = NSLocalizedString(@"Expiryin",nil);
        NSString *day = NSLocalizedString(@"days", nil);
        NSString *hour = NSLocalizedString(@"Hours", nil);
        [cell.lblDistance setAdjustsFontSizeToFitWidth:YES];
        if ([[tblprod dailyLimitType]isEqualToString:@"A"]) {
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cell.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod redeemcoupon],left,[tblprod totalRedeem]];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cell.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod redeemcoupon],left,[tblprod totalRedeem]];
            }
        }else {
            
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cell.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                           %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod redeemcoupon]];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cell.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                   %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod redeemcoupon]];
            }
            
        }
        
        //fav
        cell.btnFavourite.tag = indexPath.row;
        [cell.btnFavourite addTarget:self action:@selector(btnFavourite_Touch:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([tblprod.favourite isEqualToString:@"Y"]) {
            [cell.btnFavourite setImage:[UIImage imageNamed:@"starz.png"] forState:UIControlStateNormal];
        } else {
            [cell.btnFavourite setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        }
    
    
    
    return cell;
}

- (IBAction)btnFavourite_Touch:(id)sender {
    
    TblProduct *tblprod = [modprod getFavCampaignbyOffset:@"" Offset:[sender tag]];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
    TblProduct *tblprod = [modprod getFavCampaignbyOffset:@"" Offset:indPath.row];

        if ([segue.identifier isEqualToString:@"productdetail"]) {
            ProductDetailController *proDetails = segue.destinationViewController;
            proDetails.campid = [tblprod campaignId];
//            LoaderModule *modloader = [[LoaderModule alloc]init];
            //[modloader loadProductDetails:[tblProd prodId]];
//            [modloader loadProductDetails:[tblProd prodId] latitude:latitude longitude:longitude];
//        }
    }
}


@end
