//
//  RegisterViewController.h
//  CouponWallet
//
//  Created by Eric Pang on 17/4/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RegsisterviewDelegate <NSObject>

@end
@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtMobileNo;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRePassword;
@property (weak, nonatomic) IBOutlet UITextField *txtCustName;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;

@property (weak, nonatomic) IBOutlet UITableView *tbl_country;



- (IBAction)btnContinue_Touch:(id)sender;
- (IBAction)btnBack_Touch:(id)sender;
@end
