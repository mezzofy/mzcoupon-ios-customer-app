
//
//  CampaingroupModule.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "CampaingroupModule.h"
#import "Utils.h"

#import <sqlite3.h>
#import "FMDatabase.h"
#import "TblPurchaselist.h"
#import "TblCampaignGroupDtl.h"

@implementation CampaingroupModule

- (BOOL)addCampaignGroup:(TblCampaign *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    [database executeUpdate:@"insert into tbl_campaign_group (campgrpId, campgrpImageurl, campgrpName, campgrpSeq, campgrpStatus, hashCode, merchantId, updatedOn) values(?,?,?,?,?,?,?,?)",[pcampaign campgrpId],[pcampaign campgrpImageurl],[pcampaign campgrpName],[pcampaign campgrpSeq],[pcampaign campgrpStatus],[pcampaign hashCode], [pcampaign merchantId], [pcampaign updatedOn]];
    
    [database commit];
    [database close];
    return retval;
    
}

- (BOOL)updateCampainGroup:(TblCampaign *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    [database executeUpdate:@"update tbl_campaign_group set campgrpImageurl =?, campgrpName =?, campgrpSeq =?, campgrpStatus =?, hashCode =?, merchantId =?, updatedOn =? where campgrpId =?",[pcampaign campgrpImageurl],[pcampaign campgrpName],[pcampaign campgrpSeq],[pcampaign campgrpStatus],[pcampaign hashCode], [pcampaign merchantId], [pcampaign updatedOn],[pcampaign campgrpId]];
    
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
        
        TblCampaign *objcamp=[[TblCampaign alloc]initWithDictionary:[results resultDictionary]];
        
        [retList addObject:objcamp];
    }
    
    [database close];
    return retList;
}


- (BOOL)addCampaignGroupDtl:(TblCampaignGroupDtl *)pcampaign {
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database beginTransaction];
    [database executeUpdate:@"insert into tbl_campaign_groupdtl (campaignId,campgrpId) values(?,?)",[pcampaign campaignId],[pcampaign campgrpId]];
    
    [database commit];
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
    
    [database executeUpdate:@"delete FROM tbl_campaign_groupdtl"];
    
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
@end
