//
//  TblMassCouponModel.m
//  ProWallet
//
//  Created by Inforios on 13/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblMassCouponModel.h"

@implementation TblMassCouponModel

@synthesize masscoupon;
@synthesize masscoupondtls;

+ (Class)masscoupon_class {
    return [TblMasscouponData class];
}
+ (Class)masscoupondtls_class {
    return [TblMassCouponDetailModel class];
}
@end
