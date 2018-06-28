//
//  GiftcouponData.h
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface GiftcouponData : MZJastor
@property (nonatomic, strong)NSString *couponId;
@property (nonatomic, strong)NSString *email;
@property (nonatomic, strong)NSString *notes;
@property (nonatomic, strong)NSString *customerId;
@end
