//
//  TblChannelLocationDataModel.h
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblChannelLocationData.h"
#import "TblChannelPlayListData.h"
#import "TblChannelPromotionData.h"
NS_ASSUME_NONNULL_BEGIN

@interface TblChannelLocationDataModel : Jastor
@property (nonatomic, strong)TblChannelLocationData *location;
@property (nonatomic, strong)NSMutableArray *coupongroups;
@property (nonatomic, strong)NSMutableArray *coupons;
@end

NS_ASSUME_NONNULL_END
