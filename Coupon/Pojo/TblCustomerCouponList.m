//
//  TblCouponList.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerCouponList.h"

@implementation TblCustomerCouponList
@synthesize customercoupons;

+ (Class)customercoupons_class {
    return [TblCustomerCouponModel class];
}
@end
