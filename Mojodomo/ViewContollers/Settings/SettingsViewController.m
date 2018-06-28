//
//  SettingsViewController.m
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "SettingsViewController.h"
#import "Common.h"
#import "Dbhelp.h"
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Utils.h"
#import "LoginViewController.h"
#import "CustomerModule.h"
#import "MerchantModule.h"


@interface SettingsViewController ()<UIAlertViewDelegate>
@end

@interface SettingsViewController ()<MFMailComposeViewControllerDelegate>
@end

@implementation SettingsViewController
@synthesize lblCompanyName;
@synthesize lblEmpName;
@synthesize lblVerion,btn_SignOut;
- (void)viewDidLoad {
    [super viewDidLoad];
    if([[Common getCustomertype]isEqualToString:@"G"])
        [btn_SignOut setTitle:@"Sign In"];
    else
        [btn_SignOut setTitle:@"Sign Out"];
    
}
-(void)tableView:(UITableViewCell *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            if([[Common getCustomertype]isEqualToString:@"G"])
                [self alertgusetuser];
            else
                [self composeMail];
        }
    }
    
}
-(void)alertgusetuser{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Guest User"
                                          message:@"You must signin or Regsister to access all these"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"SignIn"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   Dbhelp* db = [[Dbhelp alloc]init];
                                   [db DeleteTables];
                                   NSBundle *bundle = [NSBundle mainBundle];
                                   NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
                                   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
                                   UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
                                   
                                   [self presentViewController:vc animated:NO completion:^{[[NSNotificationCenter defaultCenter] postNotificationName:@"GuestSignOut" object:@"Signout"];}];
                               }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){}];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
    
    
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([[Common getCustomertype]isEqualToString:@"G"]&&([identifier isEqualToString:@"changepass" ]||[identifier isEqualToString: @"editprofile"])){
        [self alertgusetuser];
        return NO;
    }
    else
        return YES;
}
-(void)composeMail {
    
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"ERROR", nil)
                                              message:NSLocalizedString(@"THISDEVICEISNOTCONFIGUREDTOSENDEMAIL", nil)
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
    } else {
        
        NSString *mailstr=[Common getMerchantEmail];
        MFMailComposeViewController *mailView =[[MFMailComposeViewController alloc] init];
        mailView.mailComposeDelegate = self;
        [mailView setSubject:NSLocalizedString(@"FEEDBACK", nil)];
        NSMutableArray *toRecipients =[[NSMutableArray alloc] init];
        [toRecipients addObject:mailstr];
        [mailView setToRecipients:toRecipients];
        [self presentViewController:mailView animated:YES completion:nil];
    }
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:{
        }
            break;
        case MFMailComposeResultSaved:{
            
        }
            break;
        case MFMailComposeResultSent:{
            
        }
            break;
        case MFMailComposeResultFailed:{
            
        }
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
   
    lblCompanyName.text = [Common getMerchantName];
    if([[Common getCustomertype]isEqualToString:@"G"]){
        lblEmpName.text = @"Guset User";
        
    }
    else if ([[Common getCustomertype]isEqualToString:@"C"]){
        lblEmpName.text = [Common getCustomerUsername];
//        CustomerDao *daocust=[[CustomerDao alloc]init];
//        Tbl_CustomerData *objcustdata=[[Tbl_CustomerData alloc]init];
//        objcustdata=[daocust getCustmerList];
//        lblCompanyName.text = [objcustdata customerFirstName];
        
    }
    
    NSString * appBuildString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    lblVerion.text = [NSString stringWithFormat:@"Coupon v%@ (%@)",appVersionString, appBuildString];
}

- (IBAction)btnSignOut_Touch:(id)sender {
    if([[Common getCustomertype]isEqualToString:@"G"]){
        Dbhelp* db = [[Dbhelp alloc]init];
        [db DeleteTables];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
        UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
        
        [self presentViewController:vc animated:NO completion:^{[[NSNotificationCenter defaultCenter] postNotificationName:@"GuestSignOut" object:@"Signout"];}];
        
        
    }
    else{
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"SIGNOUTCONFIRMATION", nil)
                                              message:NSLocalizedString(@"AREYOUSURETOSIGNOUT?", nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       Dbhelp* db = [[Dbhelp alloc]init];
                                       [db DeleteTables];
                                       NSBundle *bundle = [NSBundle mainBundle];
                                       NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
                                       UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
                                       UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
                                       
                                       [self presentViewController:vc animated:NO completion:^{[[NSNotificationCenter defaultCenter] postNotificationName:@"GuestSignOut" object:@"Signout"];}];
                                   }];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action){}];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
    }
}

- (IBAction)btnShare:(id)sender {
    
    NSLog(@"shareButton pressed");
    NSString *texttoshare = NSLocalizedString(@"SHARETHISAPPMSG", nil);
    UIImage *imagetoshare = [UIImage imageNamed:@"app-logo-email.jpg"];
    NSArray *activityItems = @[texttoshare, imagetoshare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo];
    [self presentViewController:activityVC animated:TRUE completion:nil];
}



- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
