//
//  TblCouponModel.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerCouponModel.h"

@implementation TblCustomerCouponModel
@synthesize coupon;
@synthesize size;
@synthesize campaign;

+ (Class)campaign_class {
    return [TblProduct class];
}

+ (Class)coupon_class {
    return [TblCouponData class];
}
@end
