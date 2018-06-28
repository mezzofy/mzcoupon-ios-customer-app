//
//  EditProfileViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/11/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Common.h"
#import "Utils.h"

#import <sqlite3.h>
#import "FMDatabase.h"
#import "Dbhelp.h"
#import "CustomerModule.h"
#import "TblCustomerModel.h"
#import "RegsisterModule.h"

@interface EditProfileViewController ()
{

}
@end

@implementation EditProfileViewController
@synthesize txtName,txtMobileNo;
- (void)viewDidLoad {
    [super viewDidLoad];
    TblCustomerData *ojbcust=[[TblCustomerData alloc]init];
    CustomerModule *modcust=[[CustomerModule alloc]init];
    ojbcust=[modcust getCustmerList];
    txtName.text=ojbcust.customerFirstName;
    txtMobileNo.text=ojbcust.customerMobile;
    

}

- (void)viewDidAppear:(BOOL)animated {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}
- (IBAction)btnUpdate_Touch:(id)sender {
     if ( [txtName.text isEqualToString:@""] || [txtMobileNo.text isEqualToString:@""]) {
         
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
        
     }else{
         NSString *retval;
         CustomerData *objcustdata=[[CustomerData alloc]init];
         [objcustdata setCustomerMobile:txtMobileNo.text];
         [objcustdata setCustomerFirstName:txtName.text];
         [objcustdata setCustomerId:[Common getCustomerId]];
         CustomerDataModel *objcustomer=[[CustomerDataModel alloc]init];
         [objcustomer setCustomer:objcustdata];
         CustomerModule *modcust=[[CustomerModule alloc]init];
         retval=[modcust putEditProfileDatatoServer:objcustomer];
         if(![retval isEqualToString:@"SUCCESS"]){
             UIAlertController *alertController = [UIAlertController
                                                   alertControllerWithTitle:@"Error"
                                                   message:retval
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
             [self.navigationController popViewControllerAnimated:YES];
     }


}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtName) {
        [txtMobileNo becomeFirstResponder];
    }
    else if (textField == txtMobileNo) {
        [txtMobileNo resignFirstResponder];
        [self btnUpdate_Touch:nil];
    }
    
       

    
    return YES;
}




- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
