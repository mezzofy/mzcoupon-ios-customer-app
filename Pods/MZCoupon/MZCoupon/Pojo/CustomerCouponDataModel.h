//
//  CustomerCouponDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "CouponData.h"
#import "ProductData.h"
@interface CustomerCouponDataModel : MZJastor
@property(nonatomic ,strong)CouponData *coupon;
@property (nonatomic, strong) ProductData *campaign;
@property (nonatomic, strong) NSString *size;
@end
