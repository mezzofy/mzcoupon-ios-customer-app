//
//  MZSiteResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZSiteResponse.h"

@implementation MZSiteResponse
@synthesize sites;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)sites_class {
    return [SiteDataModel class];
}
+ (Class)size_class {
    return [DataReaponseDataModel class];
}
@end
