//
//  LoginViewController.h
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnSignin_Touch:(id)sender;
- (IBAction)btnForgot_Touch:(id)sender;
- (IBAction)btnNewReg_Touch:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view_fblogin;


@end
