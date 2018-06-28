//
//  ScanCouponViewController.h
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TblCouponData.h"

@interface ScanCouponViewController : UIViewController<UIAlertViewDelegate>

@property (nonatomic, retain) TblCouponData* objcoupon;
@property (nonatomic,retain) IBOutlet UIImageView *imageQr;
@property (nonatomic,retain) IBOutlet UILabel *lblcoupname;
@property (nonatomic,retain) IBOutlet UILabel *lblcoupNo;
@property (nonatomic, retain) NSString* flag;

@property (nonatomic, retain) NSString* siteid;

@property (nonatomic, retain) UIViewController* pparent;
@property (weak, nonatomic) IBOutlet UIImageView *imgBrandName;
- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnreedem_Touch:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lbldate;

@property (nonatomic, retain) NSString* strType;
@end
