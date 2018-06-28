//
//  ItemViewController.h
//  EB
//
//  Created by Kaliyarajalu on 26/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWTableViewCell.h"

@interface ItemViewController : UITableViewController<SWTableViewCellDelegate>

@property (nonatomic, retain) NSNumber *nGroupProdId;

@property (nonatomic, retain) NSString *sOrderType;
@property (nonatomic, retain) NSNumber *nSiteId;
@property (nonatomic, retain) NSString *nCouponId;
@property (nonatomic, retain) NSString *sTime;
@property (nonatomic, retain) NSString *saddress;
@property (nonatomic, retain) UIViewController* pparent;
@property (nonatomic, retain) NSString* strType;
- (IBAction)btnContinue_Touch:(id)sender;
- (IBAction)btnBack_Touch:(id)sender;

@end
