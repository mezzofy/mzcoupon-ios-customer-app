//
//  CampaignGroupData.m
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "CampaignGroupData.h"

@implementation CampaignGroupData

@synthesize campaigngroup;
@synthesize campGrpDetails;

+ (Class)campGrpDetails_class {
    return [CampaignGroupDtlsData class];
}

@end
