//
//  TblProductOrderListModel.h
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblProductOrder.h"
@interface TblProductOrderListModel : Jastor
@property(nonatomic,strong)TblProductOrder *po;
@property(nonatomic,strong)NSMutableArray *podetails;
@end
