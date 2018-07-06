//
//  TblOrderModel.m
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblOrderModel.h"

@implementation TblOrderModel
@synthesize order;
@synthesize orderitems;
+ (Class)order_class {
    return [TblOrderData class];
}


+ (Class)orderitems_class {
    return [TblOrderItemModel class];
}
@end
