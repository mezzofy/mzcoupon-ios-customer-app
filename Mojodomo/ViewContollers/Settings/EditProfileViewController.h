//
//  EditProfileViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/11/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtMobileNo;
- (IBAction)btnUpdate_Touch:(id)sender;

@end
