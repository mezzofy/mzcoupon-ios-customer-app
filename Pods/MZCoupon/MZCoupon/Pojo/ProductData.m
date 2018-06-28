//
//  ProductData.m
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "ProductData.h"
#import "CampaignGroupDtlData.h"
#import "CampaignImageListDataModel.h"
#import "CampaignSiteListDataModel.h"

@implementation ProductData
@synthesize campaignId;
@synthesize merchantId;
@synthesize productId;
@synthesize productmerchantId;
@synthesize campaignCode;
@synthesize orginalPrice;
@synthesize campaignName;
@synthesize campaignDesc;
@synthesize sellingPrice;
@synthesize campaignTc;
@synthesize campaignStatus;
@synthesize campaignType;
@synthesize brand;
@synthesize expirydue;
@synthesize dailyLimit;
@synthesize packQty;
@synthesize emailStaff;
@synthesize couponOver;
@synthesize expiryDays;
@synthesize dayFilter;
@synthesize fromDate;
@synthesize toDate;
@synthesize totalRedeem;
@synthesize allocationCount;
@synthesize couponUrl;
@synthesize passbookUrl;
@synthesize issuedcoupon;
@synthesize redeemcoupon;
@synthesize allocationcoupon;
@synthesize campaignNote1;
@synthesize campaignNote2;
@synthesize campaignNote3;
@synthesize distance;
@synthesize campaignUuid;
@synthesize typeService;
@synthesize reviewUrl;
@synthesize videoUrl;
@synthesize startDate;
@synthesize endDate;
@synthesize ratecoupon;
@synthesize hashCode;
@synthesize createdOn;

@synthesize outletDistance;
@synthesize expiryname;
@synthesize txBrand;
@synthesize campaignRemark;
@synthesize pickup;
@synthesize delivery;
@synthesize booking;
@synthesize outcall;
@synthesize dailyLimitType;
@synthesize redemptionQuota;

@synthesize campaignimages;
@synthesize sites;


+ (Class)campaignimages_class {
    return [CampaignImageListDataModel class];
}
+ (Class)sites_class {
    return [CampaignSiteListDataModel class];
}

@end
