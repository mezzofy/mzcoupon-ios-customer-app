//
//  AppDelegate.m
//  EB
//
//  Created by Kaliyarajalu on 24/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <EstimoteSDK/EstimoteSDK.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "CouponListViewController.h"
#import "AgreementViewController.h"
#import "BeaconNotificationsManager.h"
#import "Common.h"
#import "LoaderViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Branch.h"
#import "DLManager.h"
#import <MZCoupon/MZCoupon.h>


@interface AppDelegate ()

@property (nonatomic) BeaconNotificationsManager *beaconNotificationsManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Fabric with:@[CrashlyticsKit]];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    strGetPath=[[Dbhelp alloc]init];

    [strGetPath CreateDataBase];
 
    [MZCouponConfig SetupMerchantID:@"DMHA" Server:FALSE AccessToken:@"NPNN10" AccessKey:@"x"];
    
    
    
    
    [ESTConfig setupAppID:@"com-promerce-getso-lka" andAppToken:@"864532236c372ef1be9117cc5f4ab53b"];
    
    self.beaconNotificationsManager = [BeaconNotificationsManager new];
    [self.beaconNotificationsManager enableNotificationsForBeaconID:
     [[BeaconID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" major:0 minor:0]
                                                       enterMessage:@"Mezzofy Coupon POP!!!"
                                                        exitMessage:nil
     ];
  
    
    
    
    
//    [self.beaconNotificationsManager enableNotificationsForBeaconID:
//     [[BeaconID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" major:12457 minor:7954]
//                                                       enterMessage:@"Enter Beacon2 Range!"
//                                                        exitMessage:@"Exit Beacon2 Range."
//     ];

//    [self.beaconNotificationsManager enableNotificationsForBeaconID:
//     [[BeaconID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" major:6293 minor:37752]
//                                                       enterMessage:@"Enter Beacon3 Range!"
//                                                        exitMessage:@"Exit Beacon3 Range."
//     ];

    

    
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    [modloader loadPaymentList];
//    
//    PaymentModule *daopaymt=[[PaymentModule alloc]init];
//    TblPayment *tblpay=[daopaymt getPaypal];
//    if (tblpay) {
//        [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction :[tblpay productionKey],
//                                                               PayPalEnvironmentSandbox : [tblpay sandboxKey]}];
//    }
    
    
//    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction : @"AQrivZhggiCaPDNQfBakVtvQTZgzeRYuvSn3R39T1NQxeHf3p46gLSMUPBD3AqTRjC0qqtz8XtKiytSa",
//                                                           PayPalEnvironmentSandbox : @"Acliwkopx77-wOCmO1Rt_sg5m2rKudIGJYJ_z0USeo5-qCtyEjnTPjhAde1qkMxpsSVFL3lVCLviO8gp"}];
    
	
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    
    

  
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
    }else{
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }


    [DLManager setStoryboard:self.window.rootViewController.storyboard];
    
    
    Branch *branch = [Branch getInstance];
    [branch setDebug];
    [branch initSessionWithLaunchOptions:launchOptions automaticallyDisplayDeepLinkController:YES deepLinkHandler:^(NSDictionary *params, NSError *error) {
//        if (!error) {
//            NSString* val = [params objectForKey:@"$canonical_identifier"];
//            if(val != NULL){
//                [Common branchio:@"TRUE"];
//                NSArray *temp= [val componentsSeparatedByString:@"="];
//                if(temp.count>0)
//                [Common prodid:[temp objectAtIndex:1]];
//                [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@",val]]];
//                //NSLog(@"finished init with params = %@", [params description]);
//            }
//        }
//        else {
//            //NSLog(@"failed init: %@", error);
//        }
    }];
    
    [self verifyAutoLoginDetails];
    return YES;
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
 
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
 
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
 
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

- (BOOL) pushNotificationOnOrOff
{
    if ([UIApplication instancesRespondToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        return ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]);
    } else {
        UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        return (types & UIRemoteNotificationTypeAlert);
    }
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString *str = [NSString stringWithFormat:@"%@",deviceToken];
    
    NSLog(@"coupon Token %@", str);
    [Common deviceToken:str];
    
}
- (void)application:(UIApplication *)application   didRegisterUserNotificationSettings:   (UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString   *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    if ([identifier isEqualToString:@"declineAction"]){
    }
    else if ([identifier isEqualToString:@"answerAction"]){
    }
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication  annotation:(id)annotation {

    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
    
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler {
    BOOL handledByBranch = [[Branch getInstance] continueUserActivity:userActivity];
    return handledByBranch;
}
-(void)verifyAutoLoginDetails{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
    
    if([[Common getCustomertype]isEqualToString:@"C"]) {
        
        
        LAContext *myContext = [[LAContext alloc] init];
        NSError *authError = nil;
        NSString *myLocalizedReasonString = NSLocalizedString(@"VerifyAuthenticationtoLogin", nil);
        
        if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
            [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                      localizedReason:myLocalizedReasonString
                                reply:^(BOOL success, NSError *error) {
                                    if (success) {
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            LoaderViewController *loginVC=[storyboard instantiateViewControllerWithIdentifier:@"vcloader"];
                                            [self.window setRootViewController:loginVC];
                                        });
                                    } else
                                        [self InvalidDevicePassword];
                                }];
        }else if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&authError]){
            [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError *error){
                if(success){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        
                        LoaderViewController *loginVC=[storyboard instantiateViewControllerWithIdentifier:@"vcloader"];
                        [self.window setRootViewController:loginVC];
                        
                        
                    });
                } else
                    [self InvalidDevicePassword];
            }];
        }else
            [self EnterPassword];
    }
}
-(void)InvalidDevicePassword{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        topWindow.rootViewController = [UIViewController new];
        topWindow.windowLevel = UIWindowLevelAlert + 1;
        UIAlertController *alertController1 = [UIAlertController
                                               alertControllerWithTitle:NSLocalizedString(@"ERROR", nil)
                                               message:NSLocalizedString(@"Cann'tVerifyyouraccount", nil)
                                               preferredStyle:UIAlertControllerStyleAlert];
        topWindow.hidden = YES;
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Enter Password", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {   [self EnterPassword];
                                   }];
        UIAlertAction *cancel = [UIAlertAction
                                 actionWithTitle:NSLocalizedString(@"CANCEL", @"Cancel action")
                                 style:UIAlertActionStyleDestructive
                                 handler:^(UIAlertAction *action)
                                 {}];
        
        cancel.enabled=TRUE;
        [alertController1 addAction:okAction];
        [alertController1 addAction:cancel];
        
        [topWindow makeKeyAndVisible];
        [topWindow.rootViewController presentViewController:alertController1 animated:YES completion:nil];
    });
}
-(void)CheckPassword:(UITextField *)pass{
    
    if([[Common getCustomerpassword] isEqualToString:pass.text]){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSBundle *bundle = [NSBundle mainBundle];
            NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
            LoaderViewController *loginVC=[storyboard instantiateViewControllerWithIdentifier:@"vcloader"];
            [self.window setRootViewController:loginVC];
        });
    }else
        [self PasswordErrorMessage];
    
}
-(void)EnterPassword{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        topWindow.rootViewController = [UIViewController new];
        topWindow.windowLevel = UIWindowLevelAlert + 1;
        UIAlertController *alertController1 = [UIAlertController
                                               alertControllerWithTitle:NSLocalizedString(@"EnterLoginPassword", nil)
                                               message:[NSString stringWithFormat:@"UserId:%@",[Common getCustomerEmailID]]
                                               preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController1 addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = NSLocalizedString(@"PASSWORD", nil);
            textField.textColor = [UIColor blackColor];
            textField.tintColor = [UIColor blackColor];
            textField.secureTextEntry=YES;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            [textField addTarget:self
                          action:@selector(alertTextFieldDidChange:)
                forControlEvents:UIControlEventEditingChanged];
            topWindow.hidden = YES;
        }];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {   UITextField *name = alertController1.textFields.firstObject;
                                       [self CheckPassword:name];
                                   }];
        okAction.enabled=FALSE;
        [alertController1 addAction:okAction];
        
        [topWindow makeKeyAndVisible];
        [topWindow.rootViewController presentViewController:alertController1 animated:YES completion:nil];
    });
}
-(void)PasswordErrorMessage{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        topWindow.rootViewController = [UIViewController new];
        topWindow.windowLevel = UIWindowLevelAlert + 1;
        UIAlertController *alertController1 = [UIAlertController
                                               alertControllerWithTitle:NSLocalizedString(@"ERROR", nil)
                                               message:[NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"IncorrectPassword", nil),[Common getCustomerEmailID]]
                                               preferredStyle:UIAlertControllerStyleAlert];
        topWindow.hidden = YES;
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                   }];
        [alertController1 addAction:okAction];
        [topWindow makeKeyAndVisible];
        [topWindow.rootViewController presentViewController:alertController1 animated:YES completion:nil];
    });
}

-(void)alertTextFieldDidChange:(UITextField *)textField{
    UIViewController *vc=[UIApplication sharedApplication].keyWindow.rootViewController;
    UIAlertController *alertcont=(UIAlertController *)vc.presentedViewController;
    if (alertcont)
    {
        UITextField *name = alertcont.textFields.firstObject;
        UIAlertAction *okAction = alertcont.actions.firstObject;
        okAction.enabled = name.text.length > 1;
    }
}

@end
