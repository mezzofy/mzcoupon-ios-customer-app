//
//  OrderModifierData.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface OrderModifierData : MZJastor
@property (nonatomic, strong) NSString *orderModifierId;
@property (nonatomic, strong) NSString *orderItemId;
@property (nonatomic, strong) NSString *modifierId;
@property (nonatomic, strong) NSString *modifierName;
@end
