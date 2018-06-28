//
//  TblNotificationData.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 13/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblNotificationData : Jastor
@property (nonatomic, strong)NSString *notificationId;
@property (nonatomic, strong)NSString *customerId;
@property (nonatomic, strong)NSString *notificationTitle;
@property (nonatomic, strong)NSString *notificationDesc;
@property (nonatomic, strong)NSString *notificationType;
@property (nonatomic, strong)NSString *eventId;
@property (nonatomic, strong)NSString *couponId;
@property (nonatomic, strong)NSString *createdOn;
@property (nonatomic, strong)NSString *merchantId;
@property (nonatomic, strong)NSString *siteId;
@end
