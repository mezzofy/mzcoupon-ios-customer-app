//
//  ProductListData.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "MZJastor.h"
#import "ProductData.h"
#import "CampaignGroupDtlData.h"

@interface ProductListData : MZJastor

@property (nonatomic, strong) ProductData *campaign;
@property (nonatomic, strong) NSArray *groups;

@end
