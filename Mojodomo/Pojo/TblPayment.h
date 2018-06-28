//
//  TblPayment.h
//  ProMerchant
//
//  Created by Inforios on 28/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblPaymentDtl.h"
@interface TblPayment : Jastor
@property (nonatomic, strong)NSString *paymentId;
@property (nonatomic, strong)NSString *paymentType;
@property (nonatomic, strong)NSString *paymentEnviornment;
@property (nonatomic, strong)NSString *paymentStatus;
@end
