//
//  OrderItemData.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface OrderItemData : MZJastor
@property (nonatomic, strong) NSString *orderItemId;
@property (nonatomic, strong) NSString *couponId;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *groupName;
@end
