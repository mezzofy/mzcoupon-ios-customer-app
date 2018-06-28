//
//  _CustomerDeviceData.h
//  Mezzofy
//
//  Created by Mezzofy on 25/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface CustomerDeviceData : MZJastor
@property (nonatomic, strong) NSString *custDeviceId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceUuid;
@property (nonatomic, strong) NSString *updatedOn;
@end
