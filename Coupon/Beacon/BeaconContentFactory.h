//
//  BeaconContentFactory.h
//  MezzofyProximityContentG95
//

#import "BeaconID.h"

@protocol BeaconContentFactory <NSObject>

- (void)contentForBeaconID:(BeaconID *)beaconID completion:(void (^)(id content))completion;

@end
