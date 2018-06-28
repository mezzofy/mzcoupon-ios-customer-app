//
//  ProductOrderDao.h
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProductOrder.h"
#import "TblProductOrderDtl.h"
@interface ProductOrderDao : NSObject
//Product
-(void)addProductOrder:(TblProductOrder *)pproduct;
-(void)updateProductOrder:(TblProductOrder *)pproduct;
-(TblProductOrder *)getProductOrderbyproductId:(NSString *)ppoId;

//ProductDetail
-(void)addProductOrderDtl:(TblProductOrderDtl *)pproduct;
-(void)updateProductOrderDtl:(TblProductOrderDtl *)pproduct;
-(TblProductOrderDtl *)getProductOrderdetailbyproductdetailId:(NSString *)ppodetailsId;

//Database
- (TblProductOrder *)getTransactionRecordsOffset:(NSInteger)poffset;
- (NSInteger)getTransactionRecordsCount;
- (NSInteger)getProductOrderdetailcountbyproductorderId:(NSString *)ppoId;
- (TblProductOrderDtl *)getProductOrderdetailbyproductorderId:(NSString *)ppoId Offset:(NSInteger)poffset;
@end
