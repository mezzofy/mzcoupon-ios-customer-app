//
//  Tbl_CustomerDeviceModel.m
//  ProWallet
//
//  Created by Inforios on 25/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerDeviceModel.h"

@implementation TblCustomerDeviceModel
@synthesize customer;
@synthesize device;
+(Class)customer_class{
    return [TblCustomerData class];
}
+(Class)device_class{
    return [TblCustomerDeviceData class];
}
@end
