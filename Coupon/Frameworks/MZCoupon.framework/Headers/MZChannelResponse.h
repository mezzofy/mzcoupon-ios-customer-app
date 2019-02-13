//
//  MZChannelResponse.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 01/11/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "ChannelLocationDataModel.h"
#import "DataReaponseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZChannelResponse : MZJastor
@property(nonatomic,strong)NSMutableArray *channellocations;
@property (nonatomic, strong)DataReaponseDataModel *size;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end

NS_ASSUME_NONNULL_END
