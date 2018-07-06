//
//  FilteringListViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "FilteringListViewController.h"
#import "CustomCell.h"
#import "FilterCatgViewController.h"
#import "FilterLocationViewController.h"
#import "FilterMerchantViewController.h"
#import "Common.h"
#import "Utils.h"
#import "ProductModule.h"
#import "SiteModule.h"
#import "TblSite.h"
#import "TblCampaign.h"
#import <MZCoupon/MZCoupon.h>


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface FilteringListViewController (){
    ProductModule *modproduct;
    SiteModule *modsite;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
    

}

@end

@implementation FilteringListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    modproduct = [[ProductModule alloc]init];
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
    modsite=[[SiteModule alloc]init];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
   

    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowcount=0;
    if(section==0){
        rowcount= 1;
    }else if(section==1){
        if([Common filterCampaignGroup].count>0)
            rowcount=[Common filterCampaignGroup].count;
        else
            rowcount=1;
    }else if(section==2){
        rowcount=1;
    }else if(section==3){
        if( [Common filterSite].count>0)
            rowcount=[Common filterSite].count;
        else
            rowcount=1;
    }else if(section==4){
        rowcount=1;
    }
    
    return rowcount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    if (indexPath.section == 0) {
        CustomCell *cellgeneral= [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        cellgeneral.lblCategoryCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)[modproduct getCampaignGroupcount]];
        cell = cellgeneral;
    } else if (indexPath.section == 1) {
        CustomCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"Cellcategorylist" forIndexPath:indexPath];
        if([Common filterCampaignGroup].count==0)
          cellproduct.lblCategoryName.text=NSLocalizedString(@"ALLCATEGORIES", nil);
        else{
        CampaignData *objcamp=[[Common filterCampaignGroup] objectAtIndex:indexPath.row];
        cellproduct.lblCategoryName.text=[objcamp campgrpName];
        }
        cell = cellproduct;
    } else if (indexPath.section == 2) {
        CustomCell *cellprice = [tableView dequeueReusableCellWithIdentifier:@"Celllocation" forIndexPath:indexPath];
        cellprice.lblCategoryCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)[modsite getAllSiteFromTableForFilter].count];
        cell = cellprice;
    } else if (indexPath.section == 3) {
        CustomCell *celltop = [tableView dequeueReusableCellWithIdentifier:@"Celllocationlist" forIndexPath:indexPath];
        if([Common filterSite].count==0)
            celltop.lblCategoryName.text=NSLocalizedString(@"ALLLOCATIONS", nil);
        else{
        SiteData *objsite=[[Common filterSite] objectAtIndex:indexPath.row];
        celltop.lblCategoryName.text=[objsite siteName];
        }
        cell = celltop;
    } else if (indexPath.section == 4) {
        CustomCell *dlvorder = [tableView dequeueReusableCellWithIdentifier:@"Cellclear" forIndexPath:indexPath];
        [dlvorder.btnClear addTarget:self action:@selector(BtnOrderNow_Touch:) forControlEvents:UIControlEventTouchUpInside];
        
        cell = dlvorder;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section==0)
        [self performSegueWithIdentifier:@"showcategory" sender:self];
    else if (indexPath.section==2)
        [self performSegueWithIdentifier:@"showlocation" sender:self];
     if (indexPath.section==4){
//        [self performSegueWithIdentifier:@"showmerchant" sender:self];
        [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
        [Common filterSite:[[NSMutableArray alloc]init]];
        [self.tableView reloadData];
    }
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showcategory"]) {
//        FilterCatgViewController *vcfilterlist = segue.destinationViewController;
//
//    }
//
//    else if ([segue.identifier isEqualToString:@"showlocation"]) {
//        FilterLocationViewController *vcfilterlist = segue.destinationViewController;
////        vcfilterlist.plocfilterid=objfilter.locations;
//    }
////    else if ([segue.identifier isEqualToString:@"showmerchant"]) {
////
////        FilterMerchantViewController *vcfilterlist = segue.destinationViewController;
////        vcfilterlist.pmerchfilterid=objfilter.merchants;
////    }
//}
- (IBAction)btnBack_Touch:(id)sender {
    if([Common filterCampaignGroup].count>0||[Common filterSite].count>0){
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Warning"
                                              message:@"Are You sure want to Reset Filter"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Yes", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       [Common filterSite:[[NSMutableArray alloc]init]];
                                       [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
                                       [Common CampaignFilter:@"NO"];
                                       [self.navigationController popViewControllerAnimated:YES];
                                   }];
        
        
        
        UIAlertAction *cancel = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"NO", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        
        [alertController addAction:okAction];
        [alertController addAction:cancel];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
        
    }else
        [self.navigationController popViewControllerAnimated:YES];
   
}

    

- (IBAction)BtnOrderNow_Touch:(id)sender {
    [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
    [Common filterSite:[[NSMutableArray alloc]init]];
    [self.tableView reloadData];
}
- (IBAction)btnApply_Touch:(id)sender{
    [Common CampaignFilter:@"YES"];
    [self.navigationController popViewControllerAnimated:YES];

}



@end
