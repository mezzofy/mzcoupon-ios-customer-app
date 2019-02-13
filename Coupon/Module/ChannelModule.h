//
//  ChannelModule.h
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "Utils.h"
#import <MZCoupon/MZCoupon.h>
#import "ChannelDao.h"
#import "LoaderModule.h"
#import "Common.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChannelModule : NSObject
- (void)getChannelListFromServer;

- (BOOL)addChannel:(ChannelLocationData *)pchanneldata;
- (BOOL)updateChannel:(ChannelLocationData *)pchanneldata;
- (TblChannelLocationData *)getChannelbyOffset:(NSString *)pChannelCode Offset:(NSInteger)poffset;
- (NSInteger)getChannelcount:(NSString *)pchannelCode;
@end

NS_ASSUME_NONNULL_END
