//
//  PaymentMasterData.m
//  Mezzofy
//
//  Created by Mezzofy on 28/06/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "PaymentDataModel.h"


@implementation PaymentDataModel
@synthesize payment;
@synthesize paymentdetail;

+(Class)payment_class{
    return [PaymentData class];
}

+ (Class)paymentdetail_class {
    return [PaymentData class];
}
@end
