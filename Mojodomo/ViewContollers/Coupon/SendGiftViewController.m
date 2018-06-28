//
//  SendGiftViewController.m
//  WalnetCouponWallet
//
//  Created by Inforios on 05/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "SendGiftViewController.h"
#import "Common.h"
#import "CouponModule.h"
#import "TblGiftcouponModel.h"
#import "CustomerModule.h"
#import <MZCoupon/MZCoupon.h>

@interface SendGiftViewController (){
    NSString *stremail;
    NSString *strmsg;
}

@end

@implementation SendGiftViewController
@synthesize couponID,txtEmail,txtmsg;

- (void)viewDidLoad {
    [super viewDidLoad];
    txtEmail.delegate=self;
    txtmsg.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack_Touch:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnSumbit_Touch:(id)sender{
     [txtmsg resignFirstResponder];
    
    if (stremail ==nil || strmsg ==nil || [stremail isEqualToString:@""] || [strmsg isEqualToString:@""]) {
        UIAlertView *alertError =[[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Enter the fields" delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertError show];

    }else{
        CustomerModule *modcustomer=[[CustomerModule alloc]init];
        CustomerData *objcustomer=[modcustomer CheckUserAvaliable:stremail];
        if([objcustomer.customerEmail isEqualToString:stremail]){
        GiftcouponData *objgiftcoupon=[[GiftcouponData alloc]init];
        [objgiftcoupon setEmail:stremail];
        [objgiftcoupon setCustomerId:[Common getCustomerId]];
        [objgiftcoupon setCouponId:couponID];
        [objgiftcoupon setNotes:strmsg];
        GiftcouponDataModel *modgiftcoupon=[[GiftcouponDataModel alloc]init];
        [modgiftcoupon setSharecoupon:objgiftcoupon];
        CouponModule *objCoupon=[[CouponModule alloc]init];
        NSString *retval=[objCoupon SendGiftCouponToPartner:modgiftcoupon];
            if([retval isEqualToString:@"SUCCESS"]){
                UIAlertView *alertError =[[UIAlertView alloc]initWithTitle:@"Success" message:@"Coupon Shared Successfully" delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                [alertError show];
                [self dismissViewControllerAnimated:YES completion:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"dismissscan" object:@"donescan"];
            }else{
                UIAlertView *alertError =[[UIAlertView alloc]initWithTitle:@"Error" message:retval delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                [alertError show];
            }
        }else{
            UIAlertView *alertError =[[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Enter the valid email" delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
            [alertError show];
        }
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtEmail) {
        [txtmsg becomeFirstResponder];
    }
    else if (textField == txtmsg) {
        [txtmsg resignFirstResponder];
    }
    return YES;
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.tag==1) {
         stremail = textField.text;
    }
    else if (textField.tag==2){
         strmsg = textField.text;
    }
    return YES;
}

@end
