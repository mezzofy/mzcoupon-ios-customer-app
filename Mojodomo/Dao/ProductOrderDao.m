//
//  ProductOrderModule.m
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "ProductOrderDao.h"
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"

@implementation ProductOrderDao

-(void)addProductOrder:(TblProductOrder *)pproduct{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"insert into tbl_product_order (poId, merchantId, customerId, customerName, poDate, poNo, poTotal, poStatus, payReceipt, payResponse, transferTo, transferFrom, payToken, rewardPoint, hashCode, couponType, paymentDetailId, updatedOn, delflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",
     [pproduct poId],[pproduct merchantId],[pproduct customerId],[pproduct customerName],[pproduct poDate],[pproduct poNo],[pproduct poTotal],[pproduct poStatus],[pproduct payReceipt],[pproduct payResponse],[pproduct transferTo],[pproduct transferFrom],[pproduct payToken],[pproduct rewardPoint],[pproduct hashCode],[pproduct couponType],[pproduct paymentDetailId],[pproduct updatedOn]];
    [database close];

    
}
-(void)updateProductOrder:(TblProductOrder *)pproduct{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"update tbl_product_order set     merchantId = ?, customerId = ?, customerName = ?, poDate = ?, poNo = ?, poTotal = ?, poStatus = ?, payReceipt = ?, payResponse = ?,transferTo = ?,transferFrom = ?, payToken = ?, rewardPoint = ?, hashCode = ?, couponType = ?, paymentDetailId = ?, updatedOn = ?, delflag='N' where poId = ?",
     [pproduct merchantId],[pproduct customerId],[pproduct customerName],[pproduct poDate],[pproduct poNo],[pproduct poTotal],[pproduct poStatus],[pproduct payReceipt],[pproduct payResponse],[pproduct transferTo],[pproduct transferFrom],[pproduct payToken],[pproduct rewardPoint],[pproduct hashCode],[pproduct couponType],[pproduct paymentDetailId],[pproduct updatedOn],[pproduct poId]];
    [database close];
    
}
-(TblProductOrder *)getProductOrderbyproductId:(NSString *)ppoId{
    TblProductOrder *objprod=NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *resmert = [database executeQuery:@"SELECT * FROM tbl_product_order where poId = ?",ppoId];
    if ([resmert next]) {
        objprod =[[TblProductOrder alloc]initWithDictionary:[resmert resultDictionary]];
    }
    [database close];

    
    return objprod;
}

//ProductDetail
-(void)addProductOrderDtl:(TblProductOrderDtl *)pproduct{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"insert into tbl_product_order_dtl (podtlId, productId, campaignId, poId, campaignName, campaignPrice, campaignQty, campaignTotal, status, updatedOn, delflag) values(?,?,?,?,?,?,?,?,?,?,'N')",
     [pproduct podtlId],[pproduct productId],[pproduct campaignId],[pproduct poId],[pproduct campaignName],[pproduct campaignPrice],[pproduct campaignQty],[pproduct campaignTotal],[pproduct status],[pproduct updatedOn]];
    [database close];

    
}
-(void)updateProductOrderDtl:(TblProductOrderDtl *)pproduct{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:@"update tbl_product_order_dtl set     productId = ?, campaignId = ?, poId = ?, campaignName = ?, campaignPrice = ?, campaignQty = ?, campaignTotal = ?, status = ?, updatedOn = ?, delflag='N' where podtlId = ?",
     [pproduct productId],[pproduct campaignId],[pproduct poId],[pproduct campaignName],[pproduct campaignPrice],[pproduct campaignQty],[pproduct campaignTotal],[pproduct status],[pproduct updatedOn],[pproduct podtlId]];
    [database close];
}
-(TblProductOrderDtl *)getProductOrderdetailbyproductdetailId:(NSString *)ppodetailsId{
    TblProductOrderDtl *objproddtl=NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *resmert = [database executeQuery:@"SELECT * FROM tbl_product_order_dtl where podtlId = ?",ppodetailsId];
    if ([resmert next]) {
        objproddtl =[[TblProductOrderDtl alloc]initWithDictionary:[resmert resultDictionary]];
    }
    [database close];
    return objproddtl;
}
- (TblProductOrder *)getTransactionRecordsOffset:(NSInteger)poffset{
    TblProductOrder *retval=[[TblProductOrder alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM tbl_product_order  where delflag='N'  ORDER BY hashCode DESC  LIMIT 1 OFFSET %ld ",(long)poffset]];
    if ([res next]) {
        retval = [[TblProductOrder alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getTransactionRecordsCount{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT count(*) FROM tbl_product_order  where delflag='N'  ORDER BY hashCode DESC"]];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
-(TblProductOrderDtl *)getProductOrderdetailbyproductorderId:(NSString *)ppoId{
    TblProductOrderDtl *objproddtl=NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *resmert = [database executeQuery:@"SELECT * FROM tbl_product_order_dtl where poId = ?",ppoId];
    if ([resmert next]) {
        objproddtl =[[TblProductOrderDtl alloc]initWithDictionary:[resmert resultDictionary]];
    }
    [database close];
    return objproddtl;
}
- (NSInteger)getProductOrderdetailcountbyproductorderId:(NSString *)ppoId{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT count(*) FROM tbl_product_order_dtl where poId = '%@' AND delflag='N' ",ppoId]];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
-(TblProductOrderDtl *)getProductOrderdetailbyproductorderId:(NSString *)ppoId Offset:(NSInteger)poffset{
    TblProductOrderDtl *retval=[[TblProductOrderDtl alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM tbl_product_order_dtl  where poId = '%@' AND delflag='N' LIMIT 1 OFFSET %ld ",ppoId,(long)poffset]];
    if ([res next]) {
        retval = [[TblProductOrderDtl alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
}
@end
