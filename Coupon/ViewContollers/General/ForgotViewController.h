//
//  ForgotViewController.h
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

- (IBAction)btnReset_Touch:(id)sender;

@end
