//
//  MZCoupon.h
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductData.h"
#import "CouponData.h"
#import "GiftcouponDataModel.h"
#import "MZCouponResponse.h"
#import "MZCouponSizeResponse.h"
#import "MZCouponStockResponse.h"
#import "MZCouponGiftResponse.h"

@interface MZCouponModule: NSObject

//Active,Redeem And Expriy Coupon
- (MZCouponResponse * )getCoupons:(NSString *)CustomerID CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;

//Gift Coupon
- (MZCouponGiftResponse *)SendGiftCoupon:(GiftcouponDataModel *)pGiftCoupon;

//Current Coupon Details
- (MZCouponSizeResponse *)getCouponById:(NSString *)pCouponId;


//Release Coupon Stock
- (MZCouponStockResponse *)getredeamstockfromserver:(NSString *)pcampaignId couponId:(NSString *)pCouponId;

//Active coupon count
- (MZCouponResponse *)getCouponByStatus:(NSString *)CustomerID CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;
//Coupon Details
- (MZCouponResponse *)getCouponsByCampaign:(NSString *)pcampaign Customer:(NSString *)CustomerID CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;

//Get Coupon Stock
- (MZCouponStockResponse *)getCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId;

//Redeem Stock
- (MZCouponStockResponse *)ReleaseCouponStockByCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId;






@end
