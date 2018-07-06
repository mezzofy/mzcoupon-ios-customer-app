//
//  TblMassCouponModel.h
//  ProWallet
//
//  Created by Inforios on 13/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblMassCouponDetailModel.h"
#import "TblMasscouponData.h"

@interface TblMassCouponModel : Jastor
@property (strong , nonatomic)TblMasscouponData *masscoupon;
@property (strong , nonatomic)NSMutableArray *masscoupondtls;

@end
