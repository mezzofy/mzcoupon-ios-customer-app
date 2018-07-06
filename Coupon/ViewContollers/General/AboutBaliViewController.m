//
//  AboutBaliViewController.m
//  BaliCouponWallet
//
//  Created by Eric Pang on 24/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

//#import "AboutBaliViewController.h"
//#import "SiteMapController.h"
//
//@interface AboutBaliViewController ()
//
//@end
//
//@implementation AboutBaliViewController
//@synthesize parentvc;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//}
//
//- (IBAction)btnBack_Touch:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (IBAction)callPhone:(id)sender {
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://12345678"]];
//}
//
//@end

#import "AboutBaliViewController.h"
#import "MyAnnotation.h"
#import "Utils.h"
#import "Common.h"
#import "OutletDetailViewController.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface AboutBaliViewController (){
    
    CLLocationManager *manager;
    NSMutableArray *arrysitelist;
    CLLocationCoordinate2D locatios;
    
    NSNumber *siteId;
}

@end

@implementation AboutBaliViewController
@synthesize mapdisplay;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"map", nil);
    mapdisplay.delegate = self;
    mapdisplay.showsUserLocation = YES;
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    //Replace the methods below with your required method name.
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    [manager startUpdatingLocation];
}


-(void)loadmap{
    
//    NSArray* oldannots = [mapdisplay annotations];
//    LoaderModule *modload=[[LoaderModule alloc]init];
//    [modload loadMapList:[Common compid]latit:locatios.latitude longit:locatios.longitude kms:[NSNumber numberWithInt:10]];
//    MerchantModule *daomercht=[[MerchantModule alloc]init];
//    arrysitelist=[daomercht getMapsitelist];
//    for (TblMap *objmap in arrysitelist) {
//        MyAnnotation *myAnnotation = [[MyAnnotation alloc] init];
//        CLLocationCoordinate2D theCoordinate;
//        theCoordinate.latitude = [objmap.latitude floatValue];
//        theCoordinate.longitude = [objmap.longitude floatValue];
//        myAnnotation.coordinate = theCoordinate;
//        myAnnotation.title = [objmap merchantName];
//        myAnnotation.subtitle =[NSString stringWithFormat:@"%@,%@",[objmap siteName],[objmap siteAddress]];
//        myAnnotation.siteContact=[objmap siteContact];
//        myAnnotation.siteId=[objmap siteId];
//        
//        [mapdisplay addAnnotation:myAnnotation];
//    }
//    [mapdisplay removeAnnotations:oldannots];
//    [manager stopUpdatingLocation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated {
//    
//    [self.navigationController setNavigationBarHidden:NO];
//}
//- (IBAction)btnclose:(id)sender {
//    [self.navigationController popViewControllerAnimated:NO];
//}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)callPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://12345678"]];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinAnnotation = nil;
    if(annotation != mapdisplay.userLocation)
    {
        static NSString *defaultPinID = @"myPin";
        pinAnnotation = (MKPinAnnotationView *)[mapdisplay dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinAnnotation == nil )
            pinAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        
        pinAnnotation.canShowCallout = YES;
        
        //instatiate a detail-disclosure button and set it to appear on right side of annotation
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotation.rightCalloutAccessoryView = infoButton;
        
    }
    
    return pinAnnotation;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    MyAnnotation *mapannotation= (MyAnnotation *)[view annotation];
//    TblMap *tblsite=[[TblMap alloc]init];
//    [tblsite setSiteId:[mapannotation siteId]];
//    siteId=tblsite.siteId;
    [self performSegueWithIdentifier:@"showdetails" sender:view];

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)Manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    [manager stopUpdatingLocation];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Error"
                                          message:@"Failed to Get Your Location"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Settings", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   if (@available(iOS 9, *)) {
                                       [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                   }else{
                                       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
                                   }
                               }];
    
    UIAlertAction *cancel = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {}];
    
    
    
    [alertController addAction:okAction];
    [alertController addAction:cancel];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
}

-(void)checkStatus:(CLLocation *)currentLocation
{
    if(currentLocation != Nil){
        
        [manager stopUpdatingLocation];
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        // locatios.latitude=22.31667;
        // locatios.longitude=114.18333;
        locatios.latitude = currentLocation.coordinate.latitude;
        locatios.longitude = currentLocation.coordinate.longitude;
        [self checkStatus:currentLocation];
        [self loadmap];
        [self zoomToFitMapAnnotations];
        
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showdetails"]) {
        OutletDetailViewController *proDetails = segue.destinationViewController;
        proDetails.nsiteid = siteId;
    }
}
- (void)zoomToFitMapAnnotations {
    [mapdisplay setRegion:[Utils getRegionByMiles:10.0 Location:locatios] animated:YES];
}
- (IBAction)maprecenter:(id)sender {
    [mapdisplay setCenterCoordinate:mapdisplay.userLocation.location.coordinate animated:YES];
}

@end
