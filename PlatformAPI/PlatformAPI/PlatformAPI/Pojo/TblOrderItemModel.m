//
//  TblOrderItemModel.m
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblOrderItemModel.h"

@implementation TblOrderItemModel

@synthesize orderitem;
@synthesize ordermodifiers;

+ (Class)orderitem_class {
    return [TblOrderItemData class];
}

+ (Class)ordermodifiers_class {
    return [TblOrderModifierModel class];
}
@end
