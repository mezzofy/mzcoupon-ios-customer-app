//
//  TblCouponModel.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblCouponData.h"
#import "TblProduct.h"
@interface TblCustomerCouponModel : Jastor
@property(nonatomic ,strong)TblCouponData *coupon;
@property (nonatomic, strong) TblProduct *campaign;
@property (nonatomic, strong) NSString *size;
@end
