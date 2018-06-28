//
//  MassRedeemModule.h
//  ProWallet
//
//  Created by Inforios on 05/10/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "LoaderModule.h"
#import "TblMassCouponModel.h"
#import <MZCoupon/MZCoupon.h>

@interface MassRedeemModule : NSObject
- (void)LoadMassRedeemDetailByMassId:(NSString *)pMassId;
- (void)LoadMassRedeemDetailByReferenceId:(NSString *)pReferenceId;
- (MZCouponMassRedeemResponse *)MassRedeemToServer:(TblMassCouponModel *)pMassCoupon;
- (MZCouponMassRedeemResponse *)getMassRedeemStatusFromServer:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId;
@end
