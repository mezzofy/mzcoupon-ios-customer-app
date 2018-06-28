//
//  NearestBeaconManager.h
//  MezzofyProximityContentG95
//

#import <Foundation/Foundation.h>

#import "BeaconID.h"

@class NearestBeaconManager;

@protocol NearestBeaconManagerDelegate <NSObject>

- (void)nearestBeaconManager:(NearestBeaconManager *)nearestBeaconManager didUpdateNearestBeaconID:(BeaconID *)beaconID;

@end

@interface NearestBeaconManager : NSObject

@property (weak, nonatomic) id<NearestBeaconManagerDelegate> delegate;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithBeaconRegions;

- (void)startNearestBeaconUpdates;
- (void)stopNearestBeaconUpdates;

@end
