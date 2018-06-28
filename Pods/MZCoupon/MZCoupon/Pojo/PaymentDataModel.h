//
//  PaymentMasterData.h
//  Mezzofy
//
//  Created by Mezzofy on 28/06/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "PaymentData.h"
#import "PaymentDtlData.h"
@interface PaymentDataModel : MZJastor
@property (nonatomic,strong)PaymentData *payment;
@property (nonatomic,strong)PaymentDtlData *paymentdetail;

@end

