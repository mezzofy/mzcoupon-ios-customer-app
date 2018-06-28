//
//  CartViewController.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface CartViewController : UITableViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) NSString *lastpage;

@end
