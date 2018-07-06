//
//  AboutBaliViewController.h
//  BaliCouponWallet
//
//  Created by Eric Pang on 24/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@interface AboutBaliViewController : UIViewController
//@property (nonatomic, retain) UIViewController *parentvc;
//@end

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AboutBaliViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapdisplay;
- (IBAction)btnclose:(id)sender;
@end