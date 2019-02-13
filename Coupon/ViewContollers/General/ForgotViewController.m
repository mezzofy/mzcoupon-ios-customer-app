//
//  ForgotViewController.m
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "ForgotViewController.h"
#import "TblCustomerModel.h"
#import "ResetMessgaeView.h"
#import "CustomerModule.h"

#import "Utils.h"

@interface ForgotViewController ()

@end

@implementation ForgotViewController
@synthesize txtEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    txtEmail.delegate = self;
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnReset_Touch:(id)sender {
    
    NSString *emailForgot = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";                  // Email Validation
    
    NSPredicate *emailForgotTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailForgot];
    
    if ([txtEmail.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"INVALID", nil)
                                              message:NSLocalizedString(@"PLEASEENTEREMAILID", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
        [alertController addAction:okAction];
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
    else if ([emailForgotTest evaluateWithObject:txtEmail.text] == YES) {
        NSString *strreply=@"";
        CustomerDataModel *objcustmod=[[CustomerDataModel alloc]init];
        CustomerData *objcustdata=[[CustomerData alloc]init];
        [objcustdata setCustomerEmail:txtEmail.text];
        [objcustmod setCustomer:objcustdata];
        CustomerModule *objcust=[[CustomerModule alloc]init];
        strreply=[objcust sendForgetPasswordToServer:objcustmod];
        if(![strreply isEqualToString:@"SUCCESS"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:strreply
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){
                                           
                                       }];
            [alertController addAction:okAction];
            
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
            
           
        }else
        [self performSegueWithIdentifier:@"ThanksMsg" sender:self];
    }
    else {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"INVALID", nil)
                                              message:NSLocalizedString(@"PLEASECHECKYOUREMAILADDRESSISVALID", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
        [alertController addAction:okAction];
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtEmail) {
        [self btnReset_Touch:nil];
        [txtEmail resignFirstResponder];
    }
    return YES;
    
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
