//
//  TblSiteList.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblSiteList.h"

@implementation TblSiteList
@synthesize sites;
+ (Class)sites_class {
    return [TblSiteModel class];
}
@end
