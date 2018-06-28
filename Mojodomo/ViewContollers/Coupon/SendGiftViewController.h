//
//  SendGiftViewController.h
//  WalnetCouponWallet
//
//  Created by Inforios on 05/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendGiftViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, retain) NSString *couponID;
@property (nonatomic, retain)IBOutlet UITextField *txtEmail;
@property (nonatomic, retain)IBOutlet UITextField *txtmsg;
- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnSumbit_Touch:(id)sender;

@end
