//
//  ProductListData.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "ProductListData.h"
#import "CampaignGroupDtlData.h"

@implementation ProductListData

@synthesize campaign;

@synthesize groups;

+ (Class)groups_class {
    return [CampaignGroupDtlData class];
}


@end
