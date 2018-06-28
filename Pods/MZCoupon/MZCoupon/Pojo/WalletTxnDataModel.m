//
//  WalletTxnDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 15/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "WalletTxnDataModel.h"

@implementation WalletTxnDataModel

@synthesize wallettxn;

+ (Class)wallettxn_class {
    return [WalletTxnData class];
}

@end
