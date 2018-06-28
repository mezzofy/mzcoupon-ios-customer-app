//
//  CouponOrderModule.h
//  ProWallet
//
//  Created by Inforios on 13/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "TblOrderModel.h"
#import "TblSiteModel.h"


@interface CouponOrderModule : NSObject
//Get Order List From Server
- (void)getCouponOrderListFromServer:(NSUInteger)poffset;

//Get Order Detail From Server
- (void)getCouponOrderDetailsFromServer:(NSString *)pCouponId;

//Put Order Server
- (NSString *)OrderCouponToServer:(TblOrderModel *)pOrderCoupon;

//Get Present Order Status
- (NSString *)getOrderTrackFromServer:(NSString *)pCouponId;

//Get site by site pass
-(TblSite *)getSiteFromServerBySitepass:(NSString *)pSitepass;


//DataBase
- (TblOrderData *)getCouponOrderData:(NSString *)pcouponId;
@end
