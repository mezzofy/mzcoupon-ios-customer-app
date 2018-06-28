//
//  MZCouponStockResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponStockResponse.h"

@implementation MZCouponStockResponse
@synthesize stock;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)stock_class {
    return [StockData class];
}
@end
