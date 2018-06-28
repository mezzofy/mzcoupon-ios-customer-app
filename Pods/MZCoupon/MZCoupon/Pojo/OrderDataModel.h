//
//  OrderDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "OrderItemDataModel.h"
#import "OrderData.h"
@interface OrderDataModel : MZJastor
@property(nonatomic ,strong)OrderData *order;
@property(nonatomic,strong)NSMutableArray *orderitems;

@end
