//
//  OrderDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "OrderDataModel.h"

@implementation OrderDataModel
@synthesize order;
@synthesize orderitems;
+ (Class)order_class {
    return [OrderData class];
}


+ (Class)orderitems_class {
    return [OrderItemDataModel class];
}
@end
