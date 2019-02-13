//
//  ProductOrderDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

#import "ProductOrderDtlData.h"
@interface ProductOrderDataModel : MZJastor
@property(nonatomic,strong)ProductOrderDtlData *podetail;

@end
