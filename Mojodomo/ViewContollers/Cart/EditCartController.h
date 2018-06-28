//
//  EditCartController.h
//  EB
//
//  Created by Kaliyarajalu on 05/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditCartController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource >

@property (nonatomic, retain) NSNumber *pcartid;
@property (nonatomic, retain) IBOutlet UITextField *txtQty;
@property (nonatomic, retain) IBOutlet UIStepper  *stepper;

- (IBAction)btnUpdate_Touch:(id)sender;
-(IBAction)stepperChanged:(UIStepper*)sender;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
