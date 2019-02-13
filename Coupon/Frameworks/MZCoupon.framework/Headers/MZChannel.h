//
//  MZChannelModule.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 01/11/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZChannelResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZChannel : NSObject
- (MZChannelResponse *)GetChannelList;
@end

NS_ASSUME_NONNULL_END
