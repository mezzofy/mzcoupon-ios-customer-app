//
//  FilterLocationViewController.h
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterLocationViewController : UITableViewController

- (IBAction)btnApply_Touch:(id)sender;
- (IBAction)btnBack_Touch:(id)sender;
@property (nonatomic, retain) NSMutableArray* plocfilterid;

@end
