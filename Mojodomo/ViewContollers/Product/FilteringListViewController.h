//
//  FilteringListViewController.h
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListController.h"
#import <CoreLocation/CoreLocation.h>

@interface FilteringListViewController : UITableViewController<CLLocationManagerDelegate,UIAlertViewDelegate>

- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnApply_Touch:(id)sender;
@property (nonatomic, assign) ProductListController* vcparent;

@end
