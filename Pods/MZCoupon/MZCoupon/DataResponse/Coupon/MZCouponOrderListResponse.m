//
//  MZCouponOrderListResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponOrderListResponse.h"

@implementation MZCouponOrderListResponse
@synthesize orders;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)orders_class {
    return [OrderDataModel class];
}
+ (Class)size_class {
    return [DataReaponseDataModel class];
}
@end
