//
//  Tbl_CustomerDeviceData.h
//  ProWallet
//
//  Created by Inforios on 25/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblCustomerDeviceData : Jastor
@property (nonatomic, strong) NSString *custDeviceId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceUuid;
@property (nonatomic, strong) NSString *updatedOn;
@end
