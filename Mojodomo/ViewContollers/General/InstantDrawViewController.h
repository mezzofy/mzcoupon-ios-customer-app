//
//  InstantDrawViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstantDrawViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(weak, nonatomic) UIViewController* parent;

@property (strong, nonatomic) IBOutlet UITableView *tbl_instdraw;
- (IBAction)btn_close:(id)sender;

@end
