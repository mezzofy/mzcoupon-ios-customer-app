//
//  NotificationDataModel.m
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "NotificationDataModel.h"

@implementation NotificationDataModel
@synthesize notification;

+ (Class)notification_class {
    return [NotificationData class];
}
@end
