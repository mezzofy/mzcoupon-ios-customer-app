//
//  SiteModule.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//
#import <Foundation/Foundation.h>
#import "TblSite.h"
#import <MZCoupon/MZCoupon.h>
@interface SiteDao : NSObject

- (TblSite *)getSite:(NSString *)psiteid;
- (BOOL)addSite:(SiteData *)psite;
- (BOOL)updateSite:(SiteData *)psite;
- (NSMutableArray *)getSiteFromTable:(NSString *)pcampainId;
- (NSMutableArray *)getAllSiteFromTable;
- (NSMutableArray *)getAllSiteFromTableForFilter;
@end
