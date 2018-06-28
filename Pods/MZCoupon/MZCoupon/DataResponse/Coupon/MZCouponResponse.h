//
//  MZCouponResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 22/02/18.
//  Copyright © 2018 Vasanth Inforios. All rights reserved.
//

#import "MZJastor.h"
#import "CustomerCouponListDataModel.h"
#import "DataReaponseDataModel.h"

@interface MZCouponResponse : MZJastor

@property (nonatomic ,strong)NSMutableArray *customercoupons;
@property (nonatomic, strong)DataReaponseDataModel* size;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;

@end
