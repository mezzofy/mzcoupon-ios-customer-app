//
//  WalletTopUpTransactionDao.m
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 18/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "WalletTopUpTransactionDao.h"

@implementation WalletTopUpTransactionDao
- (TblWalletTxnData *)getWalletTransaction:(NSString *)ptransactionReference{
    
    TblWalletTxnData *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT * FROM tbl_wallet_transcation WHERE transactionReference =?",ptransactionReference];
    if ([res next])
        retval = [[TblWalletTxnData alloc]initWithDictionary:[res resultDictionary]];
    
    [database close];
    return retval;
}
- (BOOL)AddWalletTransactionList:(WalletTxnData *)pwallettxndata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"insert into tbl_wallet_transcation( transactionReference, userId, merchantId, siteId, customerId, walletId, transactionType, transactionAmount, transactionPayRef, paidOn, processBy, status, transactionNotes, hashCode, transactionDate, paymentResponse, rewardPoint, updatedOn, approvalCode, delflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",[pwallettxndata transactionReference],[pwallettxndata userId], [pwallettxndata merchantId], [pwallettxndata siteId], [pwallettxndata customerId], [pwallettxndata walletId], [pwallettxndata transactionType] ,[pwallettxndata transactionAmount], [pwallettxndata transactionPayRef], [pwallettxndata paidOn], [pwallettxndata processBy], [pwallettxndata status], [pwallettxndata transactionNotes], [pwallettxndata hashCode], [pwallettxndata transactionDate], [pwallettxndata paymentResponse], [pwallettxndata rewardPoint], [pwallettxndata updatedOn], [pwallettxndata approvalCode]];
    
    [database close];
    return retval;
}
- (BOOL)UpdateWalletTransactionList:(WalletTxnData *)pwallettxndata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"UPDATE tbl_wallet_transcation SET userId  = ?, merchantId  = ?, siteId  = ?, customerId  = ?, walletId  = ?, transactionType  = ?, transactionAmount  = ?, transactionPayRef  = ?, paidOn  = ?, processBy  = ?, status  = ?, transactionNotes  = ?, hashCode  = ?, transactionDate  = ?, paymentResponse  = ?, rewardPoint  = ?, updatedOn  = ?, approvalCode  = ?, delflag  = 'N' WHERE transactionReference = ?",[pwallettxndata userId], [pwallettxndata merchantId], [pwallettxndata siteId], [pwallettxndata customerId], [pwallettxndata walletId], [pwallettxndata transactionType] ,[pwallettxndata transactionAmount], [pwallettxndata transactionPayRef], [pwallettxndata paidOn], [pwallettxndata processBy], [pwallettxndata status], [pwallettxndata transactionNotes], [pwallettxndata hashCode], [pwallettxndata transactionDate], [pwallettxndata paymentResponse], [pwallettxndata rewardPoint], [pwallettxndata updatedOn], [pwallettxndata approvalCode] ,[pwallettxndata transactionReference]];
    
    
    [database close];
    return retval;
}

- (TblWalletTxnData *)getWalletTransactionbyOffset:(NSInteger)poffset Status:(NSString *)pstatus{
    TblWalletTxnData *retval=[[TblWalletTxnData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_wallet_transcation  where delflag='N' AND status='%@' LIMIT 1 OFFSET %ld ",pstatus,(long)poffset];
//    if([pcampaignName length] > 0){
//        query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N'  ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld",[pcampaignName uppercaseString],(long)poffset];
//    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblWalletTxnData alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getWalletTransactioncountStatus:(NSString *)pstatus{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_wallet_transcation where delflag='N' AND status='%@'   ",pstatus];
//    if([pcampaignName length] > 0){
//        query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N' ORDER BY campaignName ASC ",[pcampaignName uppercaseString]];
//    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
@end
