//
//  CouponOrderDao.h
//  ProWallet
//
//  Created by Inforios on 19/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Utils.h"
#import "TblOrderData.h"
#import "TblOrderItemData.h"
#import "TblOrderTrackData.h"
#import "TblOrderModifierData.h"
#import <MZCoupon/MZCoupon.h>

@interface CouponOrderDao : NSObject
- (BOOL)addCouponOrderdata:(OrderData *)pOrderdata;
- (BOOL)updateCouponOrderData:(OrderData *)pOrderdata;
- (BOOL)addCouponOrderItem:(OrderItemData *)pcouponitem;
- (BOOL)updateCouponOrderItem:(OrderItemData *)pcouponitem;
- (BOOL)addCouponOrderTrack:(OrderTrackData *)pcouponordertrack;
- (BOOL)updateCouponOrderTrack:(OrderTrackData *)pcouponordertrack;
- (BOOL)addCouponOrderModifier:(OrderModifierData *)pcouponmodifier;
- (BOOL)updateCouponOrderModifier:(OrderModifierData *)pcouponmodifier;

- (TblOrderData *)getCouponOrderData:(NSString *)pcouponId;
- (TblOrderItemData *)getCouponOrderItem:(NSString *)porderItemId;
- (TblOrderTrackData *)getCouponOrderTrack:(NSString *)ptrackId;
- (TblOrderModifierData *)getCouponOrderModifier:(NSString *)porderModifierId;
@end
