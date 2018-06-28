//
//  ChoosePaymentController.h
//  CouponWallet
//
//  Created by Inforios on 04/06/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewController.h"
//#import "CardIO.h"
//#import "PayPalMobile.h"
//CardIOPaymentViewControllerDelegate

@interface ChoosePaymentController : UITableViewController


@property (nonatomic, retain) IBOutlet UIBarButtonItem *btncontinue;
- (IBAction)btnback_Touch:(id)sender;
- (IBAction)btnProceed_Touch:(id)sender;
@property (nonatomic, strong)NSString *strtopamount;
@property (nonatomic, strong)NSString *strtopmessage;
@property (nonatomic, strong)NSString *parenttopup;
@end
