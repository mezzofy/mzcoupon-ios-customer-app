//
//  MZCountryResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCountryResponse.h"

@implementation MZCountryResponse
@synthesize countries;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)countries_class {
    return [CountryDataModel class];
}
@end
