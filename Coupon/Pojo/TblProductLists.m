//
//  TblProductLists.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "TblProductLists.h"

@implementation TblProductLists

@synthesize campaigns;

+ (Class)campaigns_class {
    return [TblProductList class];
}

@end
