//
//  TblProductList.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "Jastor.h"
#import "TblProduct.h"
#import "TblCampaignGroupDtl.h"

@interface TblProductList : Jastor

@property (nonatomic, strong) TblProduct *campaign;
@property (nonatomic, strong) NSArray *groups;

@end
