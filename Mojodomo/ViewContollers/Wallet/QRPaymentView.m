//
//  VIEW.m
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "QRPaymentView.h"
#import "WalletModule.h"
#import "Common.h"
#import "Barcode.h"
#import <MZCoupon/MZCoupon.h>

@interface QRPaymentView (){
    NSTimer *waittimer;
    NSInteger clktick;
}

@end

@implementation QRPaymentView

@synthesize lblEmpName,qrImg,loading;
@synthesize lblValidSec;

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [self showQr:nil];
    lblEmpName.text = [NSString stringWithFormat:@"%@",[Common getCustomerUsername]];
    clktick = 60;
    [loading setProgress:0];
    waittimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(showQr:) userInfo:nil repeats:YES];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showQr:(NSTimer *)timer{
    
    if(clktick >= 60){
        clktick = 1;
        WalletModule *modwallet=[[WalletModule alloc]init];
        WalletData *objwallet=[[WalletData alloc]init];
        objwallet=[modwallet getWalletQRCODERequestFromServer];
        if(objwallet.qrCode){
            NSString* custoqrcode = [NSString stringWithFormat:@"%@_%@", [Common getCustomerId], objwallet.qrCode];
            Barcode *barcode = [[Barcode alloc] init];
            [barcode setupQRCode:custoqrcode];
            qrImg.image = barcode.qRBarcode;
        }else{
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:@"Error connecting to server !!!"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {}];
            [alertController addAction:okAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });           
            
        }
    }else{
        clktick ++;
    }
    
    [loading setProgress:clktick/60.0f];
    [lblValidSec setText:[NSString stringWithFormat:NSLocalizedString(@"VALID FOR SECONDS", nil),60 - clktick]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [waittimer invalidate];
}

@end

