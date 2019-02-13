//
//  StockData.h
//  Mezzofy
//
//  Created by Mezzofy on 14/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface StockData : MZJastor

@property(nonatomic , strong)NSString *campaignId;
@property(nonatomic , strong)NSString *stockId;
@property(nonatomic , strong)NSString *stockqty;
@end
