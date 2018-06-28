//
//  CustomerGroupListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 07/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "CustomerGroupListDataModel.h"

@implementation CustomerGroupListDataModel
@synthesize customergroups;


+ (Class)customergroups_class {
    return [CustomerGroupDataModel class];
}
@end
