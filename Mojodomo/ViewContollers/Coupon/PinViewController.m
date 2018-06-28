
//
//  PinViewController.m
//  CouponWallet
//
//  Created by Inforios on 28/04/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "PinViewController.h"
#import "RedemptionSuccess.h"
#import "Common.h"
#import "Utils.h"
#import "CouponOrderModule.h"
#import "TblSite.h"
#import "TblOrderData.h"
#import "MassRedeemModule.h"
#import "TblMassCouponModel.h"
#import <MZCoupon/MZCoupon.h>


@interface PinViewController (){
    NSTimer *waittimer;
    NSString *SelectedSiteId;
}

@end

@implementation PinViewController
@synthesize txtpin,lblName,objcoupon,siteid;
@synthesize lblPin1,lblPin2,lblPin3,lblPin4;

- (void)viewDidLoad {
    [super viewDidLoad];
    txtpin.delegate=self;
    lblName.text=[Common getMerchantName];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"scanpinredeem"]) {
        RedemptionSuccess *success = segue.destinationViewController;
        success.pparent = self.pparent;
    }
}
- (IBAction)btncancel_Touch:(id)sender {
    [txtpin resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self clearValues];
    [txtpin becomeFirstResponder];
}
-(IBAction) btnKeyboard_click
{    NSLog(@"called : %ld",(unsigned long)txtpin.text.length);
    
    [lblPin1 setText:@""];
    [lblPin2 setText:@""];
    [lblPin3 setText:@""];
    [lblPin4 setText:@""];
    switch(txtpin.text.length)
    {
        case 1:
        {
            [lblPin1 setText:@"X"];
            break;
        }
        case 2:
        {
            [lblPin1 setText:@"X"];
            [lblPin2 setText:@"X"];
            break;
        }
        case 3:
        {
            [lblPin1 setText:@"X"];
            [lblPin2 setText:@"X"];
            [lblPin3 setText:@"X"];
            break;
        }
        case 4:
        {
            [lblPin1 setText:@"X"];
            [lblPin2 setText:@"X"];
            [lblPin3 setText:@"X"];
            [lblPin4 setText:@"X"];
            break;
        }
    }
    
    if(txtpin.text.length == 4){
        
        
        [self checkPin];
    }
    
}
-(void)clearValues{
    
    [lblPin1 setText:@""];
    [lblPin2 setText:@""];
    [lblPin3 setText:@""];
    [lblPin4 setText:@""];
    txtpin.text=@"";
}


- (void) checkPin {
    NSString *strpass=txtpin.text;
    CouponOrderModule *objcouponorder=[[CouponOrderModule alloc]init];
    TblSite *objsite=[[TblSite alloc]init];
    
    objsite = [objcouponorder getSiteFromServerBySitepass:strpass];
    if([objcoupon.delflag isEqualToString:@"Mass Coupon"]&&[objsite.siteId isEqualToString:siteid]){
        
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"ConfirmRedeem",nil)
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       {
                                           if([objcoupon.delflag isEqualToString:@"Mass Coupon"]){
                                               MassRedeemModule *modmassredeem=[[MassRedeemModule alloc]init];
                                               //                TblMassCouponModel *objmass=[modmassredeem ]
                                           }else{
                                               TblOrderData *objorderdata=[[TblOrderData alloc]init];
                                               [objorderdata setSiteId:SelectedSiteId];
                                               [objorderdata setCouponId:objcoupon.couponId];
                                               [objorderdata setOrderType:@"R"];
                                               [objorderdata setCustomerId:[Common getCustomerId]];
                                               
                                               TblOrderModel *objordermodel=[[TblOrderModel alloc]init];
                                               [objordermodel setOrder:objorderdata];
                                               
                                               CouponOrderModule *modcouponorder=[[CouponOrderModule alloc]init];
                                               
                                               NSString *retval=[modcouponorder OrderCouponToServer:objordermodel];
                                               if([retval isEqualToString:@"SUCCESS"])
                                                   [self performSegueWithIdentifier:@"scanpinredeem" sender:self];
                                               else
                                                   [self AlertMessage:NSLocalizedString(@"CAN'TREDEEM!", nil) Message:@""];
                                           }
                                       }
                                   }];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           [self clearValues];
                                           [txtpin resignFirstResponder];
                                           [self dismissViewControllerAnimated:YES completion:nil];
                                       }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
 
    }else if(![objcoupon.delflag isEqualToString:@"Mass Coupon"] && objsite.siteId){
        SelectedSiteId=objsite.siteId;
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"ConfirmRedeem",nil)
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       {
                                           if([objcoupon.delflag isEqualToString:@"Mass Coupon"]){
                                               MassRedeemModule *modmassredeem=[[MassRedeemModule alloc]init];
                                               //                TblMassCouponModel *objmass=[modmassredeem ]
                                           }else{
                                               TblOrderData *objorderdata=[[TblOrderData alloc]init];
                                               [objorderdata setSiteId:SelectedSiteId];
                                               [objorderdata setCouponId:objcoupon.couponId];
                                               [objorderdata setOrderType:@"R"];
                                               [objorderdata setCustomerId:[Common getCustomerId]];
                                               
                                               TblOrderModel *objordermodel=[[TblOrderModel alloc]init];
                                               [objordermodel setOrder:objorderdata];
                                               
                                               CouponOrderModule *modcouponorder=[[CouponOrderModule alloc]init];
                                               
                                               NSString *retval=[modcouponorder OrderCouponToServer:objordermodel];
                                               if([retval isEqualToString:@"SUCCESS"])
                                                   [self performSegueWithIdentifier:@"scanpinredeem" sender:self];
                                               else
                                                   [self AlertMessage:NSLocalizedString(@"CAN'TREDEEM!", nil) Message:@""];
                                           }
                                       }
                                   }];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           [self clearValues];
                                           [txtpin resignFirstResponder];
                                           [self dismissViewControllerAnimated:YES completion:nil];
                                       }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
       
    }else{
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Invalid Pin No"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"Retry"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       [self clearValues];
                                       [txtpin becomeFirstResponder];
                                   }];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:@"Close"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           [self clearValues];
                                           [txtpin resignFirstResponder];
                                           [self dismissViewControllerAnimated:YES completion:nil];
                                           
                                       }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
    [txtpin resignFirstResponder];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtpin) {
        
    }
    return YES;
    
}
-(void)AlertMessage:(NSString *)title Message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"ConfirmRedeem",nil)
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", nil)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){}];
   
   
    [alertController addAction:okAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
}


@end
