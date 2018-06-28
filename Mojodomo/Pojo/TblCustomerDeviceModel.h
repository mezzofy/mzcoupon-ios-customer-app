//
//  Tbl_CustomerDeviceModel.h
//  ProWallet
//
//  Created by Inforios on 25/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblCustomerData.h"
#import "TblCustomerDeviceData.h"
@interface TblCustomerDeviceModel : Jastor
@property (nonatomic, strong) TblCustomerData *customer;
@property (nonatomic, strong) TblCustomerDeviceData *device;
@end
