//
//  TblPaymentMaster.m
//  ProMerchant
//
//  Created by Inforios on 30/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblPaymentMaster.h"

@implementation TblPaymentMaster
@synthesize paymentdetails;
@synthesize payments;
+ (Class)paymentdetails_class {
    return [TblPaymentModel class];
}
+ (Class)payments_class {
    return [TblPaymentModel class];
}
@end
