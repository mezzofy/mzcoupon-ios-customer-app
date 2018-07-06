//
//  TblWalletTxnListModel.m
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblWalletTxnListModel.h"


@implementation TblWalletTxnListModel

@synthesize wallettxns;

+ (Class)wallettxns_class {
    return [TblWalletTxnModel class];
}

@end
