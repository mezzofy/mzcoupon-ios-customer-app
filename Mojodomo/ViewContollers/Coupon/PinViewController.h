//
//  PinViewController.h
//  CouponWallet
//
//  Created by Inforios on 28/04/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TblCouponData.h"

@interface PinViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic, retain) TblCouponData *objcoupon;
@property (nonatomic, retain) NSString *siteid;
@property (nonatomic, retain) IBOutlet UITextField *txtpin;
@property (nonatomic, retain) IBOutlet UILabel *lblName;
@property (nonatomic, retain) IBOutlet UILabel *lblPin1;
@property (nonatomic, retain) IBOutlet UILabel *lblPin2;
@property (nonatomic, retain) IBOutlet UILabel *lblPin3;
@property (nonatomic, retain) IBOutlet UILabel *lblPin4;
@property (nonatomic, retain) UIViewController* pparent;
- (IBAction)btncancel_Touch:(id)sender ;
-(IBAction) btnKeyboard_click;


@end
