//
//  OrderItemDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "OrderItemData.h"
#import "OrderModifierDataModel.h"

@interface OrderItemDataModel : MZJastor
@property(nonatomic ,strong)OrderItemData *orderitem;
@property(nonatomic,strong)NSMutableArray *ordermodifiers;
@end
