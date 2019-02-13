//
//  ProductOrderListDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "ProductOrderData.h"
@interface ProductOrderListDataModel : MZJastor
@property(nonatomic,strong)ProductOrderData *po;
@property(nonatomic,strong)NSMutableArray *podetails;
@end
