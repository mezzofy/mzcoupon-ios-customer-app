//
//  PaymentMasterData.m
//  Mezzofy
//
//  Created by Mezzofy on 30/06/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "PaymentMasterData.h"

@implementation PaymentMasterData
@synthesize paymentdetails;
@synthesize payments;
+ (Class)paymentdetails_class {
    return [PaymentDataModel class];
}
+ (Class)payments_class {
    return [PaymentDataModel class];
}
@end
