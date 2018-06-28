//
//  MZCampaignDetailResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCampaignDetailResponse.h"

@implementation MZCampaignDetailResponse
@synthesize campaign;
@synthesize groups;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)groups_class {
    return [CampaignGroupDtlData class];
}
@end
