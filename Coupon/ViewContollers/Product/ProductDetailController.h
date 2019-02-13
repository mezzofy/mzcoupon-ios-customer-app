//
//  ProductDetailController.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductViewCell.h"
#import <CoreLocation/CoreLocation.h>
#import "TblProduct.h"

@interface ProductDetailController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>

@property (nonatomic, retain) NSString *campid;
@property (nonatomic, strong) ProductViewCell *prototypeCell;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIButton *btnclick;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *btnfav;
@property (nonatomic, retain) NSString *ChannelCode;
- (IBAction)btnplayvideo:(id)sender;

@end
