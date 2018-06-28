//
//  WalletView.m
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "WalletView.h"
#import "Common.h"
#import "Utils.h"
#import "Dbhelp.h"
#import "ProductListController.h"
#import "WalletTopUpTransactionModule.h"
#import "WalletModule.h"
#import "ScanCouponViewController.h"

@interface WalletView (){
    NSMutableArray *arrycountlist;
     NSMutableArray *arrypendinglist;

    
}

@end

@implementation WalletView
@synthesize parentvc;

@synthesize lblWelcomeEmpName;
@synthesize lblamount,lbldate;
@synthesize lblpending,lblLucky,lblcoupon,lblwalletlog,lbltransactions,lblnotifications;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
        if ([[Common getCustomertype] isEqualToString:@"G"]) {
            UIAlertController *alertController = [UIAlertController
                                                   alertControllerWithTitle:NSLocalizedString(@"Pleasesignuptocontinue",nil)
                                                   message:@""
                                                   preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){}];
            
            UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){}];
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
        }else{
    
            [self getwalletbalance];
            [self getPendinglist];
    NSString *combine = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"welcome", nil), [NSString stringWithFormat:@"%@",[Common getCustomerUsername]]];
    lblWelcomeEmpName.text = combine;
    
    lblLucky.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"luckydraw",nil)];
    lblcoupon.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"coupons",nil)];
    lblwalletlog.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"walletlog",nil)];
    lbltransactions.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"transactions",nil)];
    lblnotifications.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"notifications",nil)];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CardTapped)];
    [self.img_Card addGestureRecognizer:tapGestureRecognizer];
    self.img_Card.userInteractionEnabled = YES;
        }
}
-(void)CardTapped{
    [self performSegueWithIdentifier:@"customerQR" sender:self];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"customerQR"]) {
        ScanCouponViewController *scan = segue.destinationViewController;
        scan.flag=@"Customer";
    }
    
}
-(void)loadpendingcount{
//    WalletModule *daotxn=[[WalletModule alloc]init];
//    arrypendinglist=[daotxn getPendingCount];
 //   NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrypendinglist count]];
   // [[[[[self tabBarController] tabBar] items] objectAtIndex:0] setBadgeValue:badgenumber];

   

}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (alertView.tag==1){
//        if (buttonIndex==1){
//            Dbhelp* db = [[Dbhelp alloc]init];
//            [db removeDB];
//            CustomerModule *modcus = [[CustomerModule alloc]init];
//            StaffModule *modusr = [[StaffModule alloc]init];
//            [modusr clearLoginUser];
//            [modcus clearLoginCustomer];
//            [Common autoLogin:Nil];
//            [Common typedesign:@"guest"];
//            [self performSegueWithIdentifier:@"showlogin" sender:self];
//        }else{
//            if (buttonIndex==0){
//                
//                //ProductListController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"vcmainscreen"];
//               // [self presentViewController:vc animated:YES completion:nil];
//                [self performSegueWithIdentifier:@"showtab" sender:self];
//            }       }
//    }
//
//}
- (void)refreshController {
//    EventModule *daoevent=[[EventModule alloc]init];
//    arrycountlist=[daoevent getEventCount];
//    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrycountlist count]];
//    [[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:badgenumber];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    
    [self getwalletbalance];
    [self getPendinglist];
    

}

- (void)viewWillAppear:(BOOL)animated {
  
    [self refreshController];
    
}

- (IBAction)callPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://25060663"]];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)getwalletbalance{
    WalletModule *modwallet=[[WalletModule alloc]init];
    [modwallet getWalletFromServer];
    TblWalletData *objwallet=[modwallet getwallet];
    [lblamount setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],objwallet.walletCredit]];
    NSString *combine = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"LastUpdatedOn", nil), [NSString stringWithFormat:@"%@",objwallet.updatedOn]];
            lbldate.text=combine;
}


- (IBAction)btnClickGetBalance:(id)sender {
    [self refreshController];

}

-(void)getPendinglist{
    WalletTopUpTransactionModule *modwallettxn=[[WalletTopUpTransactionModule alloc]init];
    [modwallettxn getWalletAllTransationListFromServer:@"P" Offset:1];
    NSUInteger pendingcount=[modwallettxn getWalletTransactioncountStatus:@"P"];
    lblpending.text = [NSString stringWithFormat:@"%ld %@",pendingcount,NSLocalizedString(@"PENDINGPAYMENTS",nil)];
    [self.view setNeedsDisplay];
}


@end

