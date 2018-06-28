//
//  TblOrderModel.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblOrderItemModel.h"
#import "TblOrderData.h"
@interface TblOrderModel : Jastor
@property(nonatomic ,strong)TblOrderData *order;
@property(nonatomic,strong)NSMutableArray *orderitems;

@end
