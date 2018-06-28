//
//  UpdatePasswordController.h
//  EB
//
//  Created by Kaliyarajalu on 26/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdatePasswordController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtOldPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;
- (IBAction)btnUpdate_Touch:(id)sender;

@end
