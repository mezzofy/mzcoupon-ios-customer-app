//
//  HomeProductViewController.h
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "ZBarSDK.h"
#import "NearestBeaconManager.h"
#import <CoreLocation/CoreLocation.h>

@interface HomeProductViewController : UIViewController<ZBarReaderDelegate,UIAlertViewDelegate, NearestBeaconManagerDelegate, UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate,CBCentralManagerDelegate>

- (IBAction)btnscan_Touch:(id)sender;


- (IBAction)show:(id)sender;
@property(weak, nonatomic) UIViewController* parent;
@property (strong, nonatomic) IBOutlet UITextField *text_entercode;
@property (strong, nonatomic) IBOutlet UITableView *tableviewPromo;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic) NearestBeaconManager *nearestBeaconManager;

@property (nonatomic, strong) CBCentralManager* bluetoothManager;
@end
