//
//  TblCustomerGroupList.m
//  ProWallet
//
//  Created by Inforios on 07/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerGroupList.h"

@implementation TblCustomerGroupList
@synthesize customergroups;


+ (Class)customergroups_class {
    return [TblCustomerGroupModel class];
}
@end
