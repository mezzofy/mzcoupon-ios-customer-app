//
//  TblOrderModifierModel.m
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblOrderModifierModel.h"

@implementation TblOrderModifierModel
@synthesize ordermodifier;

+ (Class)ordermodifier_class {
    return [TblOrderModifierData class];
}
@end
