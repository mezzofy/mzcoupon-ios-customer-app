//
//  MerchantModule.h
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblMerchant.h"
@interface MerchantModule : NSObject
//Merchant List
- (void)MerchantDetailsFromServer;

//DataBase
- (TblMerchant *)getMerchant:(NSString *)pmerchantId;
@end
