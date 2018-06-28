//
//  MZWalletResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZWalletResponse.h"

@implementation MZWalletResponse
@synthesize wallet;


@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)wallet_class {
    return [WalletData class];
}
@end
