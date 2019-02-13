//
//  MZMassRedeem.h
//  Mezzofy
//
//  Created by Mezzofy on 05/10/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZUtils.h"
#import "MZCouponMassRedeemResponse.h"
#import "MassCouponDataModel.h"

@interface MZMassRedeem : NSObject
- (MZCouponMassRedeemResponse *)MassRedeemCreate:(MassCouponDataModel *)pMassCoupon;
- (MZCouponMassRedeemResponse *)GetMassCouponDetail:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId;


//- (void)LoadMassRedeemDetailByMassId:(NSString *)pMassId;
//- (void)LoadMassRedeemDetailByReferenceId:(NSString *)pReferenceId;
//- (MZCouponMassRedeemResponse *)MassRedeemToServer:(MassCouponDataModel *)pMassCoupon;
//- (MZCouponMassRedeemResponse *)getMassRedeemStatusFromServer:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId;
@end

