//
//  MZPaymentResponse.m
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZPaymentResponse.h"

@implementation MZPaymentResponse
@synthesize paymentdetails;
@synthesize payments;

@synthesize error;
@synthesize developerMessage;
@synthesize message;
@synthesize status;
@synthesize code;

+ (Class)paymentdetails_class {
    return [PaymentDataModel class];
}
+ (Class)payments_class {
    return [PaymentDataModel class];
}
@end
