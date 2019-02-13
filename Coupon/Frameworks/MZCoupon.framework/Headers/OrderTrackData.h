//
//  OrderTrackData.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface OrderTrackData : MZJastor
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *trackStatus;
@property (nonatomic, strong) NSString *trackSeq;
@property (nonatomic, strong) NSString *notificationMsg;
@property (nonatomic, strong) NSString *notificationStatus;
@property (nonatomic, strong) NSString *updatedOn;
@end
