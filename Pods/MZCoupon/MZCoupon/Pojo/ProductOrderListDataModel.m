//
//  ProductOrderListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "ProductOrderListDataModel.h"
#import "ProductOrderDataModel.h"
@implementation ProductOrderListDataModel
@synthesize podetails;
@synthesize po;
+(Class)po_class{
    return [ProductOrderData class];
}
+(Class)podetails_class{
    return [ProductOrderDataModel class];
}

@end
