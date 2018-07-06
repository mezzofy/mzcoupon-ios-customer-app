//
//  LuckyDrawViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuckyDrawViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(weak, nonatomic) UIViewController* parent;
@property (strong, nonatomic) IBOutlet UITableView *tbl_luckydraw;
- (IBAction)btn_close:(id)sender;



@end
