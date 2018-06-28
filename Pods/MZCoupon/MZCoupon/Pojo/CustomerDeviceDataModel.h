//
//  CustomerDeviceDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 25/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "CustomerData.h"
#import "CustomerDeviceData.h"
@interface CustomerDeviceDataModel : MZJastor
@property (nonatomic, strong) CustomerData *customer;
@property (nonatomic, strong) CustomerDeviceData *device;
@end
