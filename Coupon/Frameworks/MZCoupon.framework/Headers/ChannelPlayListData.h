//
//  ChannelPlayListData.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 01/11/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChannelPlayListData : MZJastor
@property (nonatomic, strong)NSString *playCampId;
@property (nonatomic, strong)NSString *channelPlayId;
@property (nonatomic, strong)NSString *channelType;
@property (nonatomic, strong)NSString *campaignId;
@property (nonatomic, strong)NSString *merchantId;
@property (nonatomic, strong)NSString *merchantName;
@property (nonatomic, strong)NSString *fromDate;
@property (nonatomic, strong)NSString *toDate;
@property (nonatomic, strong)NSString *campaignCode;
@property (nonatomic, strong)NSString *campaignName;
@property (nonatomic, strong)NSString *campaignDesc;
@property (nonatomic, strong)NSString *campaignImage;
@property (nonatomic, strong)NSString *sellingPrice;
@property (nonatomic, strong)NSString *orginalPrice;
@property (nonatomic, strong)NSString *buyUrl;
@property (nonatomic, strong)NSString *currency;
@property (nonatomic, strong)NSString *hashCode;
@property (nonatomic, strong)NSString *createdOn;
@property (nonatomic, strong)NSString *updatedOn;
@property (nonatomic, strong)NSString *updatedBy;
@property (nonatomic, strong)NSString *status;
@end

NS_ASSUME_NONNULL_END
