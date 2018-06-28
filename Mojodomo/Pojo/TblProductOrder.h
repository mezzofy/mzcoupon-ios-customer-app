//
//  TblProductOrder.h
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblCustomerCouponData.h"

@interface TblProductOrder : Jastor
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
@property (nonatomic, copy) NSString* delflag;
@property (nonatomic, strong) TblCustomerCouponData *customercoupons;


@end
