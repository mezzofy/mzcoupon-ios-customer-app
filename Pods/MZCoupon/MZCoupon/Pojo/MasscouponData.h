//
//  MasscouponData.h
//  Mezzofy
//
//  Created by Mezzofy on 13/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface MasscouponData : MZJastor

@property (strong, nonatomic)NSString *massId;
@property (strong, nonatomic)NSString *merchantId;
@property (strong, nonatomic)NSString *siteId;
@property (strong, nonatomic)NSString *customerId;
@property (strong, nonatomic)NSString *referenceNo;
@property (strong, nonatomic)NSString *massStatus;
@property (strong, nonatomic)NSString *updatedOn;

@end
