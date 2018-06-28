//
//  HomeViewController.m
//  CouponWallet
//
//  Created by Eric Pang on 17/4/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "HomeViewController.h"
#import "Common.h"
#import "Utils.h"
//#import "UIImageView+WebCache.h"
//#import "Dbhelp.h"
//#import "PromoCouponViewController.h"
//#import "PromoMerchantViewController.h"
//#import "LuckyDrawViewController.h"
//#import "InstantDrawViewController.h"
//#import "ProductViewCell.h"
//#import "LoginViewController.h"
#import "TblCustomerDeviceModel.h"
#import "CustomerModule.h"


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface HomeViewController (){
    CustomerModule *modcustomer;
}
@end
#define IS_OS_9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.1)
@implementation HomeViewController
@synthesize Fbloginview;

- (void)viewDidLoad {
    modcustomer=[[CustomerModule alloc]init];
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationHandler:)
                                                 name:@"GuestSignOut" object:nil];
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.readPermissions =@[@"public_profile", @"email", @"user_friends"];
//    [loginButton setDelegate:self];
//    loginButton.frame = CGRectMake(self.Fbloginview.frame.size.width/2 - loginButton.frame.size.width/2, self.Fbloginview.frame.size.height/2 - loginButton.frame.size.height/2, loginButton.frame.size.width, loginButton.frame.size.height);
//    [self.Fbloginview addSubview:loginButton];
}


- (IBAction)btnguest_Touch:(id)sender {
    [Common setCustomerUsername:@"Guest User"];
    [Common setCustomerpassword:@"Guset"];
    [Common setCustomertype:@"G"];
    [self performSegueWithIdentifier:@"showsLoaderFB" sender:self];
}
-(void)myNotificationHandler:(NSNotification *)notice {
    [self performSegueWithIdentifier:@"showlogin" sender:self];
}

- (IBAction)btnlogin_Touch:(id)sender{
    [self performSegueWithIdentifier:@"showlogin" sender:self];
}

- (IBAction)btnregs_Touch:(id)sender{
    [self performSegueWithIdentifier:@"showregs" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}
- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButto
{
    
}

- (void) loginButton:	(FBSDKLoginButton *)loginButton didCompleteWithResult:	(FBSDKLoginManagerLoginResult *)result error:	(NSError *)error{
    if (error) {
        
    } else if (result.isCancelled) {
       
    } else {
        if ([result.grantedPermissions containsObject:@"email"]) {
            // Do work            
            FBSDKGraphRequest *fbGraphRequest = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields": @"picture, email ,name,first_name, last_name,gender"}];
            
            [fbGraphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id user, NSError *error) {
                
                if (error == nil) {
                    
                    NSLog(@"User Info : %@",user);
                    TblCustomerData *objcust=[[TblCustomerData alloc]init];
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
                    
                    
                    TblCustomerDeviceData *objdevice=[[TblCustomerDeviceData alloc]init];
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
                    
                    TblCustomerDeviceModel *objdevmod=[[TblCustomerDeviceModel alloc]init];
                    [objdevmod setCustomer:objcust];
                    [objdevmod setDevice:objdevice];
                    
                    [[FBSDKLoginManager new] logOut];
                    
                    NSString *retval=[modcustomer faceboookloginwithserver:objdevmod];
                    if(![retval isEqualToString:@"SUCCESS"]){
                        UIAlertView *alertValidEmail =[[UIAlertView alloc]initWithTitle:@"Error" message:retval delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                        
                        [alertValidEmail show];
                        
                    }else
                         [self performSegueWithIdentifier:@"showsLoaderFB" sender:self];
                  
                } else {
                    
                    NSLog(@"Error Getting Info %@",error);
                    
                }
            }];
        }
    }
}

@end
