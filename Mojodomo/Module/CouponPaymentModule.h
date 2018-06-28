//
//  CouponPaymentModule.h
//  ProWallet
//
//  Created by Inforios on 17/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProductOrderListModel.h"
#import <MZCoupon/MZCoupon.h>

@interface CouponPaymentModule : NSObject
//Download free Coupon
- (NSString *)downloadFreeCouponFromServer:(ProductOrderListDataModel *)pproductOrder;

//Check Avalibality
- (NSString *)checkAvalibalityInServer:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt;

//Charge Coupopn
- (ProductOrderData *)downloadChargeCouponFromServer:(ProductOrderListDataModel *)pproductOrder;
@end
