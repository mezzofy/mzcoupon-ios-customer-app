//
//  MZCustomerResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCustomerResponse.h"

@implementation MZCustomerResponse
@synthesize customer;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)customer_class {
    return [CustomerData class];
}
@end
