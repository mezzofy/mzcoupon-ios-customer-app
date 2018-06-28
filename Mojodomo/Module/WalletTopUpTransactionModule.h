//
//  WalletTopTransactionModule.h
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblWalletTxnModel.h"
#import "TblWalletTxnListModel.h"
#import "Utils.h"
#import <MZCoupon/MZCoupon.h>

@interface WalletTopUpTransactionModule : NSObject

- (NSString *)PostWalletTopUpTransationDataToServer:(WalletTxnDataModel *)pwalletTxnmodel;
- (NSString *)getWalletTopUpTransationDataFromServer:(NSString *)pTransationId;
- (void)getWalletAllTransationListFromServer:(NSString *)pStatus Offset:(NSUInteger )poffsetId;


//Data Base
- (TblWalletTxnData *)getWalletTransactionbyOffset:(NSInteger)poffset Status:(NSString *)pstatus;
- (NSInteger)getWalletTransactioncountStatus:(NSString *)pstatus;
@end
