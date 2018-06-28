//
//  CampaingroupDao.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CampaingroupDao.h"


@implementation CampaingroupDao


- (BOOL)addCampaignGroup:(TblCampaign *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"insert into tbl_campaign_group (campgrpId, campgrpImageurl, campgrpName, campgrpSeq, campgrpStatus, hashCode, merchantId, updatedOn) values(?,?,?,?,?,?,?,?)",[pcampaign campgrpId],[pcampaign campgrpImageurl],[pcampaign campgrpName],[pcampaign campgrpSeq],[pcampaign campgrpStatus],[pcampaign hashCode], [pcampaign merchantId], [pcampaign updatedOn]];
    
    [database commit];
    [database close];
    return retval;
    
}

- (BOOL)updateCampainGroup:(TblCampaign *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    retval = [database executeUpdate:@"update tbl_campaign_group set campgrpImageurl =?, campgrpName =?, campgrpSeq =?, campgrpStatus =?, hashCode =?, merchantId =?, updatedOn =? where campgrpId =?",[pcampaign campgrpImageurl],[pcampaign campgrpName],[pcampaign campgrpSeq],[pcampaign campgrpStatus],[pcampaign hashCode], [pcampaign merchantId], [pcampaign updatedOn],[pcampaign campgrpId]];
    
    [database commit];
    [database close];
    return retval;
}

- (TblCampaign *)getCampaignGroup:(NSString *)pcampgrpId {
    
    TblCampaign *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resprod = [database executeQuery:@"SELECT * FROM tbl_campaign_group where campgrpId =?",pcampgrpId];
    
    if ([resprod next]) {
        
        retval = [[TblCampaign alloc]initWithDictionary:[resprod resultDictionary]];
    }
    
    [database close];
    
    return retval;
}

- (NSMutableArray *)getCampaignGroupList
{
    
    NSMutableArray *retList=[[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    
    [database open];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_campaign_group"];
    
    while([results next]) {
        
        CampaignData *objcamp=[[CampaignData alloc]initWithDictionary:[results resultDictionary]];
        
        [retList addObject:objcamp];
    }
    
    [database close];
    return retList;
}


- (BOOL)addCampaignGroupDtl:(TblCampaignGroupDtl *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_campaign_groupdtl (campaignId,campgrpId) values(?,?)",[pcampaign campaignId],[pcampaign campgrpId]];
    
    
    [database close];
    return retval;
    
}

//- (BOOL)updateCampainGroupDtl:(NSString *)pcampgrpId Campaignid:(NSString *)pcampaignId {
//    BOOL retval = false;
//
//    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
//    [database open];
//
//    [database executeUpdate:@"update tbl_campaign_groupdtl set campaignId =? where campgrpId =?",pcampaignId,pcampgrpId];
//
//    [database close];
//    return retval;
//}

- (BOOL)deleteCampaignGroupDtl {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"delete FROM tbl_campaign_groupdtl "];
    
    [database close];
    return retval;
    
}

- (TblCampaignGroupDtl *)getCampaignGroupDtl:(NSString *)pcampaign CampgrpId:(NSString *)pcampgrpId {
    
    TblCampaignGroupDtl *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *resprod = [database executeQuery:@"SELECT * FROM tbl_campaign_groupdtl where campaignId =? AND campgrpId =?",pcampaign,pcampgrpId];
    
    if ([resprod next]) {
        
        retval = [[TblCampaignGroupDtl alloc]initWithDictionary:[resprod resultDictionary]];
    }
    
    [database close];
    
    return retval;
}
- (TblCampaign *)getCampaignGroupbyOffset:(NSInteger)poffset{
    TblCampaign *retval=[[TblCampaign alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_campaign_group order by campgrpSeq ASC  LIMIT 1 OFFSET %ld ",(long)poffset];
   
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblCampaign alloc]initWithDictionary:[res resultDictionary]];
    }
    [database close];
    
    return retval;
}
- (NSInteger)getCampaignGroupcount{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign_group order by campgrpSeq ASC "];

    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}

- (TblProduct *)getCampaignGroupDetailbyCampaignGroupId:(NSString *)pcampgrpId Offset:(NSInteger)poffset{
    TblProduct *retval=[[TblProduct alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"select * FROM tbl_campaign c inner join tbl_campaign_groupdtl cd where cd.campaignId=c.campaignId And cd.campgrpId='%@' order by c.campaignName Asc  LIMIT 1 OFFSET %ld ",pcampgrpId,(long)poffset];
    
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblProduct alloc]initWithDictionary:[res resultDictionary]];
    }
    [database close];
    
    return retval;
}
- (NSInteger)getCampaignGroupDetailcountCampaignGroupId:(NSString *)pcampgrpId{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_campaign c inner join tbl_campaign_groupdtl cd where cd.campaignId=c.campaignId And cd.campgrpId='%@' order by c.campaignName Asc ",pcampgrpId];
    
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
@end
