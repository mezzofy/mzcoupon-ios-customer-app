//
//  MZMerchantResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZMerchantResponse.h"

@implementation MZMerchantResponse
@synthesize merchant;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+(Class)merchant_class{
    return [MerchantData class];
}
@end
