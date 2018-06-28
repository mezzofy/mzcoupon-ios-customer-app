//
//  OrderListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "OrderListDataModel.h"

@implementation OrderListDataModel

@synthesize orders;
@synthesize size;

+ (Class)orders_class {
    return [OrderDataModel class];
}
+ (Class)size_class {
    return [DataResponseSizeData class];
}
@end
