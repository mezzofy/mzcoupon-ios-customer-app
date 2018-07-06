//
//  TblProductOrderModel.m
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblProductOrderModel.h"

@implementation TblProductOrderModel

@synthesize podetail;

+ (Class)podetail_class {
    return [TblProductOrderDtl class];
}

@end
