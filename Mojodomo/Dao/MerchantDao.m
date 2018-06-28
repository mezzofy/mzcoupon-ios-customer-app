//
//  MerchantDao.m
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MerchantDao.h"

@implementation MerchantDao
- (TblMerchant *)getMerchant:(NSString *)pmerchantId{
    
    TblMerchant *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resmert = [database executeQuery:@"SELECT * FROM tbl_merchant where merchantId =?",pmerchantId];
    
    if ([resmert next]) {
        
        retval =[[TblMerchant alloc]initWithDictionary:[resmert resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
- (BOOL)addMerchant:(MerchantData *)pmerchant {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
   retval = [database executeUpdate:@"insert into tbl_merchant (countryCode, merchantId, merchantCode, merchantType, merchantName, merchantDesc, merchantLogourl, merchantImageurl, merchantTc, hashCode, profileStatus, merchantHotline ,merchantStatus ,merchantTimezone ,merchantEmail ,countryName ,channelCode,currency) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[pmerchant countryCode],[pmerchant merchantId],[pmerchant merchantCode],[pmerchant merchantType],[pmerchant merchantName],[pmerchant merchantDesc],[pmerchant merchantLogourl],[pmerchant merchantImageurl],[pmerchant merchantTc],[pmerchant hashCode],[pmerchant profileStatus],[pmerchant merchantHotline],[pmerchant merchantStatus],[pmerchant merchantTimezone],[pmerchant merchantEmail],[pmerchant countryName],[pmerchant channelCode],[pmerchant currency]];
    
    [database close];
    return retval;
    
}
- (void)deleteMerchant {

    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    [database executeUpdate:@"delete FROM tbl_merchant"];
    
    [database close];
    
    
}
-(NSString *)getMerchantValue:(NSString *)pkey {
    NSString *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT %@ FROM tbl_merchant ",pkey]];
    
    if ([res next]) {
        retval = [res stringForColumnIndex:0];
    }
    
    [database close];
    
    return retval;
}
@end
