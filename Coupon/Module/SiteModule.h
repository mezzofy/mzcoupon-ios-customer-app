//
//  SiteModule.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblSite.h"

@interface SiteModule : NSObject
//Site
- (void)getSiteFromServer;

//DataBase
- (NSMutableArray *)getSiteFromTable:(NSString *)pcampainId;
- (TblSite *)getSite:(NSString *)psiteid;
- (NSMutableArray *)getAllSiteFromTable;
- (NSMutableArray *)getAllSiteFromTableForFilter;
@end
