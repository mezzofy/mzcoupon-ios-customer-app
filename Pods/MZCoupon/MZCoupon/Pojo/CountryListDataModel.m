//
//  CountryListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "CountryListDataModel.h"

@implementation CountryListDataModel
@synthesize countries;

+ (Class)countries_class {
    return [CountryDataModel class];
}
@end
