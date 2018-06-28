//
//  CouponModule.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProduct.h"
#import "TblCouponData.h"
#import "TblGiftcouponModel.h"

@interface CouponModule : NSObject
//Redeem And Expriy Coupon
+ (void)getCouponListFromServerCouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;

//Active coupon count
+ (void)getCouponCountListfromServer:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;

//Check Current Coupon Status
+ (TblCouponData *)getCouponDetailsFromServer:(NSString *)pCouponId;

//Get Coupon Stock
+ (NSString *)getCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId;

//Release Coupon Stock
+ (NSString *)releaseCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId;

//Redeem Stock
+ (NSString *)RedeemCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId;

//Active Coupon
+ (void)getCampaignCouponListFromServer:(NSString *)pcampaign CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset;

//Gift Coupon
+ (NSString *)SendGiftCouponToPartner:(TblGiftcouponModel *)pGiftCoupon;


//MassRedeem
+ (NSMutableArray *)getMyCouponBySite:(NSString *)psite;


@end
