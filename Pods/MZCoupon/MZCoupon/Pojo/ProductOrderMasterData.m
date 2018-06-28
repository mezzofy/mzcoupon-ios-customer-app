//
//  ProductOrderMasterData.m
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "ProductOrderMasterData.h"
#import "ProductOrderListDataModel.h"

@implementation ProductOrderMasterData
@synthesize pos;

+(Class)pos_class{
    return [ProductOrderListDataModel class];
}

@end
