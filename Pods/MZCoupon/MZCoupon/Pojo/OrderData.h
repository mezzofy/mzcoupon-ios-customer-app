//
//  OrderData.h
//  Mezzofy
//
//  Created by Mezzofy on 06/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface OrderData : MZJastor
@property (nonatomic, strong) NSString *couponId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *siteId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *customerName;
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *orderDate;
@property (nonatomic, strong) NSString *startendTime;
@property (nonatomic, strong) NSString *orderType;
@property (nonatomic, strong) NSString *orderRemark;
@property (nonatomic, strong) NSString *contactNo;
@property (nonatomic, strong) NSString *orderNo;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *orderStatus;
@property (nonatomic, strong) NSString *pushRead;
@property (nonatomic, strong) NSString *customerAddress;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *pickupDeliveryType;
@end
