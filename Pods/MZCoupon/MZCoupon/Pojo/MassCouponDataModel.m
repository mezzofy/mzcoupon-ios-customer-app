//
//  MassCouponDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 13/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MassCouponDataModel.h"

@implementation MassCouponDataModel

@synthesize masscoupon;
@synthesize masscoupondtls;

+ (Class)masscoupon_class {
    return [MasscouponData class];
}
+ (Class)masscoupondtls_class {
    return [MassCouponDetailDataModel class];
}
@end
