//
//  MZCouponProductOrderResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 09/03/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponProductOrderResponse.h"

@implementation MZCouponProductOrderResponse

@synthesize po;
@synthesize podetails;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)po_class {
    return [ProductOrderData class];
}
+ (Class)podetails_class {
    return [ProductOrderDataModel class];
}
@end
