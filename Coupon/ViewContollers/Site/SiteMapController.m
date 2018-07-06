//
//  SiteMapController.m
//  EB
//
//  Created by Kaliyarajalu on 04/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "SiteMapController.h"
#import "Utils.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface SiteMapController () {
    CLLocationCoordinate2D locatios;
//    TblSite *tblsite;
    CLLocationManager *manager;
}

@end

@implementation SiteMapController
@synthesize mapControl;
@synthesize objsite;

- (void)viewDidLoad {
    [super viewDidLoad];
       NSLog(@"%@ %@ %@", [objsite siteAddress], [objsite siteLatitude], [objsite siteLongitude]);

    mapControl.delegate = self;
    mapControl.showsUserLocation = YES;
    mapControl.mapType = MKMapTypeStandard;

    locatios.latitude = [[objsite siteLatitude] doubleValue];
    locatios.longitude = [[objsite siteLongitude] doubleValue];

    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = locatios;
    point.title = [objsite siteName];
    point.subtitle = [NSString stringWithFormat:@"%@ %@", [objsite siteAddress], [objsite siteLocation]];
    [mapControl addAnnotation:point];
    
    self.title = [objsite siteName];
    [self zoomToFitMapAnnotations];
    
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    manager.distanceFilter = kCLDistanceFilterNone;
    //Replace the methods below with your required method name.
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    
    [manager startUpdatingLocation];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zoomToFitMapAnnotations {
    
    [mapControl setRegion:[Utils getRegionByMiles:10.0 Location:locatios] animated:YES];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView1 viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinAnnotation = nil;
    if(annotation != mapControl.userLocation)
    {
        static NSString *defaultPinID = @"myPin";
        pinAnnotation = (MKPinAnnotationView *)[mapControl dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
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
    UIAlertView *mapAlert = [[UIAlertView alloc]
                             initWithTitle:@"Maps"
                             message:@"Select Map Type"
                             delegate:self
                             cancelButtonTitle:@"Cancel"
                             otherButtonTitles:@"Apple Maps",@"Google Maps",nil];
    
    mapAlert.tag=2;
    [mapAlert show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==2){
        
        CLLocationCoordinate2D businessLocation = CLLocationCoordinate2DMake([[objsite siteLatitude] doubleValue],[[objsite siteLongitude] doubleValue]);
        if (buttonIndex==1) {
         
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:businessLocation
                                                           addressDictionary:nil];
            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
            [mapItem setName:[objsite siteAddress]];
            
            [mapItem openInMapsWithLaunchOptions:nil];
      
        } else if (buttonIndex==2) {
            NSString *siteaddr =[[objsite siteAddress] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSURL *url1=[NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?daddr=%@",siteaddr]];
            if (![[UIApplication sharedApplication] openURL:url1]) {
                NSLog(@"Google Maps app is not installed");
                //left as an exercise for the reader: open the Google Maps mobile website instead!
            } else {
                [[UIApplication sharedApplication] openURL:url1];
            }
            
            
        }

  }
}

@end
