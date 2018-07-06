//
//  TblOrderListModel.m
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblOrderListModel.h"

@implementation TblOrderListModel

@synthesize orders;
@synthesize size;

+ (Class)orders_class {
    return [TblOrderModel class];
}
+ (Class)size_class {
    return [DataResponseSize class];
}
@end
