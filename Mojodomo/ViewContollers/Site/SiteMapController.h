//
//  SiteMapController.h
//  EB
//
//  Created by Kaliyarajalu on 04/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TblSite.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SiteMapController : UIViewController<MKMapViewDelegate,UIAlertViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapControl;
@property (strong, atomic) TblSite *objsite;

@end
