//
//  LoginViewController.m
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "LoginViewController.h"
#import "Utils.h"
#import "Common.h"
#import "Dbhelp.h"
//New
#import "TblCustomerData.h"
#import "TblCustomerDeviceModel.h"
#import "CustomerModule.h"
#import <MD5Digest/NSString+MD5.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface LoginViewController ()
{
    NSString* fbaccesstoken;
    NSString *strPswd;
    NSString *emailId;
    NSString *firstname;
}
@end

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
@implementation LoginViewController
@synthesize txtEmail;
@synthesize txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    txtEmail.delegate = self;
    txtPassword.delegate = self;
    [self.view_fblogin setHidden:NO];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions =@[@"public_profile", @"email", @"user_friends"];
    [loginButton setDelegate:self];
    loginButton.frame = CGRectMake(self.view_fblogin.frame.size.width/2 - loginButton.frame.size.width/2, self.view_fblogin.frame.size.height/2 - loginButton.frame.size.height/2, loginButton.frame.size.width, loginButton.frame.size.height);
    [self.view_fblogin addSubview:loginButton];
    [self.navigationController setNavigationBarHidden:NO];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [self performSegueWithIdentifier:@"changevalues" sender:self];
}
- (void)dismFromKeyboardNotifications {
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (IBAction)btnSignin_Touch:(id)sender {
    [self gotoLogin];
}

- (IBAction)btnForgot_Touch:(id)sender {
    [self performSegueWithIdentifier:@"showforgot" sender:self];
}

- (IBAction)btnNewReg_Touch:(id)sender {
    [self performSegueWithIdentifier:@"ShowNewReg" sender:self];
}

- (void)gotoLogin {
    if ([txtEmail.text isEqualToString:@""] || [txtPassword.text isEqualToString:@""]) 
        [self alertmessage:NSLocalizedString(@"INVALID", nil) Meassage:NSLocalizedString(@"PLEASEDONOTLEAVEANYFIELDEMPTY", nil)];
       
    else {
        CustomerData *objcust=[[CustomerData alloc]init];
        [objcust setCustomerEmail:txtEmail.text];
        [objcust setCustomerPassword:txtPassword.text];
        
        CustomerDeviceData *objdevice=[[CustomerDeviceData alloc]init];
        if([Common deviceToken].length>0)
            [objdevice setDeviceToken:[Common deviceToken]];
        else
             [objdevice setDeviceToken:@""];
        [objdevice setDeviceName:@"I"];
        NSString *uuidString= [[NSUUID UUID] UUIDString];
        uuidString = [uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
        if(uuidString)
            [objdevice setDeviceUuid:uuidString];
        else
          [objdevice setDeviceUuid:@"123456789"];
        CustomerDeviceDataModel *objdevmod=[[CustomerDeviceDataModel alloc]init];
        [objdevmod setCustomer:objcust];
        [objdevmod setDevice:objdevice];
        NSLog(@"%@",[objdevmod toDictionary]);
        
        CustomerModule *modcust=[[CustomerModule alloc]init];
        NSString *retval=@"";
        retval=[modcust loginwithserver:objdevmod];
        txtEmail.text=@"";
        txtPassword.text=@"";
        if([retval isEqualToString:@"SUCCESS"])
            [self performSegueWithIdentifier:@"showsLoader" sender:self];
        else if(retval.length>0)
            [self alertmessage:NSLocalizedString(@"INVALID", nil) Meassage:retval];
        else
            [self alertmessage:NSLocalizedString(@"INVALID", nil) Meassage:NSLocalizedString(@"PLEASECHECKYOUREMAILADDRESSANDPASSWORDISVALID", nil)];
            
    
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtEmail) {
        [txtPassword becomeFirstResponder];
    }
    else if (textField == txtPassword) {
        [txtPassword resignFirstResponder];
    }
    return YES;
    
}
- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButto
{
    
}

- (void) loginButton:    (FBSDKLoginButton *)loginButton didCompleteWithResult:    (FBSDKLoginManagerLoginResult *)result error:    (NSError *)error{
    if (error) {
        
    } else if (result.isCancelled) {
        
    } else {
        if ([result.grantedPermissions containsObject:@"email"]) {
            // Do work
            FBSDKGraphRequest *fbGraphRequest = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields": @"picture, email ,name,first_name, last_name,gender"}];
            
            [fbGraphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id user, NSError *error) {
                
                if (error == nil) {
                    
                    NSLog(@"User Info : %@",user);
                    CustomerData *objcust=[[CustomerData alloc]init];
                    if([user objectForKey:@"first_name"])
                        [objcust setCustomerFirstName:[user objectForKey:@"first_name"]];
                    if([user objectForKey:@"last_name"])
                        [objcust setCustomerLastName:[user objectForKey:@"last_name"]];
                    if([[FBSDKAccessToken currentAccessToken] tokenString])
                        [objcust setFbToken:[[FBSDKAccessToken currentAccessToken] tokenString]];
                    if([user objectForKey:@"email"])
                        [objcust setCustomerEmail:[user objectForKey:@"email"]];
                    if([user objectForKey:@"name"])
                        [objcust setCustomerUsername:[user objectForKey:@"name"]];
                    if([[user objectForKey:@"gender"]isEqualToString:@"male"])
                        [objcust setCustomerGender:@"M"];
                    else if([[user objectForKey:@"gender"]isEqualToString:@"female"])
                        [objcust setCustomerGender:@"F"];
                    
                    
                    CustomerDeviceData *objdevice=[[CustomerDeviceData alloc]init];
                    if([Common deviceToken].length>0)
                        [objdevice setDeviceToken:[Common deviceToken]];
                    else
                        [objdevice setDeviceToken:@""];
                    [objdevice setDeviceName:@"I"];
                    NSString *uuidString= [[NSUUID UUID] UUIDString];
                    uuidString = [uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                    if(uuidString)
                        [objdevice setDeviceUuid:uuidString];
                    else
                        [objdevice setDeviceUuid:@"123456789"];
                    
                    CustomerDeviceDataModel *objdevmod=[[CustomerDeviceDataModel alloc]init];
                    [objdevmod setCustomer:objcust];
                    [objdevmod setDevice:objdevice];
                    
                    [[FBSDKLoginManager new] logOut];
                    CustomerModule *modcustomer=[[CustomerModule alloc]init];
                    NSString *retval=[modcustomer faceboookloginwithserver:objdevmod];
                    if(![retval isEqualToString:@"SUCCESS"]){
                        [self alertmessage:@"Error" Meassage:retval];
                        
                        
                    }else
                        [self performSegueWithIdentifier:@"showsLoader" sender:self];
                    
                } else {
                    
                    NSLog(@"Error Getting Info %@",error);
                    
                }
            }];
        }
    }
}

- (IBAction)btnBack_Touch:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)alertmessage:(NSString *)ptitle Meassage:(NSString *)message{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:ptitle
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){}];
    
    [alertController addAction:okAction];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
}
@end
