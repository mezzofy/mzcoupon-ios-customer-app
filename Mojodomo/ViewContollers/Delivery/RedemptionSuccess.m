//
//  RedemptionSuccess.m
//  EB
//
//  Created by Kaliyarajalu on 16/02/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "RedemptionSuccess.h"
#import "Common.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface RedemptionSuccess ()
{
//    LoaderModule *modloader;
//    JsonProductList *objtrans;
    
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}
@end

@implementation RedemptionSuccess
@synthesize strType;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Location current
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    
    latitude=[NSNumber numberWithDouble:curlatitude];
    longitude=[NSNumber numberWithDouble:curlongitude];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

}

- (IBAction)btnClose_Touch:(id)sender {
    
  if ([strType isEqualToString:@"scan"]) {
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
        [self.pparent.navigationController popToRootViewControllerAnimated:YES];
    }];

 }else if ([_flag isEqualToString:@"MassRedeem"]) {
     [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
         [self.pparent.navigationController popToRootViewControllerAnimated:YES];
     }];

 
 }else if(self.presentingViewController.presentingViewController.presentingViewController != NULL){
        [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
            [self.pparent.navigationController popToRootViewControllerAnimated:YES];
        }];
        
        
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            [self.pparent.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
    //}
//    [self dismissViewControllerAnimated:FALSE completion:nil];
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
//    UIViewController  *vc=[storyboard instantiateViewControllerWithIdentifier:@"vcmainscreen"];
//    [[[UIApplication sharedApplication] keyWindow] setRootViewController:vc];
    
}

@end
