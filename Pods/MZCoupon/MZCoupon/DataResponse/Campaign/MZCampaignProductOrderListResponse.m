//
//  MZCampaignProductOrderListResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 12/03/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCampaignProductOrderListResponse.h"

@implementation MZCampaignProductOrderListResponse
@synthesize pos;


@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)pos_class {
    return [ProductOrderListDataModel class];
}

@end
