//
//  TblProductOrderModel.h
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

#import "TblProductOrderDtl.h"
@interface TblProductOrderModel : Jastor
@property(nonatomic,strong)TblProductOrderDtl *podetail;

@end
