//
//  TblWalletTxnModel.m
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblWalletTxnModel.h"

@implementation TblWalletTxnModel

@synthesize wallettxn;

+ (Class)wallettxn_class {
    return [TblWalletTxnData class];
}

@end
