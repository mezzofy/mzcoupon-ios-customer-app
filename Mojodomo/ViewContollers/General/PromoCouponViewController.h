//
//  CuoponsViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoCouponViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(weak, nonatomic) UIViewController* parent;
@property (strong, nonatomic) IBOutlet UITableView *tbl_promocoupon;

- (IBAction)btn_close:(id)sender;
- (IBAction)btnCoupon_click:(id)sender;

@end
