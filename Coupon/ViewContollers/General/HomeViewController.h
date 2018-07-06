//
//  HomeViewController.h
//  CouponWallet
//
//  Created by Eric Pang on 17/4/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>


@interface HomeViewController : UIViewController<UIAlertViewDelegate,FBSDKLoginButtonDelegate>

- (IBAction)btnlogin_Touch:(id)sender;
- (IBAction)btnregs_Touch:(id)sender;
- (IBAction)btnguest_Touch:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Btn_Register;
@property (weak, nonatomic) IBOutlet UIView *Fbloginview;



@end
