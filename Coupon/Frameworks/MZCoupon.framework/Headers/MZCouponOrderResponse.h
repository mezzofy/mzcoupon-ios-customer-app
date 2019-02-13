//
//  MZCouponOrderResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "OrderData.h"
#import "OrderItemDataModel.h"

@interface MZCouponOrderResponse : MZJastor
@property(nonatomic ,strong)OrderData *order;
@property(nonatomic,strong)NSMutableArray *orderitems;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
