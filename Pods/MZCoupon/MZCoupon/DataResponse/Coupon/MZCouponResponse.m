//
//  MZCouponResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 22/02/18.
//  Copyright © 2018 Vasanth Inforios. All rights reserved.
//

#import "MZCouponResponse.h"

@implementation MZCouponResponse

@synthesize size;
@synthesize customercoupons;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)size_class {
    return [DataReaponseDataModel class];
}
+ (Class)customercoupons_class {
    return [CustomerCouponDataModel class];
}
@end
