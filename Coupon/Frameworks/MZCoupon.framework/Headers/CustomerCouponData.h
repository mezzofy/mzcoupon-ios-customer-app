//
//  CustomerCouponData.h
//  Mezzofy
//
//  Created by Mezzofy on 04/10/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface CustomerCouponData : MZJastor
@property (nonatomic, strong) NSString *couponId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *campaignId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *couponNo;
@property (nonatomic, strong) NSString *couponStatus;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *updatedBy;
@property (nonatomic, strong) NSString *passbookUrl;
@property (nonatomic, strong) NSString *barcodeUrl;
@property (nonatomic, strong) NSString *qrcodeUrl;

@end
