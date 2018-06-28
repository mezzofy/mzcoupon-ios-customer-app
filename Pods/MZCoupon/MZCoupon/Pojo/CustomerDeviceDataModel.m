//
//  CustomerDeviceDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 25/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "CustomerDeviceDataModel.h"

@implementation CustomerDeviceDataModel
@synthesize customer;
@synthesize device;
+(Class)customer_class{
    return [CustomerData class];
}
+(Class)device_class{
    return [CustomerDeviceData class];
}
@end
