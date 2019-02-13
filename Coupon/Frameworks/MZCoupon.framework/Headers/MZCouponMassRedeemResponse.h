//
//  MZCouponMassRedeemResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "MasscouponData.h"
#import "MassCouponDetailDataModel.h"

@interface MZCouponMassRedeemResponse : MZJastor

@property (strong , nonatomic)MasscouponData *masscoupon;
@property (strong , nonatomic)NSMutableArray *masscoupondtls;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
