//
//  CustomerCouponListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "CustomerCouponListDataModel.h"

@implementation CustomerCouponListDataModel
@synthesize customercoupons;

+ (Class)customercoupons_class {
    return [CustomerCouponDataModel class];
}
@end
