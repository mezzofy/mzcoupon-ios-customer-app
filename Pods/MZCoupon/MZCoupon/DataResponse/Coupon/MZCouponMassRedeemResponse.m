//
//  MZCouponMassRedeemResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponMassRedeemResponse.h"

@implementation MZCouponMassRedeemResponse
@synthesize masscoupon;
@synthesize masscoupondtls;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)masscoupon_class {
    return [MasscouponData class];
}
+ (Class)masscoupondtls_class {
    return [MassCouponDetailDataModel class];
}
@end
