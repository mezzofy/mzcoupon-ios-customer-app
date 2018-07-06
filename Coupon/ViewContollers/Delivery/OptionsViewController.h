//
//  OptionsViewController.h
//  EB
//
//  Created by Kaliyarajalu on 26/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UITableViewController

@property (nonatomic, retain) NSNumber *nprodid;
@property (nonatomic, retain) NSNumber *nitemid;
@property (nonatomic, retain) NSString *sOrderType;
@property (nonatomic, retain) NSNumber *nSiteId;
@property (nonatomic, retain) NSString *sTime;
@property (nonatomic, retain) NSString *sCouponId;
@property (nonatomic, retain) NSNumber *nmodCount;
@property (nonatomic, retain) NSString *optaddress;
@property (nonatomic, retain) UIViewController* pparent;
@property (nonatomic, strong) NSMutableArray *selectedCells;
@property (nonatomic, strong) NSMutableArray *selecedModifier;

@end
