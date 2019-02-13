//
//  CampaignGroupData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"
#import "CampaignData.h"
#import "CampaignGroupDtlsData.h"

@interface CampaignGroupData : MZJastor

@property (nonatomic, strong) CampaignData *campaigngroup;
@property (nonatomic, strong)NSMutableArray *campGrpDetails;

@end
