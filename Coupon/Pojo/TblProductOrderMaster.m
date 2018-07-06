//
//  TblProductOrderMaster.m
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblProductOrderMaster.h"
#import "TblProductOrderListModel.h"

@implementation TblProductOrderMaster
@synthesize pos;

+(Class)pos_class{
    return [TblProductOrderListModel class];
}

@end
