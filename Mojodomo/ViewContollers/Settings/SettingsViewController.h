//
//  SettingsViewController.h
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *lblCompanyName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmpName;
@property (weak, nonatomic) IBOutlet UILabel *lblVerion;

- (IBAction)btnSignOut_Touch:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn_SignOut;

@end
