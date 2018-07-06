//
//  PaymentTopupView.h
//  RgMerchant
//
//  Created by Inforios on 29/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransferViewController.h"

@interface PaymentConfirmView : UIViewController
@property (nonatomic, retain) TransferViewController *parentvc;

- (IBAction)btnConfirmTopup:(id)sender;
- (IBAction)btnCancelToupup:(id)sender;


@property (retain, nonatomic) NSString* txnRef;
@property (retain, nonatomic) NSString* txnCustomerName;
@property (retain, nonatomic) NSString* txnCustomerId;
@property (retain, nonatomic) NSNumber* txnamount;
@property (retain, nonatomic) NSString* txnmobile;
//@property (retain, nonatomic) NSString* txnmsg;

@property (weak, nonatomic) IBOutlet UILabel *lblToupuAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTopupRef;
@property (weak, nonatomic) IBOutlet UILabel *lblTopupCustomer;
@end
