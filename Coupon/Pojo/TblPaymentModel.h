//
//  TblPaymentMaster.h
//  ProMerchant
//
//  Created by Inforios on 28/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblPayment.h"
#import "TblPaymentDtl.h"
@interface TblPaymentModel : Jastor
@property (nonatomic,strong)TblPayment *payment;
@property (nonatomic,strong)TblPaymentDtl *paymentdetail;

@end

