//
//  LoaderViewController.m
//  EB
//
//  Created by Kaliyarajalu on 27/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "LoaderViewController.h"
#import "Utils.h"
#import "Common.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "ProductModule.h"
#import "LoaderModule.h"
#import "CustomerModule.h"
#import "ProductOrderModule.h"
#import "SiteModule.h"
#import "CouponModule.h"
#import "WalletModule.h"
#import "MerchantModule.h"
#import "CouponOrderModule.h"
#import "PaymentModule.h"

@interface LoaderViewController ()

@end

@implementation LoaderViewController
@synthesize Activity;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//     [self performSegueWithIdentifier:@"showMain" sender:self];
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(myNotificationHandlerX:)
//                                                 name:@"LoaderAction" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void) viewDidAppear:(BOOL)animated {
    
    [self updatefromserver];
    [self performSegueWithIdentifier:@"showMain" sender:self];

}


- (void)updatefromserver {
    MerchantModule *objmerchant=[[MerchantModule alloc]init];
    [objmerchant MerchantDetailsFromServer];
    ProductModule *objprod=[[ProductModule alloc]init];
    [objprod loadProductListFromServer:1 Latitude:0.0 Longitude:0.0];
    SiteModule *modsite=[[SiteModule alloc]init];
    [modsite getSiteFromServer];
    NSLog(@"%@===%@",[Common getCustomertype],[Common getCustomertype]);
    if([[Common getCustomertype]isEqualToString:@"C"]||[[Common getCustomertype]isEqualToString:@"F"]){
        CustomerModule *objcust=[[CustomerModule alloc]init];
        [objcust getCustomerGroupFromServer];
        ProductOrderModule *objprod=[[ProductOrderModule alloc]init];
        [objprod loadProductorderListfromserver:1];
        CouponModule *modcoupon=[[CouponModule alloc]init];
        [modcoupon getCouponCountListfromServer:@"A" Offset:1];
        WalletModule *modwallet=[[WalletModule alloc]init];
        [modwallet getWalletFromServer];
        CouponOrderModule *modorder=[[CouponOrderModule alloc]init];
        [modorder getCouponOrderListFromServer:1];
        PaymentModule *modpayment=[[PaymentModule alloc]init];
        [modpayment loadPaymentListfromserver:1];
                
    }
//   [self performSegueWithIdentifier:@"showMain" sender:self]; 
}

//-(void)myNotificationHandlerX:(NSNotification *)notice {

//    NSString *command = [notice object];
//    
//    NSLog(@"%@",command);
//    if ([command isEqualToString:@"Signout"]) {
//        CustomerModule *modcus = [[CustomerModule alloc]init];
//        StaffModule *modusr = [[StaffModule alloc]init];
//        [modusr clearLoginUser];
//        [modcus clearLoginCustomer];
//        [Common autoLogin:Nil];
//        
//        [self dismissViewControllerAnimated:YES completion:^{
//            NSBundle *bundle = [NSBundle mainBundle];
//            NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
//            UIViewController  *vc=[storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
//            [[[UIApplication sharedApplication] keyWindow] setRootViewController:vc];
//            [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
//            
//        }];
//        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
//        
//    }
//}

@end
