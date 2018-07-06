//
//  CampaingroupDao.h
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "FMDatabase.h"
#import "TblCampaignGroupDtl.h"
#import "TblCampaign.h"
#import "TblCampaignGroupDtl.h"
#import "TblProduct.h"

@interface CampaingroupDao : NSObject
- (BOOL)addCampaignGroup:(TblCampaign *)pcampaign;
- (TblCampaign *)getCampaignGroup:(NSString *)pcampgrpId;
- (NSMutableArray *)getCampaignGroupList;
- (BOOL)updateCampainGroup:(TblCampaign *)pcampaign;


- (BOOL)addCampaignGroupDtl:(TblCampaignGroupDtl *)pcampaign;
//- (BOOL)updateCampainGroupDtl:(NSString *)pcampgrpId Campaignid:(NSString *)pcampaignId;
- (TblCampaignGroupDtl *)getCampaignGroupDtl:(NSString *)pcampaign CampgrpId:(NSString *)pcampgrpId;
- (BOOL)deleteCampaignGroupDtl;
//By offset
- (TblCampaign *)getCampaignGroupbyOffset:(NSInteger)poffset;
- (NSInteger)getCampaignGroupcount;

//Detail Campaign
- (TblProduct *)getCampaignGroupDetailbyCampaignGroupId:(NSString *)pcampgrpId Offset:(NSInteger)poffset;
- (NSInteger)getCampaignGroupDetailcountCampaignGroupId:(NSString *)pcampgrpId;
@end
