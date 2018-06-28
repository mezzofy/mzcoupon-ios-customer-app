//
//  StockDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 14/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "StockDataModel.h"

@implementation StockDataModel
@synthesize stock;

+ (Class)stock_class {
    return [StockData class];
}
@end
