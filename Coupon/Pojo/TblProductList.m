//
//  TblProductList.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "TblProductList.h"
#import "TblCampaignGroupDtl.h"

@implementation TblProductList

@synthesize campaign;

@synthesize groups;

+ (Class)groups_class {
    return [TblCampaignGroupDtl class];
}


@end
