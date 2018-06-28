//
//  ProductDao.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "ProductDao.h"


@implementation ProductDao
- (TblProduct *)getProductsDetail:(NSString *)pprodid {
    
    TblProduct *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resprod = [database executeQuery:@"SELECT * FROM tbl_campaign where campaignId =?",pprodid];
    if ([resprod next]) {
        retval = [[TblProduct alloc]initWithDictionary:[resprod resultDictionary]];
    }
    [database close];
    
    return retval;
}
- (BOOL)updateProduct:(TblProduct *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];

    retval = [database executeUpdate:@"update tbl_campaign set  merchantId  = ?, productId  = ?, productmerchantId  = ?, campaignCode  = ?, orginalPrice  = ?, campaignName  = ?, campaignDesc  = ?, sellingPrice  = ?, campaignTc  = ?, campaignStatus  = ?, campaignType  = ?, brand  = ?, expirydue  = ?, dailyLimit  = ?, packQty  = ?, emailStaff  = ?, couponOver  = ?, expiryDays  = ?,dayFilter  = ?, fromDate  = ?, toDate  = ?, totalRedeem  = ?, allocationCount  = ?, couponUrl  = ?, passbookUrl  = ?, issuedcoupon  = ? ,redeemcoupon  = ?, allocationcoupon  = ?, campaignNote1 = ?, campaignNote2 = ?, campaignNote3 = ?, distance = ?,dailyLimitType = ?, redemptionQuota = ?, campaignUuid = ?, typeService = ?, reviewUrl = ?, videoUrl = ?, startDate  = ?, endDate  = ?, ratecoupon  = ?,outletDistance  = ?,expiryname  = ?,txBrand  = ?,campaignRemark  = ?,pickup  = ?,delivery  = ?,booking  = ?,outcall  = ?, hashCode  = ?, createdOn  = ?, delflag = 'N' where campaignId  = ?",pprod.merchantId, pprod.productId, pprod.productmerchantId, pprod.campaignCode, pprod.orginalPrice, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.campaignTc, pprod.campaignStatus, pprod.campaignType, pprod.brand, pprod.expirydue, pprod.dailyLimit, pprod.packQty, pprod.emailStaff, pprod.couponOver, pprod.expiryDays, pprod.dayFilter, pprod.fromDate, pprod.toDate, pprod.totalRedeem, pprod.allocationCount, pprod.couponUrl, pprod.passbookUrl, pprod.issuedcoupon, pprod.redeemcoupon, pprod.allocationcoupon, pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance,pprod.dailyLimitType,pprod.redemptionQuota, pprod.campaignUuid, pprod.typeService, pprod.reviewUrl, pprod.videoUrl, pprod.startDate, pprod.endDate, pprod.ratecoupon,pprod.outletDistance, pprod.expiryname, pprod.txBrand,pprod.campaignRemark, pprod.pickup, pprod.delivery, pprod.booking, pprod.outcall, pprod.hashCode, pprod.createdOn, pprod.campaignId];
    
    
    [database close];
    return retval;
    
}
- (BOOL)addProduct:(TblProduct *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"insert into tbl_campaign (campaignId ,merchantId ,productId ,productmerchantId ,campaignCode ,orginalPrice ,campaignName ,campaignDesc ,sellingPrice ,campaignTc ,campaignStatus ,campaignType ,brand ,expirydue ,dailyLimit ,packQty ,emailStaff ,couponOver,expiryDays ,dayFilter ,fromDate ,toDate ,totalRedeem ,allocationCount ,couponUrl ,passbookUrl ,issuedcoupon ,redeemcoupon ,allocationcoupon ,campaignNote1 ,campaignNote2 ,campaignNote3 ,distance ,dailyLimitType ,redemptionQuota ,campaignUuid ,typeService ,reviewUrl ,videoUrl ,startDate ,endDate ,ratecoupon ,outletDistance ,expiryname ,txBrand ,campaignRemark  ,pickup ,delivery ,booking ,outcall ,hashCode ,createdOn ,delflag, favourite, topten) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N','','')",pprod.campaignId ,pprod.merchantId ,pprod.productId ,pprod.productmerchantId ,pprod.campaignCode ,pprod.orginalPrice ,pprod.campaignName ,pprod.campaignDesc ,pprod.sellingPrice ,pprod.campaignTc ,pprod.campaignStatus ,pprod.campaignType ,pprod.brand ,pprod.expirydue ,pprod.dailyLimit ,pprod.packQty ,pprod.emailStaff ,pprod.couponOver ,pprod.expiryDays ,pprod.dayFilter ,pprod.fromDate ,pprod.toDate ,pprod.totalRedeem ,pprod.allocationCount ,pprod.couponUrl ,pprod.passbookUrl ,pprod.issuedcoupon ,pprod.redeemcoupon ,pprod.allocationcoupon , pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance,pprod.dailyLimitType, pprod.redemptionQuota , pprod.campaignUuid, pprod.typeService, pprod.reviewUrl, pprod.videoUrl, pprod.startDate ,pprod.endDate ,pprod.ratecoupon ,pprod.outletDistance ,pprod.expiryname ,pprod.txBrand ,pprod.campaignRemark ,pprod.pickup ,pprod.delivery ,pprod.booking ,pprod.outcall ,pprod.hashCode ,pprod.createdOn];
    
    [database commit];
    [database close];
    return retval;
    
}

- (BOOL)updateSingleProduct:(ProductData *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_campaign set  merchantId  = ?, productId  = ?, productmerchantId  = ?, campaignCode  = ?, orginalPrice  = ?, campaignName  = ?, campaignDesc  = ?, sellingPrice  = ?, campaignTc  = ?, campaignStatus  = ?, campaignType  = ?, brand  = ?, expirydue  = ?, dailyLimit  = ?, packQty  = ?, emailStaff  = ?, couponOver  = ?, expiryDays  = ?,dayFilter  = ?, fromDate  = ?, toDate  = ?, totalRedeem  = ?, allocationCount  = ?, couponUrl  = ?, passbookUrl  = ?, issuedcoupon  = ? ,redeemcoupon  = ?, allocationcoupon  = ?, campaignNote1 = ?, campaignNote2 = ?, campaignNote3 = ?, distance = ?,dailyLimitType = ?, redemptionQuota = ?, campaignUuid = ?, typeService = ?, reviewUrl = ?, videoUrl = ?, startDate  = ?, endDate  = ?, ratecoupon  = ?,outletDistance  = ?,expiryname  = ?,txBrand  = ?,campaignRemark  = ?,pickup  = ?,delivery  = ?,booking  = ?,outcall  = ?, hashCode  = ?, createdOn  = ?, delflag = 'N' where campaignId  = ?",pprod.merchantId, pprod.productId, pprod.productmerchantId, pprod.campaignCode, pprod.orginalPrice, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.campaignTc, pprod.campaignStatus, pprod.campaignType, pprod.brand, pprod.expirydue, pprod.dailyLimit, pprod.packQty, pprod.emailStaff, pprod.couponOver, pprod.expiryDays, pprod.dayFilter, pprod.fromDate, pprod.toDate, pprod.totalRedeem, pprod.allocationCount, pprod.couponUrl, pprod.passbookUrl, pprod.issuedcoupon, pprod.redeemcoupon, pprod.allocationcoupon, pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance,pprod.dailyLimitType,pprod.redemptionQuota, pprod.campaignUuid, pprod.typeService, pprod.reviewUrl, pprod.videoUrl, pprod.startDate, pprod.endDate, pprod.ratecoupon,pprod.outletDistance, pprod.expiryname, pprod.txBrand,pprod.campaignRemark, pprod.pickup, pprod.delivery, pprod.booking, pprod.outcall, pprod.hashCode, pprod.createdOn, pprod.campaignId];
    
    
    [database close];
    return retval;
    
}
- (BOOL)addSingleProduct:(ProductData *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"insert into tbl_campaign (campaignId ,merchantId ,productId ,productmerchantId ,campaignCode ,orginalPrice ,campaignName ,campaignDesc ,sellingPrice ,campaignTc ,campaignStatus ,campaignType ,brand ,expirydue ,dailyLimit ,packQty ,emailStaff ,couponOver,expiryDays ,dayFilter ,fromDate ,toDate ,totalRedeem ,allocationCount ,couponUrl ,passbookUrl ,issuedcoupon ,redeemcoupon ,allocationcoupon ,campaignNote1 ,campaignNote2 ,campaignNote3 ,distance ,dailyLimitType ,redemptionQuota ,campaignUuid ,typeService ,reviewUrl ,videoUrl ,startDate ,endDate ,ratecoupon ,outletDistance ,expiryname ,txBrand ,campaignRemark  ,pickup ,delivery ,booking ,outcall ,hashCode ,createdOn ,delflag, favourite, topten) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N','','')",pprod.campaignId ,pprod.merchantId ,pprod.productId ,pprod.productmerchantId ,pprod.campaignCode ,pprod.orginalPrice ,pprod.campaignName ,pprod.campaignDesc ,pprod.sellingPrice ,pprod.campaignTc ,pprod.campaignStatus ,pprod.campaignType ,pprod.brand ,pprod.expirydue ,pprod.dailyLimit ,pprod.packQty ,pprod.emailStaff ,pprod.couponOver ,pprod.expiryDays ,pprod.dayFilter ,pprod.fromDate ,pprod.toDate ,pprod.totalRedeem ,pprod.allocationCount ,pprod.couponUrl ,pprod.passbookUrl ,pprod.issuedcoupon ,pprod.redeemcoupon ,pprod.allocationcoupon , pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance,pprod.dailyLimitType, pprod.redemptionQuota , pprod.campaignUuid, pprod.typeService, pprod.reviewUrl, pprod.videoUrl, pprod.startDate ,pprod.endDate ,pprod.ratecoupon ,pprod.outletDistance ,pprod.expiryname ,pprod.txBrand ,pprod.campaignRemark ,pprod.pickup ,pprod.delivery ,pprod.booking ,pprod.outcall ,pprod.hashCode ,pprod.createdOn];
    
    [database commit];
    [database close];
    return retval;
    
}

- (BOOL)updateToptenProduct:(TblProduct *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_campaign set  merchantId  = ?, productId  = ?, productmerchantId  = ?, campaignCode  = ?, orginalPrice  = ?, campaignName  = ?, campaignDesc  = ?, sellingPrice  = ?, campaignTc  = ?, campaignStatus  = ?, campaignType  = ?, brand  = ?, expirydue  = ?, dailyLimit  = ?, packQty  = ?, emailStaff  = ?, couponOver  = ?, expiryDays  = ?,dayFilter  = ?, fromDate  = ?, toDate  = ?, totalRedeem  = ?, allocationCount  = ?, couponUrl  = ?, passbookUrl  = ?, issuedcoupon  = ? ,redeemcoupon  = ?, allocationcoupon  = ?, campaignNote1 = ?, campaignNote2 = ?, campaignNote3 = ?, distance = ?,dailyLimitType = ?, redemptionQuota = ? , campaignUuid = ?, typeService = ?, reviewUrl = ?, videoUrl = ?, startDate  = ?, endDate  = ?, ratecoupon  = ?,outletDistance  = ?,expiryname  = ?,txBrand  = ?,campaignRemark  = ?,pickup  = ?,delivery  = ?,booking  = ?,outcall  = ?, hashCode  = ?, createdOn  = ?, delflag = 'N',topten = 'Y' where campaignId  = ?",pprod.merchantId, pprod.productId, pprod.productmerchantId, pprod.campaignCode, pprod.orginalPrice, pprod.campaignName, pprod.campaignDesc, pprod.sellingPrice, pprod.campaignTc, pprod.campaignStatus, pprod.campaignType, pprod.brand, pprod.expirydue, pprod.dailyLimit, pprod.packQty, pprod.emailStaff, pprod.couponOver, pprod.expiryDays, pprod.dayFilter, pprod.fromDate, pprod.toDate, pprod.totalRedeem, pprod.allocationCount, pprod.couponUrl, pprod.passbookUrl, pprod.issuedcoupon, pprod.redeemcoupon, pprod.allocationcoupon, pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance , pprod.dailyLimitType , pprod.redemptionQuota, pprod.campaignUuid, pprod.typeService, pprod.reviewUrl, pprod.videoUrl, pprod.startDate, pprod.endDate, pprod.ratecoupon,pprod.outletDistance, pprod.expiryname, pprod.txBrand,pprod.campaignRemark, pprod.pickup, pprod.delivery, pprod.booking, pprod.outcall, pprod.hashCode, pprod.createdOn, pprod.campaignId];
    
    
    [database close];
    return retval;
    
}
- (BOOL)addToptenProduct:(TblProduct *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"insert into tbl_campaign (campaignId ,merchantId ,productId ,productmerchantId ,campaignCode ,orginalPrice ,campaignName ,campaignDesc ,sellingPrice ,campaignTc ,campaignStatus ,campaignType ,brand ,expirydue ,dailyLimit ,packQty ,emailStaff ,couponOver,expiryDays ,dayFilter ,fromDate ,toDate ,totalRedeem ,allocationCount ,couponUrl ,passbookUrl ,issuedcoupon ,redeemcoupon ,allocationcoupon ,campaignNote1 ,campaignNote2 ,campaignNote3 ,distance ,dailyLimitType ,redemptionQuota ,campaignUuid ,typeService ,reviewUrl ,videoUrl ,startDate ,endDate ,ratecoupon ,outletDistance ,expiryname ,txBrand ,campaignRemark  ,pickup ,delivery ,booking ,outcall ,hashCode ,createdOn ,delflag, favourite, topten) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N','','Y')",pprod.campaignId ,pprod.merchantId ,pprod.productId ,pprod.productmerchantId ,pprod.campaignCode ,pprod.orginalPrice ,pprod.campaignName ,pprod.campaignDesc ,pprod.sellingPrice ,pprod.campaignTc ,pprod.campaignStatus ,pprod.campaignType ,pprod.brand ,pprod.expirydue ,pprod.dailyLimit ,pprod.packQty ,pprod.emailStaff ,pprod.couponOver ,pprod.expiryDays ,pprod.dayFilter ,pprod.fromDate ,pprod.toDate ,pprod.totalRedeem ,pprod.allocationCount ,pprod.couponUrl ,pprod.passbookUrl ,pprod.issuedcoupon ,pprod.redeemcoupon ,pprod.allocationcoupon , pprod.campaignNote1, pprod.campaignNote2, pprod.campaignNote3, pprod.distance, pprod.dailyLimitType, pprod.redemptionQuota , pprod.campaignUuid, pprod.typeService, pprod.reviewUrl,pprod.videoUrl, pprod.startDate ,pprod.endDate , pprod.ratecoupon , pprod.outletDistance ,pprod.expiryname ,pprod.txBrand ,pprod.campaignRemark ,pprod.pickup ,pprod.delivery ,pprod.booking ,pprod.outcall ,pprod.hashCode ,pprod.createdOn];
    
    [database commit];
    [database close];
    return retval;
}
- (BOOL)deleteProduct:(TblProduct *)pprod {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"delete FROM tbl_campaign WHERE campaignId=?",pprod.campaignId];
    
    [database close];
    return retval;
    
}
- (void)updateAllocationTotalQtyFromServer:(NSString *)pallocationqty CampaignId:(NSString *)pcampaignid{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"update tbl_campaign set allocationcoupon = '%@' where campaignId = '%@'",pallocationqty,pcampaignid]];
    [database close];
}


- (NSMutableArray *)getProductList:(NSString *)pprod campaignStatus:(NSString *)pstatus{
    
    NSMutableArray *resList = [[NSMutableArray alloc]init];
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    NSString *query=[NSString stringWithFormat:@"SELECT * FROM tbl_campaign_groupdtl gd INNER JOIN tbl_campaign_group g ON gd.campgrpId = g.campgrpId INNER JOIN tbl_campaign p ON p.campaignId=gd.campaignId WHERE g.campgrpId='%@' AND p.campaignStatus ='%@' ",pprod,pstatus];
    FMResultSet *res = [database executeQuery:query];
    
    while ([res next]) {
        
        TblProduct * tblproduct= [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
        
        [resList addObject:tblproduct];
    }
    [database close];
    return resList;
    
}
- (NSMutableArray *)getProductList:(NSString *)pstatus {
    //    SELECT * FROM tbl_campaign where   (UPPER(campaignName) LIKE '%%Test%%' ) AND delflag='N' and campaignStatus='A' ORDER BY campaignName Asc limit 1 offset 1
    NSMutableArray *resList = [[NSMutableArray alloc]init];
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    NSString *query=[NSString stringWithFormat:@"SELECT * FROM tbl_campaign WHERE campaignStatus ='%@' and delflag='N'",pstatus];
    FMResultSet *res = [database executeQuery:query];
    
    while ([res next]) {
        
        TblProduct * tblproduct= [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
        
        [resList addObject:tblproduct];
    }
    [database close];
    return resList;
    
}

- (BOOL)addCampaignImage:(TblCampaignImage *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"insert into tbl_campaign_image (pimageId, campaignId, campaignImage) values(?,?,?)",[pcampaign pimageId],[pcampaign campaignId],[pcampaign campaignImage]];
    
    [database commit];
    [database close];
    return retval;
    
}
- (void)deleteProdImg:(NSString *)pprod {
    
    // BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    [database executeUpdate:@"delete FROM tbl_campaign_image WHERE campaignId=?",pprod];
    
    [database close];
    //return retval;
    
}
- (BOOL)updateCampainImage:(TblCampaignImage *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"update tbl_campaign_image set campaignId =?, campaignImage =? where pimageId =?",[pcampaign campaignId],[pcampaign campaignImage],[pcampaign pimageId]];
    
    [database commit];
    [database close];
    return retval;
}

- (TblCampaignImage *)getCampaignImage:(NSString *)pcampimage {
    
    TblCampaignImage *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resprod = [database executeQuery:@"SELECT * FROM tbl_campaign_image where pimageId =?",pcampimage];
    
    if ([resprod next]) {
        
        retval = [[TblCampaignImage alloc]initWithDictionary:[resprod resultDictionary]];
    }
    
    [database close];
    
    return retval;
}

- (NSMutableArray *)getCampaignImg:(NSString *)pcampaignId
{
    
    NSMutableArray *retList=[[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    
    [database open];
    [database beginTransaction];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_campaign_image WHERE campaignId =?",pcampaignId];
    
    while([results next]) {
        
        TblCampaignImage *objcamp=[[TblCampaignImage alloc]initWithDictionary:[results resultDictionary]];
        
        [retList addObject:objcamp];
    }
    
    [database commit];
    [database close];
    return retList;
}
- (TblCampaignImageList *)getCampaignlistImg:(NSString *)pimageid
{
    TblCampaignImageList *retList=NULL;

    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_campaign_image WHERE campaignId =?",pimageid];
    while([results next]) {
        retList=[[TblCampaignImageList alloc]initWithDictionary:[results resultDictionary]];
    }
    [database close];
    return retList;
}
- (BOOL)DeleteImage:(NSString *)pimgid
{
    BOOL retval = true;
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"delete FROM tbl_campaign_image WHERE pimageId=?",pimgid];
    
    [database close];
    return retval;
}

- (BOOL)addCampaignsite:(TblCampaignSite *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    
    retval = [database executeUpdate:@"insert into tbl_campaign_site (siteId,campaignId) values(?,?)",[pcampaign siteId],[pcampaign campaignId]];
    
    [database commit];
    [database close];
    return retval;
    
}

- (BOOL)deleteCampaignSite {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"delete FROM tbl_campaign_site"];
    
    [database close];
    return retval;
    
}

- (BOOL)updateCampainsite:(TblCampaignSite *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_campaign_site set siteId =? where campaignId =?",[pcampaign siteId],[pcampaign campaignId]];
    
    [database close];
    return retval;
}

- (TblCampaignSite *)getCampaignsite:(NSString *)pcampsite campaignId:(NSString *)pcamid {
    
    TblCampaignSite *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resprod = [database executeQuery:@"SELECT * FROM tbl_campaign_site where siteId =? AND campaignId = ?",pcampsite,pcamid];
    
    if ([resprod next]) {
        
        retval = [[TblCampaignSite alloc]initWithDictionary:[resprod resultDictionary]];
    }
    
    [database close];
    
    return retval;
}

- (TblCampaignSite *)getCampaignsitelist:(NSString *)campaignId SiteId:(NSString *)siteId
{
    
    TblCampaignSite *retval = NULL;
    
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    
    [database open];
    
    FMResultSet *results = [database executeQuery:@"SELECT gd.* FROM tbl_site s INNER JOIN tbl_campaign_site gd ON gd.siteId=s.siteId WHERE gd.campaignId=? AND gd.siteId=?",campaignId,siteId];
    
    if ([results next]) {
        
        retval = [[TblCampaignSite alloc]initWithDictionary:[results resultDictionary]];
    }
    
    [database close];
    return retval;
}
- (void)deleteProdsite:(NSString *)pprod {
    
    // BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    [database executeUpdate:@"delete FROM tbl_campaign_site WHERE campaignId=?",pprod];
    
    [database close];
    //return retval;
    
}
- (TblProduct *)getCampaignbyOffset:(NSString *)pcampaignName Offset:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign  where delflag='N'  ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld ",(long)poffset];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N'  ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld",[pcampaignName uppercaseString],(long)poffset];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getCampaigncount:(NSString *)pcampaignName{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign where delflag='N'  ORDER BY campaignName ASC "];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N' ORDER BY campaignName ASC ",[pcampaignName uppercaseString]];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (TblProduct *)getToptenCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign where delflag='N' AND topten='Y' ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld ",(long)poffset];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N' AND topten='Y' ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld",[pcampaignName uppercaseString],(long)poffset];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getToptenCampaigncount:(NSString *)pcampaignName {
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign where delflag='N' AND topten='Y' ORDER BY campaignName ASC "];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N' AND topten='Y' ORDER BY campaignName ASC ",[pcampaignName uppercaseString]];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (TblProduct *)getFavCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign where  favourite='Y' ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld ",(long)poffset];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND delflag='N' AND favourite='Y' ORDER BY campaignName ASC  LIMIT 1 OFFSET %ld",[pcampaignName uppercaseString],(long)poffset];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
}
- (NSInteger)getFavCampaigncount:(NSString *)pcampaignName{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign where  favourite='Y' ORDER BY campaignName ASC "];
    if([pcampaignName length] > 0){
        query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign  WHERE (UPPER(campaignName) LIKE '%%%@%%') AND  favourite='Y' ORDER BY campaignName ASC ",[pcampaignName uppercaseString]];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}

@end
