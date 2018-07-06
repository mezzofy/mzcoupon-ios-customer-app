//
//  CampaingroupModule.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import <Foundation/Foundation.h>
#import "TblCampaign.h"
#import "TblCampaignGroupDtl.h"

@interface CampaingroupModule : NSObject

- (BOOL)addCampaignGroup:(TblCampaign *)pcampaign;
- (TblCampaign *)getCampaignGroup:(NSString *)pcampgrpId;
- (NSMutableArray *)getCampaignGroupList;
- (BOOL)updateCampainGroup:(TblCampaign *)pcampaign;


- (BOOL)addCampaignGroupDtl:(TblCampaignGroupDtl *)pcampaign;
//- (BOOL)updateCampainGroupDtl:(NSString *)pcampgrpId Campaignid:(NSString *)pcampaignId;
- (TblCampaignGroupDtl *)getCampaignGroupDtl:(NSString *)pcampaign CampgrpId:(NSString *)pcampgrpId;
- (BOOL)deleteCampaignGroupDtl;
@end
