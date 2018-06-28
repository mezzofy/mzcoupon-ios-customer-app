//
//  OrderDetailController.h
//  SuPerk
//
//  Created by Kaliyarajalu on 25/02/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailController : UITableViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, retain) NSString *CouponId;

- (IBAction)btnBack_Touch:(id)sender;

@end
