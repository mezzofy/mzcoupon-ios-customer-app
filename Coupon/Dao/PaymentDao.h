//
//  PaymentDao.h
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "TblPayment.h"
#import "TblPaymentDtl.h"
#import <MZCoupon/MZCoupon.h>

@interface PaymentDao : NSObject
- (void)addpaymentDtl:(PaymentDtlData *)ppaymentdtl;
- (void)UpdatepaymentDtl:(PaymentDtlData *)ppaymentdtl;

//Database
- (TblPaymentDtl *)getPaymentDtl:(NSString *)ppaymentDetailId;

//tabel data
- (NSInteger)getAvaliablePaymentMethodcount;
- (TblPaymentDtl *)getPaymentMethodDetailOffset:(NSInteger)poffset;
@end
