//
//  ChannelLocationDataModel.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 01/11/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "ChannelLocationData.h"
#import "ChannelPromotionData.h"
#import "ChannelPlayListData.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChannelLocationDataModel : MZJastor
@property (nonatomic, strong)ChannelLocationData *location;
@property (nonatomic, strong)NSMutableArray *coupongroups;
@property (nonatomic, strong)NSMutableArray *coupons;
@end

NS_ASSUME_NONNULL_END
