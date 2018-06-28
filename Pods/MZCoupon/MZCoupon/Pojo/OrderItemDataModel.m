//
//  OrderItemDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "OrderItemDataModel.h"

@implementation OrderItemDataModel

@synthesize orderitem;
@synthesize ordermodifiers;

+ (Class)orderitem_class {
    return [OrderItemData class];
}

+ (Class)ordermodifiers_class {
    return [OrderModifierDataModel class];
}
@end
