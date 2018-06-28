//
//  MZCouponOrderResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponOrderResponse.h"

@implementation MZCouponOrderResponse
@synthesize order;
@synthesize orderitems;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)order_class {
    return [OrderData class];
}

+ (Class)orderitems_class {
    return [OrderItemDataModel class];
}
@end
