//
//  TblStockModel.m
//  ProWallet
//
//  Created by Inforios on 14/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblStockModel.h"

@implementation TblStockModel
@synthesize stock;

+ (Class)stock_class {
    return [TblStockData class];
}
@end
