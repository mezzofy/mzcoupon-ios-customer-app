//
//  PreviewController.h
//  EB
//
//  Created by Kaliyarajalu on 05/01/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewController : UITableViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (nonatomic, retain) NSString *SelectedProdId;
@property (nonatomic, retain) NSString *OrderType;
@property (nonatomic, retain) NSString *SelectedSiteId;
@property (nonatomic, retain) NSString *CouponId;
@property (nonatomic, retain) NSString *SelectedModId;
@property (nonatomic, retain) NSString *preaddress;
@property (nonatomic, retain) UIViewController* pparent;
- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnClose_Touch:(id)sender;

@end
