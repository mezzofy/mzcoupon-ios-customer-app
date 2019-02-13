//
//  ChannelPromotionData.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 01/11/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChannelPromotionData : MZJastor
@property (nonatomic, strong)NSString *channelPlayId;
@property (nonatomic, strong)NSString *merchantId;
@property (nonatomic, strong)NSString *playName;
@property (nonatomic, strong)NSString *fromDate;
@property (nonatomic, strong)NSString *toDate;
@property (nonatomic, strong)NSString *fromTime;
@property (nonatomic, strong)NSString *toTime;
@property (nonatomic, strong)NSString *sunday;
@property (nonatomic, strong)NSString *monday;
@property (nonatomic, strong)NSString *tuesday;
@property (nonatomic, strong)NSString *wednesday;
@property (nonatomic, strong)NSString *thursday;
@property (nonatomic, strong)NSString *friday;
@property (nonatomic, strong)NSString *saturday;
@property (nonatomic, strong)NSString *updatedOn;
@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *startDate;
@property (nonatomic, strong)NSString *endDate;
@property (nonatomic, strong)NSString *couponCount;
@end

NS_ASSUME_NONNULL_END
