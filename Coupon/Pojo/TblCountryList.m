//
//  TblCountryList.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "TblCountryList.h"

@implementation TblCountryList
@synthesize countries;

+ (Class)countries_class {
    return [TblCountryModel class];
}
@end
