//
//  NotificationListDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "DataResponseSizeData.h"
#import "NotificationDataModel.h"
@interface NotificationListDataModel : MZJastor
@property (nonatomic, strong)NSMutableArray *notifications;
@property (nonatomic, strong)DataResponseSizeData *size;
@end
