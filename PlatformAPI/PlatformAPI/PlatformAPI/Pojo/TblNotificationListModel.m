//
//  TblNotificationListModel.m
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 13/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblNotificationListModel.h"

@implementation TblNotificationListModel
@synthesize notifications;
@synthesize size;


+ (Class)notifications_class {
    return [TblNotificationModel class];
}

+ (Class)size_class {
    return [DataResponseSize class];
}
@end
