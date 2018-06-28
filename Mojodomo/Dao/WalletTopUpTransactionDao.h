//
//  WalletTopUpTransactionDao.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 18/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "TblWalletTxnData.h"
#import <MZCoupon/MZCoupon.h>

@interface WalletTopUpTransactionDao : NSObject
- (TblWalletTxnData *)getWalletTransaction:(NSString *)ptransactionReference;
- (BOOL)AddWalletTransactionList:(WalletTxnData *)pwallettxndata;
- (BOOL)UpdateWalletTransactionList:(WalletTxnData *)pwallettxndata;

//Database
- (TblWalletTxnData *)getWalletTransactionbyOffset:(NSInteger)poffset Status:(NSString *)pstatus;
- (NSInteger)getWalletTransactioncountStatus:(NSString *)pstatus;
@end
