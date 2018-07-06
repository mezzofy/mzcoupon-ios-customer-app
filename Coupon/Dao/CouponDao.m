//
//  CouponDao.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CouponDao.h"
#import "FMDatabase.h"
#import "Utils.h"


@implementation CouponDao
- (BOOL)addCoupondata:(TblCouponData *)pcoupondata{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon (couponId ,productId ,allocationId ,campaignId ,customerId ,campaignCode ,couponNo ,purchaseDate ,redeemDate ,startDate ,endDate ,couponName ,productNote1 ,productNote2 ,productNote3 ,sellingPrice ,orginalPrice ,productDesc ,productImageurl ,couponStatus ,hashCode ,createdOn ,updatedOn ,delflag ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",pcoupondata.couponId, pcoupondata.productId, pcoupondata.allocationId, pcoupondata.campaignId, pcoupondata.customerId, pcoupondata.campaignCode, pcoupondata.couponNo, pcoupondata.purchaseDate, pcoupondata.redeemDate, pcoupondata.startDate, pcoupondata.endDate, pcoupondata.couponName, pcoupondata.productNote1, pcoupondata.productNote2, pcoupondata.productNote3, pcoupondata.sellingPrice, pcoupondata.orginalPrice, pcoupondata.productDesc, pcoupondata.productImageurl, pcoupondata.couponStatus, pcoupondata.hashCode, pcoupondata.createdOn, pcoupondata.updatedOn];
    
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponData:(TblCouponData *)pcoupondata{
    
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon set  productId = ?, allocationId = ?, campaignId = ?, customerId = ?, campaignCode = ?, couponNo = ?, purchaseDate = ?, redeemDate = ?, startDate = ?, endDate = ?, couponName = ?, productNote1 = ?, productNote2 = ?, productNote3 = ?, sellingPrice = ?, orginalPrice = ?, productDesc = ?, productImageurl = ?,couponStatus = ?, hashCode = ?, createdOn = ?, updatedOn = ?, delflag = 'N' where couponId = ?",pcoupondata.productId, pcoupondata.allocationId, pcoupondata.campaignId, pcoupondata.customerId, pcoupondata.campaignCode, pcoupondata.couponNo ,pcoupondata.purchaseDate, pcoupondata.redeemDate, pcoupondata.startDate, pcoupondata.endDate, pcoupondata.couponName,  pcoupondata.productNote1, pcoupondata.productNote2, pcoupondata.productNote3, pcoupondata.sellingPrice, pcoupondata.orginalPrice, pcoupondata.productDesc, pcoupondata.productImageurl,pcoupondata.couponStatus, pcoupondata.hashCode, pcoupondata.createdOn, pcoupondata.updatedOn, pcoupondata.couponId];
    
    
    [database close];
    return retval;
    
    
}
- (BOOL)addCoupondataPlatform:(CouponData *)pcoupondata{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon (couponId ,productId ,allocationId ,campaignId ,customerId ,campaignCode ,couponNo ,purchaseDate ,redeemDate ,startDate ,endDate ,couponName ,productNote1 ,productNote2 ,productNote3 ,sellingPrice ,orginalPrice ,productDesc ,productImageurl ,couponStatus ,hashCode ,createdOn ,updatedOn ,delflag ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",pcoupondata.couponId, pcoupondata.productId, pcoupondata.allocationId, pcoupondata.campaignId, pcoupondata.customerId, pcoupondata.campaignCode, pcoupondata.couponNo, pcoupondata.purchaseDate, pcoupondata.redeemDate, pcoupondata.startDate, pcoupondata.endDate, pcoupondata.couponName, pcoupondata.productNote1, pcoupondata.productNote2, pcoupondata.productNote3, pcoupondata.sellingPrice, pcoupondata.orginalPrice, pcoupondata.productDesc, pcoupondata.productImageurl, pcoupondata.couponStatus, pcoupondata.hashCode, pcoupondata.createdOn, pcoupondata.updatedOn];
    
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponDataPlatform:(CouponData *)pcoupondata{
    
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon set  productId = ?, allocationId = ?, campaignId = ?, customerId = ?, campaignCode = ?, couponNo = ?, purchaseDate = ?, redeemDate = ?, startDate = ?, endDate = ?, couponName = ?, productNote1 = ?, productNote2 = ?, productNote3 = ?, sellingPrice = ?, orginalPrice = ?, productDesc = ?, productImageurl = ?,couponStatus = ?, hashCode = ?, createdOn = ?, updatedOn = ?, delflag = 'N' where couponId = ?",pcoupondata.productId, pcoupondata.allocationId, pcoupondata.campaignId, pcoupondata.customerId, pcoupondata.campaignCode, pcoupondata.couponNo ,pcoupondata.purchaseDate, pcoupondata.redeemDate, pcoupondata.startDate, pcoupondata.endDate, pcoupondata.couponName,  pcoupondata.productNote1, pcoupondata.productNote2, pcoupondata.productNote3, pcoupondata.sellingPrice, pcoupondata.orginalPrice, pcoupondata.productDesc, pcoupondata.productImageurl,pcoupondata.couponStatus, pcoupondata.hashCode, pcoupondata.createdOn, pcoupondata.updatedOn, pcoupondata.couponId];
    
    
    [database close];
    return retval;
    
    
}
- (TblCouponData *)getCouponDataStatus:(NSString *)status CouponId:(NSString *)pcouponId{
    TblCouponData *retval=[[TblCouponData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_coupon where couponId = ? AND couponStatus = ? ",pcouponId,status];
    
    if ([ressite next]) {
        
        retval =[[TblCouponData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}

- (void)insertCouponCountByCampaigniD:(NSString *)pcampaignId couponCount:(NSString *)psize{
    NSString *retval=@"";
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT size FROM tbl_coupon_count WHERE campaignId = ?",pcampaignId];
    
    if ([res next]) {
        retval = [res stringForColumnIndex:0];
    }
    if(retval.length>0 && [retval intValue]>0)
        [database executeUpdate:@"update tbl_coupon_count set  size = ?, delflag = 'N' where campaignId = ?",psize,pcampaignId];
    else
        [database executeUpdate:@"insert into tbl_coupon_count (campaignId ,size, delflag) values(?,?,'N')",pcampaignId,psize];
    
    [database close];

    
}
- (TblProduct *)getCampaignWithCouponCountByOffset:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign c inner join tbl_coupon_count cc  where c.campaignId=cc.campaignId and c.delflag='N'  ORDER BY c.campaignName ASC   LIMIT 1 OFFSET %ld ",(long)poffset];
    
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getCampaigncountWithCouponCount{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign c inner join tbl_coupon_count cc  where c.campaignId=cc.campaignId and c.delflag='N'  ORDER BY c.campaignName ASC   "];
   
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (TblCouponData *)getCampaignWithCouponType:(NSString *)ptype ByOffset:(NSInteger)poffset{
    TblCouponData *retval=[[TblCouponData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM tbl_campaign c inner join tbl_coupon cc  ON c.campaignId=cc.campaignId   WHERE  cc.couponStatus = '%@' AND cc.delflag = 'N' ORDER BY cc.hashCode DESC LIMIT 1 OFFSET %ld ",ptype,(long)poffset]];
    
    if ([ressite next]) {
        
        retval =[[TblCouponData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
- (NSInteger)getCampaigncountWithCouponType:(NSString *)ptype{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
   
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign c inner join tbl_coupon cc  ON c.campaignId=cc.campaignId   WHERE  cc.couponStatus = '%@' AND cc.delflag = 'N' ORDER BY cc.hashCode",ptype];
    
    
    
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;

}
- (TblCouponData *)getActiveCouponCampaignId:(NSString *)pCampaignid ByOffset:(NSInteger)poffset{
    TblCouponData *retval=[[TblCouponData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM tbl_coupon where  couponStatus = 'A' AND delflag = 'N' AND campaignId ='%@' ORDER BY hashCode DESC LIMIT 1 OFFSET %ld ",pCampaignid,(long)poffset]];
    
    if ([ressite next]) {
        
        retval =[[TblCouponData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
- (NSInteger)getActiveCouponCampaignId:(NSString *)pCampaignid{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_coupon where  couponStatus = 'A' AND delflag = 'N' AND campaignId ='%@' ORDER BY hashCode DESC ",pCampaignid];
    
    
    
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
    
}
- (NSMutableArray *)getMyCouponBySite:(NSString *)psite{
    NSMutableArray *arrcampaign=[[NSMutableArray alloc]init];
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM tbl_campaign c inner join tbl_coupon_count cc INNER JOIN tbl_campaign_site as cs ON c.campaignId=cc.campaignId and cs.campaignId = c.campaignId where cs.siteId='%@' and c.delflag ='N' ORDER BY c.hashCode DESC ",psite]];
    
    while ([ressite next]) {
        
        retval =[[TblProduct alloc]initWithDictionary:[ressite resultDictionary]];
        [arrcampaign addObject:retval];
    }
    
    [database close];
    
    return arrcampaign;
}

- (TblCouponData *)getCouponDetailsWhereCouponId:(NSString *)pcouponid{
    TblCouponData *retval=[[TblCouponData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:[NSString stringWithFormat:@"SELECT *,c.endDate as endDate FROM tbl_coupon AS c INNER JOIN tbl_campaign AS p ON p.campaignId=c.campaignId WHERE  c.couponId='%@' ",pcouponid]];
    
    if ([ressite next]) {
        
        retval = [[TblCouponData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
@end
