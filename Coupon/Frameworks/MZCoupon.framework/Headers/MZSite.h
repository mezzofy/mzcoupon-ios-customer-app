//
//  MZSite.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SiteData.h"
#import "MZSiteResponse.h"

@interface MZSite : NSObject
//Site
- (MZSiteResponse *)GetMerchantSites:(NSUInteger)poffset;
@end
