//
//  MZCouponSizeResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "CouponData.h"
#import "ProductData.h"


@interface MZCouponSizeResponse : MZJastor
@property (nonatomic, strong)CouponData *coupon;
@property (nonatomic, strong) ProductData *campaign;
@property (nonatomic, strong) NSString *size;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
