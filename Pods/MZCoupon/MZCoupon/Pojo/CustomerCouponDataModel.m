//
//  CustomerCouponDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "CustomerCouponDataModel.h"

@implementation CustomerCouponDataModel
@synthesize coupon;
@synthesize size;
@synthesize campaign;

+ (Class)campaign_class {
    return [ProductData class];
}

+ (Class)coupon_class {
    return [CouponData class];
}
@end
