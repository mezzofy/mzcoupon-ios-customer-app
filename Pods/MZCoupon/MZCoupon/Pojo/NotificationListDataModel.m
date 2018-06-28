//
//  NotificationListDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "NotificationListDataModel.h"

@implementation NotificationListDataModel
@synthesize notifications;
@synthesize size;


+ (Class)notifications_class {
    return [NotificationDataModel class];
}

+ (Class)size_class {
    return [DataResponseSizeData class];
}
@end
