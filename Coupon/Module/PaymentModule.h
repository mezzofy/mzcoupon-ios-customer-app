//
//  PaymentModule.h
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblPaymentMaster.h"
#import "TblPaymentModel.h"
#import "LoaderModule.h"
#import "Utils.h"
#import "LoaderModule.h"


@interface PaymentModule : NSObject
-(void)loadPaymentListfromserver:(NSInteger )poffset;


- (NSInteger)getAvaliablePaymentMethodcount;
- (TblPaymentDtl *)getPaymentMethodDetailOffset:(NSInteger)poffset;
@end
