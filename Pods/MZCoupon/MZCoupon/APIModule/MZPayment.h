//
//  MZPayment.h
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZPaymentResponse.h"
#import "MZUtils.h"

@interface MZPayment : NSObject
-(MZPaymentResponse *)GetPayments:(NSInteger )poffset;
@end
