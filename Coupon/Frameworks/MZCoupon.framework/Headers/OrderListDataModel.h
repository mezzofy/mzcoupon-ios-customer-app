//
//  OrderListDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "OrderDataModel.h"
#import "DataResponseSizeData.h"
@interface OrderListDataModel : MZJastor
@property(nonatomic,strong)NSMutableArray *orders;
@property(nonatomic ,strong)DataResponseSizeData *size;
@end
