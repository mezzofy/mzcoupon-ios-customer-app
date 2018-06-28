//
//  DeliveryController.m
//  EB
//
//  Created by Kaliyarajalu on 25/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "DeliveryController.h"
#import "ScanCouponViewController.h"
#import "ItemViewController.h"
#import "DeliveryCell.h"
#import "SiteModule.h"
#import "ProductModule.h"
#import "TblProduct.h"
#import "TblSite.h"
#import "Utils.h"
#import "PreviewController.h"
#import "CouponModule.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface DeliveryController () {
    
    NSMutableArray *arrSiteList;
    
    NSIndexPath* checkedIndexPath;
    
    NSString *orderType;
    NSString *selectedSiteId;
    
    BOOL bsitecheck;
    int count;
    NSString *deliveryadrs;
    SiteModule *objsite;
    CLLocationManager *manager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;

}
@end

@implementation DeliveryController
@synthesize objcoupon;


- (void)viewDidLoad {
    [super viewDidLoad];
    arrSiteList=[[NSMutableArray alloc]init];
    objsite=[[SiteModule alloc]init];
    
    manager = [[CLLocationManager alloc] init];
    
    geocoder = [[CLGeocoder alloc] init];
    
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    [manager startUpdatingLocation];

    count = 0;
    
}

- (void)viewDidAppear:(BOOL)animated {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    if (section == 0) {
        return 3;
    } else if (section == 1 && [arrSiteList count] > 0) {
        return [arrSiteList count];
    }else if (section == 1 && ([orderType isEqualToString:@"D"] ||[orderType isEqualToString:@"C"] )) {
        return 1;
    }else if (section == 2 && (selectedSiteId!=NULL || (deliveryadrs.length>2 && bsitecheck))) {
        return 1;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = NULL;
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            DeliveryCell *dlvrcell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            
            cell = dlvrcell;
            
        } else if (indexPath.row == 1) {
            DeliveryCell *dlvrcell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
            if ([[objcoupon typeService] isEqualToString:@"P"]) {
                dlvrcell1.lblSelect.text=NSLocalizedString(@"PICKUPL", nil);
                dlvrcell1.lblSelect.font=[UIFont systemFontOfSize:15];
            } else if ([[objcoupon typeService] isEqualToString:@"S"]) {
                dlvrcell1.lblSelect.text=NSLocalizedString(@"BOOKINGL", nil);
                dlvrcell1.lblSelect.font=[UIFont systemFontOfSize:15];
            }
            if ([[objcoupon typeService] isEqualToString:@"P"]) {
                if ([[objcoupon pickup] isEqualToString:@"A"] ) {
                    dlvrcell1.lblSelect.hidden = NO;
                } else {
                    dlvrcell1.lblSelect.hidden = YES;
                }
            } else if ([[objcoupon typeService] isEqualToString:@"S"]) {
                if ([[objcoupon booking] isEqualToString:@"A"] ) {
                    dlvrcell1.lblSelect.hidden = NO;
                } else {
                    dlvrcell1.lblSelect.hidden = YES;
                }
            }
            
            if ([orderType isEqualToString:@"P"] || [orderType isEqualToString:@"B"])
                dlvrcell1.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                dlvrcell1.accessoryType = UITableViewCellAccessoryNone;
            
            cell = dlvrcell1;
            
        } else if (indexPath.row == 2) {
            DeliveryCell *dlvrcell1 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
            if ([[objcoupon typeService] isEqualToString:@"P"]) {
                dlvrcell1.lblSelect.text=NSLocalizedString(@"DELIVERYL", nil);
                dlvrcell1.lblSelect.font=[UIFont systemFontOfSize:15];
            } else if ([[objcoupon typeService] isEqualToString:@"S"]) {
                dlvrcell1.lblSelect.text=NSLocalizedString(@"OUTCALLL", nil);
                dlvrcell1.lblSelect.font=[UIFont systemFontOfSize:15];
            }
            
            if ([[objcoupon typeService] isEqualToString:@"P"]) {
                if ([[objcoupon delivery] isEqualToString:@"A"]) {
                    dlvrcell1.lblSelect.hidden = NO;
                } else {
                    dlvrcell1.lblSelect.hidden = YES;
                }
            } else if ([[objcoupon typeService] isEqualToString:@"S"]) {
                if ([[objcoupon outcall] isEqualToString:@"A"] ) {
                    dlvrcell1.lblSelect.hidden = NO;
                } else {
                    dlvrcell1.lblSelect.hidden = YES;
                }
            }
            
            if ([orderType isEqualToString:@"D"] || [orderType isEqualToString:@"C"])
                dlvrcell1.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                dlvrcell1.accessoryType = UITableViewCellAccessoryNone;
            
            cell = dlvrcell1;
        }
    }
    
    if (indexPath.section == 1) {
        
        if ([orderType isEqualToString:@"P"] || [orderType isEqualToString:@"B"])
        {
            DeliveryCell *dlvsite = [tableView dequeueReusableCellWithIdentifier:@"pickup" forIndexPath:indexPath];
            if ([arrSiteList count] > 0) {
                
                TblSite *tblSite = [arrSiteList objectAtIndex:indexPath.row];
                dlvsite.lblSiteName.text = [tblSite siteName];
                dlvsite.lblSiteAddress.text = [tblSite siteAddress];
                
                if(selectedSiteId != NULL && [selectedSiteId isEqualToString:[tblSite siteId]])
                    dlvsite.accessoryType = UITableViewCellAccessoryCheckmark;
                else
                    dlvsite.accessoryType = UITableViewCellAccessoryNone;
            }
            cell = dlvsite;
        }
        
        else if ([orderType isEqualToString:@"D"] || [orderType isEqualToString:@"C"])
        {
            DeliveryCell *dlvsite = [tableView dequeueReusableCellWithIdentifier:@"delivery" forIndexPath:indexPath];
          
            dlvsite.textsetaddress.text=deliveryadrs;
          
            [dlvsite.btnAdress addTarget:self action:@selector(btnaddress_Touch:) forControlEvents:UIControlEventTouchUpInside];
            [dlvsite.textsetaddress setDelegate:self];
            dlvsite.textsetaddress.tag = 11;
            [manager stopUpdatingLocation];
            
        cell = dlvsite;
        }
    }
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            DeliveryCell *dlvorder = [tableView dequeueReusableCellWithIdentifier:@"order" forIndexPath:indexPath];
            [dlvorder.btnOrder addTarget:self action:@selector(btnOrderNow_Touch:) forControlEvents:UIControlEventTouchUpInside];
            
            cell = dlvorder;
        }
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    
    
    
    if ([[objcoupon typeService] isEqualToString:@"P"]) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            orderType =@"redeem";
            [self clearList];
            [self performSegueWithIdentifier:@"showscan1" sender:self];
        } else if (indexPath.section == 0 && indexPath.row == 1) {
            orderType =@"P";
            [self clearList];
            arrSiteList=[objsite getSiteFromTable:objcoupon.campaignId];
            [self.tableView reloadData];
        } else if (indexPath.section == 0 && indexPath.row == 2) {
            orderType =@"D";
            [self clearList];
            bsitecheck=TRUE;
            manager.delegate = self;
            manager.desiredAccuracy = kCLLocationAccuracyBest;
            if(IS_OS_8_OR_LATER){
                [manager requestWhenInUseAuthorization];
            }
            [manager startUpdatingLocation];


            [self.tableView reloadData];
        }
        else if (indexPath.section == 1 && ( [orderType isEqualToString:@"P"])) {

            TblSite *tblsite = NULL;
            NSString *otype =@"";

            tblsite = [arrSiteList objectAtIndex:indexPath.row];
            otype = PickUp;
            selectedSiteId = [tblsite siteId];
            [self.tableView reloadData];
        }
        else if (indexPath.section == 1 && ([orderType isEqualToString:@"D"])) {

            NSString *otype =@"";
            otype =Delivery;
            [self.tableView reloadData];
        }
       
    }
    else if ([[objcoupon typeService] isEqualToString:@"S"]) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            orderType =@"redeem";
            [self clearList];
            [self performSegueWithIdentifier:@"showscan1" sender:self];
        }
        else if (indexPath.section == 0 && indexPath.row == 1) {
            orderType =@"B";
            [self clearList];
            arrSiteList = [objsite getSiteFromTable:objcoupon.campaignId];
            [self.tableView reloadData];
        } else if (indexPath.section == 0 && indexPath.row == 2) {
            orderType =@"C";
            [self clearList];
            bsitecheck=TRUE;
            manager.delegate = self;
            manager.desiredAccuracy = kCLLocationAccuracyBest;
            if(IS_OS_8_OR_LATER){
                [manager requestWhenInUseAuthorization];
            }
            [manager startUpdatingLocation];

            
            
            [self.tableView reloadData];
        }
        else if (indexPath.section == 1 && ([orderType isEqualToString:@"B"])) {

            TblSite *tblsite = NULL;
            NSString *otype =@"";

            tblsite = [arrSiteList objectAtIndex:indexPath.row];
            otype = Booking;
            selectedSiteId = [tblsite siteId];
            
            [self.tableView reloadData];

        }
        else if (indexPath.section == 1 && ([orderType isEqualToString:@"C"])) {

            NSString *otype =@"";
            otype =OutCall;
            

 
            [self.tableView reloadData];
        }
        else if (indexPath.section == 2) {



            [self.tableView reloadData];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[objcoupon typeService] isEqualToString:@"P"]) {
        if (section == 0) {
            return NSLocalizedString(@"SELECTONE", nil);
        } else if (section == 1 && [orderType isEqualToString:@"P"]) {
            return NSLocalizedString(@"PICKUPFROM", nil);
        } else if (section == 1 && [orderType isEqualToString:@"D"]) {
            return NSLocalizedString(@"DELIVERYTO", nil);
        } else {
            return @" ";
        }

        }  else if ([[objcoupon typeService] isEqualToString:@"S"]) {
            if (section == 0) {
                return NSLocalizedString(@"SELECTONE", nil);
        } else if (section == 1 && [orderType isEqualToString:@"B"]) {
            return NSLocalizedString(@"BOOKINGFROM", nil);
        } else if (section == 1 && [orderType isEqualToString:@"C"]) {
            return NSLocalizedString(@"OUTCALLTO", nil);
        } else {
            return @" ";
        }
    }
    return @" ";
}

- (IBAction)btnOrderNow_Touch:(id)sender {
            NSLog(@"%@ %@ ", orderType, selectedSiteId);
        [self performSegueWithIdentifier:@"vcpreview" sender:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section==2)
        return 40.0;
    
    if ([[objcoupon typeService] isEqualToString:@"P"]) {
        
        if (indexPath.section == 0 && (indexPath.row == 1 && [[objcoupon pickup] isEqualToString:@"A"])) {
            return 50.0;
        } else if (indexPath.section == 0 && (indexPath.row == 2 && [[objcoupon delivery] isEqualToString:@"A"])) {
            return 50.0;
        } else if (indexPath.section == 0 && (indexPath.row == 1 && [[objcoupon pickup] isEqualToString:@"I"])) {
            return 0.0;
        } else if (indexPath.section == 0 && (indexPath.row == 2 && [[objcoupon delivery] isEqualToString:@"I"])) {
            return 0.0;
        } else if (indexPath.section == 1 && [orderType isEqualToString:@"P"]) {
            return 100.0;
        } else if (indexPath.section == 1 && [orderType isEqualToString:@"D"]) {
            return 160.0;
        } else {
            return 50.0;
        }
    }
    else if ([[objcoupon typeService] isEqualToString:@"S"]) {
        if (indexPath.section == 0 && (indexPath.row == 1 && [[objcoupon booking] isEqualToString:@"A"])) {
            return 50.0;
        } else if (indexPath.section == 0 && (indexPath.row == 2 && [[objcoupon outcall] isEqualToString:@"A"])) {
            return 50.0;
        } else if (indexPath.section == 0 && (indexPath.row == 1 && [[objcoupon booking] isEqualToString:@"I"])) {
            return 0.0;
        } else if (indexPath.section == 0 && (indexPath.row == 2 && [[objcoupon outcall] isEqualToString:@"I"])) {
            return 0.0;
        } else if (indexPath.section == 1 && [orderType isEqualToString:@"B"]) {
            return 100.0;
        } else if (indexPath.section == 1 && [orderType isEqualToString:@"C"]) {
            return 160.0;
        } else {
            return 50.0;
        }
    }
    return 0.0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showscan1"]) {
        
        ScanCouponViewController *scan = segue.destinationViewController;
        scan.objcoupon = objcoupon;
        scan.flag =@"Redeem";
        scan.strType =self.strType;
        scan.pparent = self.pparent;
    }
//    else if ([segue.identifier isEqualToString:@"selectgroup"]) {
//        ItemViewController *item = segue.destinationViewController;
//        if ([orderType isEqualToString:PickUp] || [orderType isEqualToString:Booking]){
//            item.nGroupProdId = nProdId;
//            item.nSiteId = selectedSiteId;
//            item.sOrderType = orderType;
//            item.sTime = selectedTime;
//            item.saddress=@"";
//            item.nCouponId = [pcoupon couponId];
//            item.strType =self.strType;
//            item.pparent = self.pparent;
//        }else if ([orderType isEqualToString:Delivery] || [orderType isEqualToString:OutCall]){
//            item.nGroupProdId = nProdId;
//            item.nSiteId =  [NSNumber numberWithInt:0];
//            item.sOrderType = orderType;
//            item.sTime = selectedTime;
//            item.saddress=deliveryadrs;
//            item.nCouponId = [pcoupon couponId];
//             item.strType =self.strType;
//            item.pparent = self.pparent;
//        }
//    }
    else if ([segue.identifier isEqualToString:@"vcpreview"]) {
        PreviewController *opts = segue.destinationViewController;
        opts.SelectedProdId=objcoupon.campaignId;
        opts.CouponId=objcoupon.couponId;
        if ([orderType isEqualToString:PickUp] || [orderType isEqualToString:Booking]){
            opts.SelectedSiteId = selectedSiteId;
            opts.OrderType = orderType;
            opts.preaddress=@"";
        } else if ([orderType isEqualToString:Delivery] || [orderType isEqualToString:OutCall]){
           opts.SelectedSiteId = @"";
           opts.OrderType = orderType;
           opts.preaddress=deliveryadrs;
        }
    }
}
    
- (IBAction)btnaddress_Touch:(id)sender{
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    [manager startUpdatingLocation];
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
 
    if (indexPath.section == 1 && ([orderType isEqualToString:@"C"])) {
        
        NSString *otype =@"";
        otype =OutCall;
        selectedSiteId = NULL;
        
        [self.tableView reloadData];
        
    }
    else if (indexPath.section == 1 && ([orderType isEqualToString:@"D"])) {
        
        NSString *otype =@"";
        otype =Delivery;
        selectedSiteId = NULL;
        
        [self.tableView reloadData];
    }
}

- (void)clearList {
    [arrSiteList removeAllObjects];
    selectedSiteId = NULL;
    bsitecheck = FALSE;
}


- (IBAction)btnBack_Touch:(id)sender {
    CouponModule *modcoupon=[[CouponModule alloc]init];
    NSString *stockqty=[modcoupon releaseCouponStockDetailsFromServerCampaignId:[objcoupon campaignId] couponId:[objcoupon couponId]];
    if([[NSString stringWithFormat:@"%@",stockqty] isEqualToString:@"1"])
            [self.navigationController popViewControllerAnimated:YES];
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error"
                                              message:@"Error Occured While Release Stock"
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
- (void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandlerX:)
                                                 name:@"dismiss" object:nil];
}
    
-(void)myNotificationListHandlerX:(NSNotification *)notice {
    
    NSString *strDone = [notice object];
    if ([strDone isEqualToString:@"done"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.tableView reloadData];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        if (section == 3)
            return 5.0;
        else
            return UITableViewAutomaticDimension;
}
    
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    if(textView.tag==11) {
        deliveryadrs=[textView text];

        if ([orderType isEqualToString:@"C"]) {
            
            NSString *otype =@"";
            otype =OutCall;
            [self.tableView reloadData];
            
        }
        else if ([orderType isEqualToString:@"D"]) {
            
            NSString *otype =@"";
            otype =Delivery;
            [self.tableView reloadData];
        }
      
    }
    
    return TRUE;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
    
#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"Error: %@", error);
    NSLog(@"Failed to get location! :(");
    
}

- (void)locationManager:(CLLocationManager *)manager1 didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error == nil && [placemarks count] > 0) {
            
            placemark = [placemarks lastObject];
            
            deliveryadrs= [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                           placemark.subThoroughfare, placemark.thoroughfare,
                           placemark.postalCode, placemark.locality,
                           placemark.administrativeArea,
                           placemark.country];
            [manager stopUpdatingLocation];
            [self.tableView reloadData];
            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}

@end
