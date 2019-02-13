//
//  MassCouponDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 13/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "MassCouponDetailDataModel.h"
#import "MasscouponData.h"

@interface MassCouponDataModel : MZJastor
@property (strong , nonatomic)MasscouponData *masscoupon;
@property (strong , nonatomic)NSMutableArray *masscoupondtls;

@end
