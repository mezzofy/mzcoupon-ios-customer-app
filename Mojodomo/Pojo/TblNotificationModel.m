//
//  TblNotificationModel.m
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 13/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblNotificationModel.h"

@implementation TblNotificationModel
@synthesize notification;

+ (Class)notification_class {
    return [TblNotificationData class];
}
@end
