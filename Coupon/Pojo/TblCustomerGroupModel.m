//
//  TblCustomerGroupModel.m
//  ProWallet
//
//  Created by Inforios on 07/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerGroupModel.h"

@implementation TblCustomerGroupModel
@synthesize customergroup;


+ (Class)customergroup_class {
    return [TblCustomerGroupData class];
}
@end
