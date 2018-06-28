//
//  MZCouponGiftResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponGiftResponse.h"

@implementation MZCouponGiftResponse
@synthesize sharecoupon;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+(Class)sharecoupon_class {
    return [GiftcouponData class];
}
@end
