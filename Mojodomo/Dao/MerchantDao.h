//
//  MerchantDao.h
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Utils.h"
#import "TblMerchant.h"
#import <MZCoupon/MZCoupon.h>

@interface MerchantDao : NSObject
- (TblMerchant *)getMerchant:(NSString *)pmerchantId;
- (BOOL)addMerchant:(MerchantData *)pmerchant;
- (void)deleteMerchant;
- (NSString *)getMerchantValue:(NSString *)pkey;
@end
