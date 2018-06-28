//
//  MZCampaignGroupResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCampaignGroupResponse.h"

@implementation MZCampaignGroupResponse
@synthesize campaigngroups;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)campaigngroups_class {
    return [CampaignGroupData class];
}
@end
