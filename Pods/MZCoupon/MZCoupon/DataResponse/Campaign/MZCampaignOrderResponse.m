//
//  MZCampaignOrderResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCampaignOrderResponse.h"

@implementation MZCampaignOrderResponse
@synthesize orders;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)orders_class {
    return [OrderDataModel class];
}
+ (Class)size_class {
    return [DataResponseSizeData class];
}
@end
