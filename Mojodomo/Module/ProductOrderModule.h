//
//  ProductOrderModule.h
//  ProWallet
//
//  Created by Inforios on 08/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProductOrder.h"
#import "TblProductOrderDtl.h"
#import <MZCoupon/MZCoupon.h>

@interface ProductOrderModule : NSObject
//Orders
-(NSString *)loadProductorderListfromserver:(NSInteger )psize;

//Database
- (TblProductOrder *)getProductOrderbyproductId:(NSString *)ppoId;
- (TblProductOrder *)getTransactionRecordsOffset:(NSInteger)poffset;
- (NSInteger)getTransactionRecordsCount;
- (NSInteger)getProductOrderdetailcountbyproductorderId:(NSString *)ppoId;
- (TblProductOrderDtl *)getProductOrderdetailbyproductorderId:(NSString *)ppoId Offset:(NSInteger)poffset;
@end
