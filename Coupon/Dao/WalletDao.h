//
//  WalletDao.h
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblWalletData.h"
#import "FMDatabase.h"
#import "Utils.h"
#import <MZCoupon/MZCoupon.h>

@interface WalletDao : NSObject
- (TblWalletData *)getWallet:(NSString *)pwallet;
- (BOOL)AddWalletList:(WalletData *)pwalletdata;
- (BOOL)UpdateWalletList:(WalletData *)pwalletdata;



- (TblWalletData *)getwallet;
@end
