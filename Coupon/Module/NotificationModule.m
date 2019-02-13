//
//  NotificationModule.m
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 15/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "NotificationModule.h"
#import "TblNotificationListModel.h"

@implementation NotificationModule
- (NSMutableArray *)getNotificationListFromServerOffset:(NSUInteger)poffset resultarray:(NSMutableArray *)retarray{
    MZNotificationResponse *objmezzofy=[[MZNotificationResponse alloc]init];
    MZNotification *objMZNotification=[[MZNotification alloc]init];
    objmezzofy=[objMZNotification GetNotifications:poffset];
    [Common dataResponse:objmezzofy.size.size];
    if(poffset==1)
        retarray=[[NSMutableArray alloc]init];
    for(NotificationDataModel *objnotificationmodel in objmezzofy.notifications){
        [retarray addObject:objnotificationmodel.notification];
    }
    return retarray;
}

@end
