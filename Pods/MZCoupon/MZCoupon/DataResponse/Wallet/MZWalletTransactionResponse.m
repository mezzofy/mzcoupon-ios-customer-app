//
//  MZWalletTransactionResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZWalletTransactionResponse.h"

@implementation MZWalletTransactionResponse
@synthesize wallettxn;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)wallettxn_class {
    return [WalletTxnData class];
}
@end
