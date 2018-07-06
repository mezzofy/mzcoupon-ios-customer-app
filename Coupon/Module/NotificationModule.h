//
//  NotificationModule.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 15/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "Utils.h"
#import <MZCoupon/MZCoupon.h>

@interface NotificationModule : NSObject
- (NSMutableArray *)getNotificationListFromServerOffset:(NSUInteger)poffset resultarray:(NSMutableArray *)retarray;
@end
