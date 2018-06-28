//
//  PaymentDao.m
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "PaymentDao.h"

@implementation PaymentDao
- (void)addpaymentDtl:(PaymentDtlData *)ppaymentdtl {
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"insert into tbl_payment_dtl (paymentDetailId, merchantId, paymentId, paymentLogourl, paymentName, paymentMerchantId, paymentKey, paymentToken, paymentUrl, paymentStatus, paymentType, paymentEnviornment, currency, hashCode, updatedOn, delflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",
     [ppaymentdtl paymentDetailId],[ppaymentdtl merchantId],[ppaymentdtl paymentId],[ppaymentdtl paymentLogourl],[ppaymentdtl paymentName],[ppaymentdtl paymentMerchantId],[ppaymentdtl paymentKey],[ppaymentdtl paymentToken],[ppaymentdtl paymentUrl],[ppaymentdtl paymentStatus],[ppaymentdtl paymentType], [ppaymentdtl paymentEnviornment], [ppaymentdtl currency], [ppaymentdtl hashCode],[ppaymentdtl updatedOn]];
    [database close];
    
}

- (void)UpdatepaymentDtl:(PaymentDtlData *)ppaymentdtl {
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"update tbl_payment_dtl set  merchantId = ?, paymentId = ?, paymentLogourl = ?, paymentName =?, paymentMerchantId = ?, paymentKey = ?, paymentToken = ?, paymentUrl = ?, paymentStatus = ?, paymentType = ?, paymentEnviornment = ?,currency = ?, hashCode = ?, updatedOn = ?, delflag = 'N' where paymentDetailId = ? ",
     [ppaymentdtl merchantId],[ppaymentdtl paymentId],[ppaymentdtl paymentLogourl],[ppaymentdtl paymentName],[ppaymentdtl paymentMerchantId],[ppaymentdtl paymentKey],[ppaymentdtl paymentToken],[ppaymentdtl paymentUrl],[ppaymentdtl paymentStatus],[ppaymentdtl paymentType], [ppaymentdtl paymentEnviornment],[ppaymentdtl currency],[ppaymentdtl hashCode],[ppaymentdtl updatedOn],[ppaymentdtl paymentDetailId]];
    [database close];
    
}
- (TblPaymentDtl *)getPaymentDtl:(NSString *)ppaymentDetailId{
    TblPaymentDtl *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *resmert = [database executeQuery:@"SELECT * FROM tbl_payment_dtl where paymentDetailId =?",ppaymentDetailId];
    if ([resmert next]) {
        retval =[[TblPaymentDtl alloc]initWithDictionary:[resmert resultDictionary]];
    }
    [database close];
    return retval;
}

- (NSInteger)getAvaliablePaymentMethodcount {
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM tbl_payment_dtl where paymentStatus ='A' "]];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (TblPaymentDtl *)getPaymentMethodDetailOffset:(NSInteger)poffset{
    TblPaymentDtl *retval=[[TblPaymentDtl alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_payment_dtl where paymentStatus ='A' ORDER BY paymentName ASC  LIMIT 1 OFFSET %ld ",(long)poffset];

    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblPaymentDtl alloc]initWithDictionary:[res resultDictionary]];
    }

    [database close];
    
    return retval;
}
@end
