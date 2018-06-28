//
//  FilterViewController.h
//  EB
//
//  Created by Kaliyarajalu on 02/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListController.h"

@interface FilterViewController : UITableViewController

- (IBAction)btnApply_Touch:(id)sender;

@property (nonatomic, assign) ProductListController* vcparent;


@end
