//
//  DeliveryController.h
//  EB
//
//  Created by Kaliyarajalu on 25/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import <CoreLocation/CoreLocation.h>
#import "TblCouponData.h"

@interface DeliveryController : UITableViewController<UITextViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, retain) TblCouponData *objcoupon;
@property (nonatomic, retain) UIViewController* pparent;
@property (nonatomic, retain) NSString* strType;
- (IBAction)btnBack_Touch:(id)sender;

@end
