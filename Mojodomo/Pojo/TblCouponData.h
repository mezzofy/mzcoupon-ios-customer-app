//
//  TblCouponData.h
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblCouponData : Jastor
@property (nonatomic, strong) NSString *couponId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *allocationId;
@property (nonatomic, strong) NSString *campaignId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *campaignCode;
@property (nonatomic, strong) NSString *couponNo;
@property (nonatomic, strong) NSString *purchaseDate;
@property (nonatomic, strong) NSString *redeemDate;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) NSString *couponName;
@property (nonatomic, strong) NSString *couponStatus;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *productNote1;
@property (nonatomic, strong) NSString *productNote2;
@property (nonatomic, strong) NSString *productNote3;
@property (nonatomic, strong) NSString *sellingPrice;
@property (nonatomic, strong) NSString *orginalPrice;
@property (nonatomic, strong) NSString *productDesc;
@property (nonatomic, strong) NSString *productImageurl;
@property (nonatomic, strong) NSString *delflag;

//local REF
@property (nonatomic, strong) NSString *productmerchantId;
@property (nonatomic, strong) NSString *campaignName;
@property (nonatomic, strong) NSString *campaignDesc;
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
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *typeService;
@property (nonatomic, strong) NSString *reviewUrl;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *ratecoupon;

@property (nonatomic, strong) NSString *referEmail;
@property (nonatomic, strong) NSString *track;
@property (nonatomic, strong) NSString *orderType;
@property (nonatomic, strong) NSString *orderNo;

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

@property (nonatomic, strong) NSString *size;
@end
