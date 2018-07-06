//
//  TblOrderData.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblOrderData : Jastor
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
