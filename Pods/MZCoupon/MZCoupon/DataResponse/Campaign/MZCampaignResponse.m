//
//  MZCampaignResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCampaignResponse.h"

@implementation MZCampaignResponse
@synthesize campaigns;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)campaigns_class {
    return [ProductListData class];
}
+ (Class)size_class {
    return [DataReaponseDataModel class];
}
@end
