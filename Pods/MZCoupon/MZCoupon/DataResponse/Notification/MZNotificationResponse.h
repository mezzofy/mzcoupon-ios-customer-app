//
//  MZNotificationResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "DataResponseSizeData.h"
#import "NotificationDataModel.h"

@interface MZNotificationResponse : MZJastor
@property (nonatomic, strong)NSMutableArray *notifications;
@property (nonatomic, strong)DataResponseSizeData *size;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
