//
//  NearestBeaconManager.m
//  MezzofyProximityContentG95
//

#import "NearestBeaconManager.h"

@interface NearestBeaconManager () <ESTBeaconManagerDelegate>

@property (nonatomic) ESTBeaconManager *beaconManager;

@property (nonatomic) BeaconID *nearestBeaconID;
@property (nonatomic) BOOL firstEventSent;

@end

@implementation NearestBeaconManager{
    CLBeaconRegion *beaconRegion;
}

- (instancetype)initWithBeaconRegions {
    self = [super init];
    if (self) {
        beaconRegion = [[CLBeaconRegion alloc]
                        initWithProximityUUID:[[NSUUID alloc]
                                               initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"]
                        identifier:@"ranged region"];
        
        self.beaconManager = [ESTBeaconManager new];
        self.beaconManager.delegate = self;
        self.beaconManager.returnAllRangedBeaconsAtOnce = YES;
        [self.beaconManager requestWhenInUseAuthorization];
        
        self.firstEventSent = false;
    }
    return self;
}

- (void)startNearestBeaconUpdates {
    [self.beaconManager startRangingBeaconsInRegion:beaconRegion];
}

- (void)stopNearestBeaconUpdates {
    [self.beaconManager stopRangingBeaconsInRegion:beaconRegion];
}

- (void)beaconManager:(id)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    //CLBeacon *nearestBeacon = beacons.firstObject;
    
    // if (!(nearestBeacon.beaconID == nil && self.nearestBeaconID == nil)
    // || ![nearestBeacon.beaconID isEqual:self.nearestBeaconID]
    //  || !self.firstEventSent) {
    if (!([beacons count]==0)) {
        [self stopNearestBeaconUpdates];
        [self.delegate nearestBeaconManager:self didUpdateNearestBeaconID:beacons];
    }
    
    // self.nearestBeaconID = nearestBeacon.beaconID;
    
    // self.firstEventSent = true;
    //}
}

- (void)beaconManager:(id)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        NSLog(@"Location Services are disabled for this app, which means it won't be able to detect beacons.");
    }
}

- (void)beaconManager:(id)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error {
    NSLog(@"Ranging failed for region: %@. Make sure that Bluetooth and Location Services are on, and that Location Services are allowed for this app. Beacons require a Bluetooth Low Energy compatible device: <http://www.bluetooth.com/Pages/Bluetooth-Smart-Devices-List.aspx>. Note that the iOS simulator doesn't support Bluetooth at all. The error was: %@", region.identifier, error);
}


@end
