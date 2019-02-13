//
//  MZMerchant.h
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MerchantData.h"
#import "MZCouponConfig.h"
#import "MZUtils.h"
#import "MZMerchantResponse.h"
@interface MZMerchant : NSObject

- (MZMerchantResponse *)GetMerchantById:(NSString *)pmerchantId;


@end
