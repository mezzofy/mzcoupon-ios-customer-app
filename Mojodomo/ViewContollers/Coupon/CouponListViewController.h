//
//  CouponListViewController.h
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CouponListViewController : UITableViewController<CLLocationManagerDelegate>

@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) NSString* pcampId;
@property (nonatomic, retain) UIViewController* pparent;
- (IBAction)btnBack_Touch:(id)sender;

@end
