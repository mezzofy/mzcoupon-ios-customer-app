//
//  MZCouponSizeResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponSizeResponse.h"

@implementation MZCouponSizeResponse

@synthesize coupon;
@synthesize size;
@synthesize campaign;
@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)campaign_class {
    return [ProductData class];
}

+ (Class)coupon_class {
    return [CouponData class];
}
@end
