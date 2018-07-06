//
//  RedemptionSuccess.h
//  EB
//
//  Created by Kaliyarajalu on 16/02/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RedemptionSuccess : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) NSString *strType;
@property (nonatomic, retain) UIViewController* pparent;
@property (nonatomic, retain) NSString *flag;
- (IBAction)btnClose_Touch:(id)sender;

@end
