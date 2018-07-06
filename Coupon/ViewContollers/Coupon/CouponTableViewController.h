//
//  CouponTableViewController.h
//  CouponWallet
//
//  Created by Inforios on 11/05/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface CouponTableViewController : UITableViewController<CLLocationManagerDelegate,UITabBarControllerDelegate,UITabBarDelegate>

@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;


- (IBAction)indexChanged:(UISegmentedControl *)sender;
-(IBAction)btnSelect:(id)sender;

@end
