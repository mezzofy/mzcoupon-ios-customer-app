//
//  SiteListData.m
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "SiteListData.h"

@implementation SiteListData
@synthesize sites;
+ (Class)sites_class {
    return [SiteDataModel class];
}
@end
