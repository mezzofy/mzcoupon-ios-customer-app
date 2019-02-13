//
//  MZCouponPayment.h
//  Mezzofy
//
//  Created by Mezzofy on 17/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductOrderListDataModel.h"
#import "MZCouponProductOrderResponse.h"
#import "MZCouponOverResponse.h"

@interface MZCouponPayment : NSObject
//Download free Coupon
- (MZCouponProductOrderResponse *)RequestFreeCoupon:(ProductOrderListDataModel *)pproductOrder;

//Download free Coupon with Channel
- (MZCouponProductOrderResponse *)RequestFreeCouponWithChannel:(NSString *)pChannelCode Data:(ProductOrderListDataModel *)pproductOrder;

//Check Avalibality
- (MZCouponOverResponse *)checkProductAvilability:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt;

//Charge Coupopn
- (MZCouponProductOrderResponse *)RequestChargeCoupons:(ProductOrderListDataModel *)pproductOrder;

@end
