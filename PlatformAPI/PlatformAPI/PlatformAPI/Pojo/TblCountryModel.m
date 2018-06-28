//
//  TblCountryModel.m
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "TblCountryModel.h"


@implementation TblCountryModel

@synthesize country;

+ (Class)country_class {
    return [TblCountryData class];
}
@end
