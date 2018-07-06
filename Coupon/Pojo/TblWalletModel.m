//
//  TblWalletModel.m
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblWalletModel.h"

@implementation TblWalletModel
@synthesize wallet;

+ (Class)wallet_class {
    return [TblWalletData class];
}
@end
