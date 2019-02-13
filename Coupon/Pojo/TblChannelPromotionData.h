//
//  TblChannelPromotionData.h
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

NS_ASSUME_NONNULL_BEGIN

@interface TblChannelPromotionData : Jastor
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
