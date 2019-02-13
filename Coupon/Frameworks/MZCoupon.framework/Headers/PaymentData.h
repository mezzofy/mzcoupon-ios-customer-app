//
//  PaymentData.h
//  Mezzofy
//
//  Created by Mezzofy on 28/06/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "PaymentDtlData.h"
@interface PaymentData : MZJastor
@property (nonatomic, strong)NSString *paymentId;
@property (nonatomic, strong)NSString *paymentType;
@property (nonatomic, strong)NSString *paymentEnviornment;
@property (nonatomic, strong)NSString *paymentStatus;
@end
