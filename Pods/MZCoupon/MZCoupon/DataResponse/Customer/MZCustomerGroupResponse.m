//
//  MZCustomerGroupResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCustomerGroupResponse.h"

@implementation MZCustomerGroupResponse
@synthesize customergroup;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)customergroup_class {
    return [CustomerGroupData class];
}
@end
