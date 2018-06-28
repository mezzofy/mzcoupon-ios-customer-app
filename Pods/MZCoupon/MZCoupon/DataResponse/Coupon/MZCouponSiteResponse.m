//
//  MZCouponSiteResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponSiteResponse.h"

@implementation MZCouponSiteResponse
@synthesize site;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;


+ (Class)site_class {
    return [SiteData class];
}
@end
