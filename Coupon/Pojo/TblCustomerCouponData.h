//
//  TblCustomerCouponData.h
//  ProWallet
//
//  Created by Inforios on 04/10/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblCustomerCouponData : Jastor
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
