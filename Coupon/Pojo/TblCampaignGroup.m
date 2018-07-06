//
//  TblCampaignGroup.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "TblCampaignGroup.h"

@implementation TblCampaignGroup

@synthesize campaigngroup;
@synthesize campGrpDetails;

+ (Class)campGrpDetails_class {
    return [TblCampaignGroupDtls class];
}

@end
