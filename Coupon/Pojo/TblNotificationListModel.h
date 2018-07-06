//
//  TblNotificationListModel.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 13/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "DataResponseSize.h"
#import "TblNotificationModel.h"
@interface TblNotificationListModel : Jastor
@property (nonatomic, strong)NSMutableArray *notifications;
@property (nonatomic, strong)DataResponseSize *size;
@end
