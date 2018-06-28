//
//  TblPaymentMaster.m
//  ProMerchant
//
//  Created by Inforios on 28/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblPaymentModel.h"


@implementation TblPaymentModel
@synthesize payment;
@synthesize paymentdetail;

+(Class)payment_class{
    return [TblPayment class];
}

+ (Class)paymentdetail_class {
    return [TblPaymentDtl class];
}
@end
