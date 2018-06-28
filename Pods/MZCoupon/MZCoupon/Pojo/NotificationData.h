//
//  NotificationData.h
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface NotificationData : MZJastor
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
