//
//  CouponPaymentModule.h
//  ProWallet
//
//  Created by Inforios on 17/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProductOrderListModel.h"

@interface CouponPaymentModule : NSObject
//Download free Coupon
- (NSString *)downloadFreeCouponFromServer:(TblProductOrderListModel *)pproductOrder;

//Check Avalibality
- (NSString *)checkAvalibalityInServer:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt;

//Charge Coupopn
- (TblProductOrder *)downloadChargeCouponFromServer:(TblProductOrderListModel *)pproductOrder;
@end
