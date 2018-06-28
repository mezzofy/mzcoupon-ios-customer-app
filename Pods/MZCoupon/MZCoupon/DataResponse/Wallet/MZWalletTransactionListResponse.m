//
//  MZWalletTransactionListResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZWalletTransactionListResponse.h"

@implementation MZWalletTransactionListResponse
@synthesize wallettxns;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)wallettxns_class {
    return [WalletTxnDataModel class];
}

+ (Class)size_class {
    return [DataReaponseDataModel class];
}
@end
