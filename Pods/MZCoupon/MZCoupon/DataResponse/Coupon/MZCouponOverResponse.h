//
//  MZCouponOverResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 09/03/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "OverCouponData.h"
@interface MZCouponOverResponse : MZJastor
@property (nonatomic,strong)NSString *couponcount;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
