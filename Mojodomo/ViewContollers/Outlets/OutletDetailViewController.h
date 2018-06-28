//
//  OutletDetailViewController.h
//  MzCouponWallet
//
//  Created by Inforios on 04/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface OutletDetailViewController : UITableViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) NSNumber *nsiteid;
- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnshare_Touch:(id)sender;

@end
