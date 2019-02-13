//
//  MZNotification.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 15/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZCouponConfig.h"
#import "MZUtils.h"
#import "MZNotificationResponse.h"

@interface MZNotification : NSObject
- (MZNotificationResponse *)GetNotifications:(NSUInteger)poffset;
@end
