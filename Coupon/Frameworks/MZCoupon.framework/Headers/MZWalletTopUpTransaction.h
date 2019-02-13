//
//  WalletTopTransaction.h
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZWalletTransactionResponse.h"
#import "MZWalletTransactionListResponse.h"
#import "WalletTxnDataModel.h"
#import "MZUtils.h"

@interface MZWalletTopUpTransaction : NSObject

//- (MZWalletTransactionResponse *)PostWalletTopUpTransationDataToServer:(WalletTxnDataModel *)pwalletTxnmodel;
//- (MZWalletTransactionResponse *)getWalletTopUpTransationDataFromServer:(NSString *)pTransationId;
//- (MZWalletTransactionListResponse *)getWalletAllTransationListFromServer:(NSString *)pStatus Offset:(NSInteger )poffsetId;

- (MZWalletTransactionResponse *)WalletTransactionCreate:(WalletTxnDataModel *)pwalletTxnmodel;
- (MZWalletTransactionListResponse *)GetWalletTransactions:(NSString *)pStatus Offset:(NSInteger )poffsetId;
- (MZWalletTransactionResponse *)WalletTopUpTransationByTransactionId:(NSString *)pTransationId;

@end
