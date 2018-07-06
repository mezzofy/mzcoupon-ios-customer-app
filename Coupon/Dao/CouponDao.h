//
//  CouponDao.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblCouponData.h"
#import "TblProduct.h"
#import <MZCoupon/MZCoupon.h>
@interface CouponDao : NSObject
- (BOOL)addCoupondata:(TblCouponData *)pcoupondata;
- (BOOL)updateCouponData:(TblCouponData *)pcoupondata;
- (BOOL)addCoupondataPlatform:(CouponData *)pcoupondata;
- (BOOL)updateCouponDataPlatform:(CouponData *)pcoupondata;
- (TblCouponData *)getCouponDataStatus:(NSString *)status CouponId:(NSString *)pcouponId;
- (void)insertCouponCountByCampaigniD:(NSString *)pcampaignId couponCount:(NSString *)psize;
- (TblProduct *)getCampaignWithCouponCountByOffset:(NSInteger)poffset;
- (NSInteger)getCampaigncountWithCouponCount;
- (TblCouponData *)getCampaignWithCouponType:(NSString *)ptype ByOffset:(NSInteger)poffset;
- (NSInteger)getCampaigncountWithCouponType:(NSString *)ptype;
- (TblCouponData *)getActiveCouponCampaignId:(NSString *)pCampaignid ByOffset:(NSInteger)poffset;
- (NSInteger)getActiveCouponCampaignId:(NSString *)pCampaignid;
- (TblCouponData *)getCouponDetailsWhereCouponId:(NSString *)pcouponid;


//MassRedeem
- (NSMutableArray *)getMyCouponBySite:(NSString *)psite ;

@end
