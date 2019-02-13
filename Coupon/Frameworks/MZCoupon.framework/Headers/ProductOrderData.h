//
//  ProductOrderData.h
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "CustomerCouponData.h"

@interface ProductOrderData : MZJastor
@property (nonatomic,strong)NSString *poId;
@property (nonatomic,strong)NSString *merchantId;
@property (nonatomic,strong)NSString *customerId;
@property (nonatomic,strong)NSString *customerName;
@property (nonatomic,strong)NSString *poDate;
@property (nonatomic,strong)NSString *poNo;
@property (nonatomic,strong)NSString *poTotal;
@property (nonatomic,strong)NSString *poStatus;
@property (nonatomic,strong)NSString *payReceipt;
@property (nonatomic,strong)NSString *payResponse;
@property (nonatomic,strong)NSString *transferTo;
@property (nonatomic,strong)NSString *transferFrom;
@property (nonatomic,strong)NSString *payToken;
@property (nonatomic,strong)NSString *rewardPoint;
@property (nonatomic,strong)NSString *hashCode;
@property (nonatomic,strong)NSString *updatedOn;
@property (nonatomic,strong)NSString *couponType;
@property (nonatomic,strong)NSString *paymentDetailId;

@property (nonatomic, strong) CustomerCouponData *customercoupons;


@end
