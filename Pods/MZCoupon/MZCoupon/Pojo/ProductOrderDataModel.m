//
//  ProductOrderDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "ProductOrderDataModel.h"

@implementation ProductOrderDataModel

@synthesize podetail;

+ (Class)podetail_class {
    return [ProductOrderDtlData class];
}

@end
