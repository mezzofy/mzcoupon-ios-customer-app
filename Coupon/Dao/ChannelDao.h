//
//  ChannelDao.h
//  Coupon
//
//  Created by Vasanth Inforios on 08/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MZCoupon/MZCoupon.h>
#import "FMDatabase.h"
#import "TblChannelLocationData.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChannelDao : NSObject
- (BOOL)addChannel:(ChannelLocationData *)pchanneldata;
- (BOOL)updateChannel:(ChannelLocationData *)pchanneldata;
- (TblChannelLocationData *)getChannelbyOffset:(NSString *)pChannelCode Offset:(NSInteger)poffset;
- (NSInteger)getChannelcount:(NSString *)pchannelCode;
- (TblChannelLocationData *)getChannelLocationData:(NSString *)pchannelLocId;
@end

NS_ASSUME_NONNULL_END
