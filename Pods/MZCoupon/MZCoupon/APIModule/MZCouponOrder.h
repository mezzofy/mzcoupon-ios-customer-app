//
//  MZCouponOrder.h
//  Mezzofy
//
//  Created by Mezzofy on 13/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZUtils.h"
#import "OrderDataModel.h"
#import "SiteDataModel.h"
#import "MZCouponOrderListResponse.h"
#import "MZCouponOrderResponse.h"
#import "MZCouponSiteResponse.h"


@interface MZCouponOrder : NSObject
//Get Order List From Server
- (MZCouponOrderListResponse *)GetCouponOrder:(NSString *)CustomerID Offset:(NSUInteger)poffset;
//Get Order Detail From Server
- (MZCouponOrderResponse *)GetCouponOrderById:(NSString *)pCouponId;

//Put Order Server
- (MZCouponOrderResponse *)CreateCouponOrder:(OrderDataModel *)pOrderCoupon;

//Order Track Status
- (MZCouponOrderResponse *)TrackCouponOrder:(NSString *)pCouponId;

//Get site by site pass
-(MZCouponSiteResponse *)CheckSitePass:(NSString *)pSitepass;




@end
