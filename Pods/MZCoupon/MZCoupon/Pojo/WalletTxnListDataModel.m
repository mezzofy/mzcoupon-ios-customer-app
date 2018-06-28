//
//  WalletTxnListModel.m
//  Mezzofy
//
//  Created by Mezzofy on 15/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "WalletTxnListDataModel.h"


@implementation WalletTxnListDataModel

@synthesize wallettxns;

+ (Class)wallettxns_class {
    return [WalletTxnDataModel class];
}

@end
