//
//  CartDao.m
//  ProWallet
//
//  Created by Inforios on 22/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CartDao.h"
#import "FMDatabase.h"
#import "Utils.h"

@implementation CartDao



- (BOOL)addCartItemsData:(TblProduct *)pprod{
    
    BOOL retval = false;
    TblProduct *objprod=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_cart WHERE campaignId = '%@' ",pprod.campaignId];
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        objprod = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    if(objprod.campaignId.length>0){
        int productQty=[objprod.productQty intValue]+[pprod.productQty intValue];
        double totalprice=[pprod.sellingPrice doubleValue]*productQty;
        retval = [database executeUpdate:@"update tbl_cart set campaignId = ? ,merchantId = ? ,campaignCode = ?,campaignName = ?,campaignDesc = ? ,sellingPrice = ?,orginalPrice = ?,campaignTc = ?,campaignStatus = ? ,reviewUrl = ? ,productQty = ? ,campaignImage = ? ,totalPrice = ?,status = ?,flag = ? where tbl_cart_id = ?",pprod.campaignId,pprod.merchantId ,pprod.campaignCode, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.orginalPrice, pprod.campaignTc, pprod.campaignStatus, pprod.reviewUrl, [NSString stringWithFormat:@"%d",productQty], pprod.campaignImage, [NSString stringWithFormat:@"%.2f",totalprice], pprod.status, pprod.flag,objprod.tbl_cart_id];
    }else{
    retval = [database executeUpdate:@"insert into tbl_cart (campaignId ,merchantId ,campaignCode ,campaignName ,campaignDesc ,sellingPrice ,orginalPrice ,campaignTc ,campaignStatus ,reviewUrl ,productQty ,campaignImage ,totalPrice ,status ,flag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",pprod.campaignId,pprod.merchantId ,pprod.campaignCode, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.orginalPrice, pprod.campaignTc, pprod.campaignStatus, pprod.reviewUrl, pprod.productQty, pprod.campaignImage, pprod.totalPrice, pprod.status, pprod.flag];
    
    }
    [database close];
    return retval;
    
}
- (BOOL)updateCartItemsData:(TblProduct *)pprod{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_cart set campaignId = ? ,merchantId = ? ,campaignCode = ?,campaignName = ?,campaignDesc = ? ,sellingPrice = ?,orginalPrice = ?,campaignTc = ?,campaignStatus = ? ,reviewUrl = ? ,productQty = ? ,campaignImage = ? ,totalPrice = ?,status = ?,flag = ? where tbl_cart_id = ?",pprod.campaignId,pprod.merchantId ,pprod.campaignCode, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.orginalPrice, pprod.campaignTc, pprod.campaignStatus, pprod.reviewUrl, pprod.productQty, pprod.campaignImage, pprod.totalPrice, pprod.status, pprod.flag,pprod.tbl_cart_id];
    
    
    [database close];
    return retval;
}
- (BOOL)deteleCartItemsDataFromTable:(NSNumber *)pcart_id{
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:[NSString stringWithFormat:@"delete from tbl_cart where tbl_cart_id = %@",pcart_id]];
    [database close];
    return retval;

    
}
- (TblProduct *)getCartdetailsFromTabels:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_cart ORDER BY tbl_cart_id DESC  LIMIT 1 OFFSET %ld ",(long)poffset];
        FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (TblProduct *)getCartdetailsCartId:(NSInteger)pcartId{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_cart WHERE tbl_cart_id = %ld ",(long)pcartId];
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getCartItemsCount{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];

    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM tbl_cart"]];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (NSInteger)getTotalPriceCartItems{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:[NSString stringWithFormat:@"SELECT sum(totalPrice) FROM tbl_cart"]];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (BOOL)deteleCartItemsAfterPayment{
    BOOL retval = false;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval = [database executeUpdate:[NSString stringWithFormat:@"delete from tbl_cart "]];
    [database close];
    return retval;

}
@end
