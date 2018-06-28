//
//  TblPaymentDtl.h
//  ProMerchant
//
//  Created by Inforios on 28/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblPaymentDtl : Jastor
@property (nonatomic, copy) NSString* paymentDetailId;
@property (nonatomic, copy) NSString* merchantId;
@property (nonatomic, copy) NSString* paymentId;
@property (nonatomic, copy) NSString* paymentName;
@property (nonatomic, copy) NSString* paymentMerchantId;
@property (nonatomic, copy) NSString* paymentKey;
@property (nonatomic, copy) NSString* paymentToken;
@property (nonatomic, copy) NSString* paymentUrl;
@property (nonatomic, copy) NSString* paymentStatus;
@property (nonatomic, copy) NSString* paymentLogourl;
@property (nonatomic, copy) NSString* paymentType;
@property (nonatomic, copy) NSString* paymentEnviornment;
@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* hashCode;
@property (nonatomic, copy) NSString* updatedOn;
@property (nonatomic, copy) NSString* delflag;


@end
