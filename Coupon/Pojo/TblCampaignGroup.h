//
//  TblCampaignGroup.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "Jastor.h"
#import "TblCampaign.h"
#import "TblCampaignGroupDtls.h"

@interface TblCampaignGroup : Jastor

@property (nonatomic, strong) TblCampaign *campaigngroup;
@property (nonatomic, strong)NSMutableArray *campGrpDetails;

@end
