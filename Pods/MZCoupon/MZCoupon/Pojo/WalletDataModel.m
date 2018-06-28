//
//  WalletDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 24/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "WalletDataModel.h"

@implementation WalletDataModel
@synthesize wallet;

+ (Class)wallet_class {
    return [WalletData class];
}
@end
