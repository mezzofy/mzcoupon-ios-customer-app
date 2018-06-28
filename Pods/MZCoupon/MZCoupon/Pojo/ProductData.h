//
//  ProductData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface ProductData : MZJastor

@property (nonatomic, strong) NSString *campaignId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *productmerchantId;
@property (nonatomic, strong) NSString *campaignCode;
@property (nonatomic, strong) NSString *orginalPrice;
@property (nonatomic, strong) NSString *campaignName;
@property (nonatomic, strong) NSString *campaignDesc;
@property (nonatomic, strong) NSString *sellingPrice;
@property (nonatomic, strong) NSString *campaignTc;
@property (nonatomic, strong) NSString *campaignStatus;
@property (nonatomic, strong) NSString *campaignType;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *expirydue;
@property (nonatomic, strong) NSString *dailyLimit;
@property (nonatomic, strong) NSString *packQty;
@property (nonatomic, strong) NSString *emailStaff;
@property (nonatomic, strong) NSString *couponOver;
@property (nonatomic, strong) NSString *expiryDays;
@property (nonatomic, strong) NSString *dayFilter;
@property (nonatomic, strong) NSString *fromDate;
@property (nonatomic, strong) NSString *toDate;
@property (nonatomic, strong) NSString *totalRedeem;
@property (nonatomic, strong) NSString *allocationCount;
@property (nonatomic, strong) NSString *couponUrl;
@property (nonatomic, strong) NSString *passbookUrl;
@property (nonatomic, strong) NSString *issuedcoupon;
@property (nonatomic, strong) NSString *redeemcoupon;
@property (nonatomic, strong) NSString *allocationcoupon;
@property (nonatomic, strong) NSString *campaignNote1;
@property (nonatomic, strong) NSString *campaignNote2;
@property (nonatomic, strong) NSString *campaignNote3;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *campaignUuid;
@property (nonatomic, strong) NSString *typeService;
@property (nonatomic, strong) NSString *reviewUrl;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) NSString *ratecoupon;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *createdOn;

@property (nonatomic, strong) NSString *outletDistance;
@property (nonatomic, strong) NSString *expiryname;
@property (nonatomic, strong) NSString *txBrand;
@property (nonatomic, strong) NSString *campaignRemark;
@property (nonatomic, strong) NSString *pickup;
@property (nonatomic, strong) NSString *delivery;
@property (nonatomic, strong) NSString *booking;
@property (nonatomic, strong) NSString *outcall;
@property (nonatomic, strong) NSString *dailyLimitType;
@property (nonatomic, strong) NSString *redemptionQuota;

@property (nonatomic, strong) NSArray *campaignimages;
@property (nonatomic, strong) NSArray *sites;

@end
