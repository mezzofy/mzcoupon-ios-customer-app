//
//  WalletDao.m
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "WalletDao.h"

@implementation WalletDao

- (TblWalletData *)getwallet{    
    TblWalletData *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT * FROM tbl_wallet"];
    if ([res next])
        retval = [[TblWalletData alloc]initWithDictionary:[res resultDictionary]];
    
    [database close];
    return retval;
}
- (TblWalletData *)getWallet:(NSString *)pwallet{
    
    TblWalletData *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT * FROM tbl_wallet WHERE walletId =?",pwallet];
    if ([res next])
    retval = [[TblWalletData alloc]initWithDictionary:[res resultDictionary]];
    
    [database close];
    return retval;
}
- (BOOL)AddWalletList:(WalletData *)pwalletdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"insert into tbl_wallet(walletId ,customerId ,walletCredit ,qrCode ,qrTime ,rewardPoint , updatedOn,delflag) values(?,?,?,?,?,?,?,'N')",[pwalletdata walletId],[pwalletdata customerId],[pwalletdata walletCredit],[pwalletdata qrCode],[pwalletdata qrTime],[pwalletdata rewardPoint],[pwalletdata updatedOn]];
    
    [database close];
    return retval;
}
- (BOOL)UpdateWalletList:(WalletData *)pwalletdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"UPDATE tbl_wallet SET customerId =? ,walletCredit =? ,qrCode =? ,qrTime =? ,rewardPoint =? , updatedOn =? ,delflag ='N' WHERE walletId =?",[pwalletdata customerId],[pwalletdata walletCredit],[pwalletdata qrCode],[pwalletdata qrTime],[pwalletdata rewardPoint],[pwalletdata updatedOn],[pwalletdata walletId]];
    
    
    [database close];
    return retval;
}

@end
