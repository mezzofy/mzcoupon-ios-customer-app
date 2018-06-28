//
//  CouponDetailViewController.h
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TblTxnCoupon.h"
#import <CoreLocation/CoreLocation.h>

@interface CouponDetailViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>

@property (nonatomic, retain) NSString *pcouponId;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic,retain) IBOutlet UIButton *btnRedeem;

- (IBAction)btnRedeem_Touch:(id)sender;

- (IBAction)btnOrder_Touch:(id)sender;

@end
