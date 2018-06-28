//
//  MZNotificationResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZNotificationResponse.h"

@implementation MZNotificationResponse
@synthesize notifications;
@synthesize size;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)size_class {
    return [DataReaponseDataModel class];
}

+ (Class)notifications_class {
    return [NotificationDataModel class];
}
@end
