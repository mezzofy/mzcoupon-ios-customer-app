//
//  UpdatePasswordController.m
//  EB
//
//  Created by Kaliyarajalu on 26/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "UpdatePasswordController.h"

#import "Common.h"
#import "Utils.h"

#import <sqlite3.h>
#import "FMDatabase.h"
#import "Dbhelp.h"
#import "CustomerModule.h"

@interface UpdatePasswordController ()

@end

@implementation UpdatePasswordController
@synthesize txtOldPassword;
@synthesize txtNewPassword;
@synthesize txtConfirmPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
bgView.frame = self.view.frame;
self.tableView.backgroundColor = [UIColor clearColor];
self.tableView.backgroundView = bgView;
self.tableView.backgroundView.layer.zPosition -= 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)btnUpdate_Touch:(id)sender {    
    if ([txtOldPassword.text isEqualToString:@""] || [txtNewPassword.text isEqualToString:@""] || [txtConfirmPassword.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"INVALID", nil)
                                              message:NSLocalizedString(@"PLEASEDONOTLEAVEANYFIELDEMPTY", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        [alertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
   
    }else if (![txtNewPassword.text isEqualToString:txtConfirmPassword.text]) {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"PASSWORD", nil)
                                              message:NSLocalizedString(@"PASSWORDMISMATCHED", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        [alertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
       
    }else if (![txtOldPassword.text isEqualToString:[Common getCustomerpassword]]) {

        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"INVALID", nil)
                                              message:@"Entered Current Password Mismatched"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        [alertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
    }else if ([txtNewPassword.text isEqualToString:[Common getCustomerpassword]]) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"PASSWORD", nil)
                                              message:NSLocalizedString(@"PASSWORDSAME", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        [alertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    } else {
        NSString *strreply=@"";
        CustomerDataModel *objcustmod=[[CustomerDataModel alloc]init];
        CustomerData *objcustdata=[[CustomerData alloc]init];
        [objcustdata setCustomerId:[Common getCustomerId]];
        [objcustdata setCustomerPassword:txtNewPassword.text];
        [objcustmod setCustomer:objcustdata];
        CustomerModule *objcust=[[CustomerModule alloc]init];
        strreply=[objcust sendChangePasswordToServer:objcustmod];
        if(![strreply isEqualToString:@"SUCCESS"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:strreply
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {}];
            [alertController addAction:okAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
            
        }else
            [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtOldPassword) {
        [txtNewPassword becomeFirstResponder];
    }
    else if (textField == txtNewPassword) {
        [txtConfirmPassword becomeFirstResponder];
    }
    else if (textField == txtConfirmPassword) {
        [txtConfirmPassword resignFirstResponder];
        [self btnUpdate_Touch:nil];
    }
    return YES;
}


    


- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
