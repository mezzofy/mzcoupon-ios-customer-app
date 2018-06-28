    //
//  CartViewController.m
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "CartViewController.h"
#import "UIImageView+WebCache.h"
#import "CartViewCell.h"
#import "Utils.h"
#import "ProductDetailController.h"
#import "EditCartController.h"
#import "Utils.h"
#import "Common.h"
#import "ChoosePaymentController.h"
#import "NetPaymentController.h"
#import "Common.h"
#import "TransferViewController.h"
#import "CartModule.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface CartViewController () {
    CartModule *modcart;
    double sumtot;
    NSString *transno;
    NSMutableArray *arrProductImageList;
    UIImageView *bgView;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;

    
}

@end

@implementation CartViewController

@synthesize lastpage;


- (void)viewDidLoad {
    [super viewDidLoad];
    modcart=[[CartModule alloc]init];
    //Location current
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    
    lastpage = nil;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandler:)
                                                 name:@"CartList" object:nil];
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;


   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
//    if([Common pobjresponse])
//    {
//        respn=[Common pobjresponse];
//        [Common objectrespn:nil];
//        if(respn != Nil && [[respn paystatus] isEqualToString:@"approved"]){
//            CartModule *daocart=[[CartModule alloc]init];
//            [daocart getTransList:respn.svrtransid];
//            [self.tableView reloadData];
//            respn.payresponse = nil;
//            
//            CartModule *daoCart = [[CartModule alloc]init];
//            [daoCart deleteCart];
        
//            [self performSegueWithIdentifier:@"paymentthankyou" sender:self];
//        }else if(respn  != Nil && [[respn paystatus] isEqualToString:@"approved"]== FALSE){
//            respn.payresponse  = nil;
//            [self performSegueWithIdentifier:@"paymentfailure" sender:self];
//        }
//    }else{
//        [self loadCartList];
//        [self.tableView reloadData];
//    }
//    
//    //Resign from Payment
//    if ([[Common payResign] isEqual:@"Y"]) {
//        [Common payResign:@"N"];
//        [self.tabBarController setSelectedIndex:2];
//        
//    }
//    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self loadCartList];
    [self.tableView reloadData];
}
-(void)myNotificationListHandler:(NSNotification *)notice {
    [self loadCartList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    for (UIView* view in bgView.subviews){
        [view removeFromSuperview];
    }
    if([modcart getCartItemsCount] >0)
        return [modcart getCartItemsCount];
    else {
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-cart.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height / 2 - 26 + 50 + 23, self.view.frame.size.width - 20, 52)];
        
        messageLabel.text = NSLocalizedString(@"NOITEMYETINCART", nil);
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.numberOfLines = 2;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        
        [bgView addSubview:messageLabel];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CartViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TblProduct *objprod=[modcart getCartdetailsFromTabels:indexPath.row];
    
    
        [cell.imgProduct  sd_setImageWithURL:[NSURL URLWithString:[objprod campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];

    
        cell.lblMerchtName.text= [objprod campaignName];
        cell.lblProductName.text = [objprod campaignDesc];
        cell.lblProductName.textAlignment = NSTextAlignmentLeft;
        cell.lblProductQty.text = [NSString stringWithFormat:@" X %@", [objprod productQty]];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
        NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
        [formatter setGroupingSeparator:groupingSeparator];
        [formatter setGroupingSize:3];
        [formatter setAlwaysShowsDecimalSeparator:NO];
        [formatter setUsesGroupingSeparator:YES];
        NSString *formattedString = [objprod totalPrice];
         [cell.lblProductPrice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],formattedString]];
//        cell.lblProductPrice.text  = [Utils currencyFormat:[tblCart totalPrice] Currency:[tblComp currency]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        TblProduct *objprod=[modcart getCartdetailsFromTabels:indexPath.row];
        
        
        [modcart deteleCartItemsDataFromTable:objprod.tbl_cart_id];
        
        [self loadCartList];
        [self.tableView reloadData];
    }
}

- (void)loadCartList {
   
    self.title = [NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"dispcartinfo" object:@"display"];
    
    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[modcart getCartItemsCount]];
    
    if (![badgenumber isEqualToString:@"0"])
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:badgenumber];
    else
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:nil];
    
    [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setTitle:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]]];


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editcart"]) {
        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
        TblProduct *objprod=[modcart getCartdetailsFromTabels:indPath.row];
        EditCartController *prods = segue.destinationViewController;
        prods.pcartid = [objprod tbl_cart_id];

    
    }else if([segue.identifier isEqualToString:@"showcard"]){
        
        ChoosePaymentController *vcpayment=segue.destinationViewController;
        vcpayment.title = [NSString stringWithFormat:NSLocalizedString(@"PAYMENT", nil)];

        
    }else if ([segue.identifier isEqualToString:@"showcash"]) {
        TransferViewController *vc = segue.destinationViewController;
        vc.tnamount =[NSNumber numberWithDouble:sumtot];
//        vc.logstatus=[objstaff userType];
//        vc.arrycartitem=arrCartList;

//
//        
//    }else if([segue.identifier isEqualToString:@"paymentthankyou"]){
//
    }
}


- (IBAction)btnPayment_Touch:(id)sender {
    
    
    
    
    
    if ([modcart getCartItemsCount] > 0) {
//         if ([[Common getCustomertype] isEqualToString:@"C"]  || [[Common getCustomertype] isEqualToString:@"F"])
//               [self performSegueWithIdentifier:@"showcash" sender:self];
//             else
                 [self performSegueWithIdentifier:@"showcard" sender:self];

    }else{
        NSString* msg = [NSString stringWithFormat:NSLocalizedString(@"CARTEMPTY!!!", nil)];
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"CART", nil)
                                              message:msg
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
- (NSString *)URLFormated:(NSString *)unescaped {
    NSString *escapedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    NULL,
                                                                                                    (CFStringRef)unescaped,
                                                                                                    NULL,
                                                                                                    CFSTR("!*'();:@&=+$,/?%#[]\" "),
                                                                                                    kCFStringEncodingUTF8));
    return escapedString;
}

@end
