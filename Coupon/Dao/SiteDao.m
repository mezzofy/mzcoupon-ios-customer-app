//
//  SiteModule.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "SiteDao.h"
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"

@implementation SiteDao


- (TblSite *)getSite:(NSString *)psiteid{
    
    TblSite *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_site where siteId =?",psiteid];
    
    if ([ressite next]) {
        
        retval =[[TblSite alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
- (BOOL)addSite:(SiteData *)psite {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_site (siteId, merchantId, siteName, siteAddress, siteLatitude,siteLongitude, siteLocation,siteEmailId,siteOnlineStatus, siteContact,siteStatus,siteRedeemPass,hashCode,locationId,siteDesc,siteDisplayWallet,siteSeqNo,siteImageurl,createdOn,updatedOn,updatedBy,delflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",[psite siteId],[psite merchantId],[psite siteName],[psite siteAddress],[psite siteLatitude],[psite siteLongitude],[psite siteLocation],[psite siteEmailId],[psite siteOnlineStatus],[psite siteContact],[psite siteStatus],[psite siteRedeemPass],[psite hashCode],[psite locationId],[psite siteDesc],[psite siteDisplayWallet],[psite siteSeqNo],[psite siteImageurl],[psite createdOn],[psite updatedOn],[psite updatedBy]];
    
    [database close];
    return retval;
    
}



- (BOOL)updateSite:(SiteData *)psite {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval = [database executeUpdate:@"Update tbl_site set merchantId =?, siteName =?, siteAddress =?, siteLatitude =?,siteLongitude =?, siteLocation =?,siteEmailId =?,siteOnlineStatus =?, siteContact =?,siteStatus =?,siteRedeemPass =?,hashCode =?,locationId =?,siteDesc =?,siteDisplayWallet =?,siteSeqNo =?,siteImageurl =?,createdOn =?,updatedOn =?,updatedBy =? ,delflag = 'N' where siteId =?",[psite merchantId],[psite siteName],[psite siteAddress],[psite siteLatitude],[psite siteLongitude],[psite siteLocation],[psite siteEmailId],[psite siteOnlineStatus],[psite siteContact],[psite siteStatus],[psite siteRedeemPass],[psite hashCode],[psite locationId],[psite siteDesc],[psite siteDisplayWallet],[psite siteSeqNo],[psite siteImageurl],[psite createdOn],[psite updatedOn],[psite updatedBy],[psite siteId]];
    
    [database close];
    return retval;
    
}
-(NSMutableArray *)getSiteFromTable:(NSString *)pcampainId{
    NSMutableArray *arrsite=[[NSMutableArray alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from tbl_site as s inner join tbl_campaign_site as cs  ON cs.siteId=s.siteId AND cs.campaignId= ? GROUP by s.siteId ",pcampainId];
    
    while([results next]) {
        
        TblSite *objsite=[[TblSite alloc]initWithDictionary:[results resultDictionary]];
        
        [arrsite addObject:objsite];
    }
    return arrsite;
    
}
-(NSMutableArray *)getAllSiteFromTable{
    NSMutableArray *arrsite=[[NSMutableArray alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from tbl_site  "];
    
    while([results next]) {
        
        TblSite *objsite=[[TblSite alloc]initWithDictionary:[results resultDictionary]];
        
        [arrsite addObject:objsite];
    }
    return arrsite;
    
}
- (NSMutableArray *)getAllSiteFromTableForFilter{
    NSMutableArray *arrsite=[[NSMutableArray alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from tbl_site  "];
    
    while([results next]) {
        
        SiteData *objsite=[[SiteData alloc]initWithDictionary:[results resultDictionary]];
        
        [arrsite addObject:objsite];
    }
    return arrsite;
    
}
@end
