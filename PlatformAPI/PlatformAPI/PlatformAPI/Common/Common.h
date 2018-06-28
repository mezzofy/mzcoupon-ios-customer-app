//
//  Common.h
//  EB
//
//  Created by Kaliyarajalu on 26/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TblCustomerData.h"
#import "DataReaponseModel.h"


#define PickUp     @"P"
#define Delivery   @"D"
#define Booking    @"B"
#define OutCall    @"C"
#define Order      @"O"
#define Redeemed   @"R"


@interface Common : NSObject
//NotificationToken
+(void)deviceToken:(NSString *)ptoken;
+(NSString *)deviceToken;

+(NSString*)merchantid;

+(void)setCustomerUsername:(NSString*)pusername;
+(NSString*)getCustomerUsername;

+(void)setCustomerpassword:(NSString*)ppassword;
+(NSString*)getCustomerpassword;

+(void)setCustomerId:(NSString*)pcustomerId;
+(NSString*)getCustomerId;

+(void)setCustomertype:(NSString*)ptype;
+(NSString*)getCustomertype;

+(void)setCustomerEmailID:(NSString*)pusername;
+(NSString*)getCustomerEmailID;

+(void)dataResponse:(DataReaponseModel *)pdatares;
+(DataReaponseModel *)dataResponse;

+(NSString*)countrycode;
+(void)countrycode:(NSString *)pcountrycode;

+(NSString*)Countryname;
+(void)Countryname:(NSString *)pCountryname;

+(NSString*)hotdeals;
+(void)hotdeals:(NSString *)photdeals;



+(void)CampaignFilter:(NSString *)pCampaignFilter;
+(NSString *)CampaignFilter;

//Merchant
+(NSString*)getMerchantCurrency;
+(NSString*)getMerchantHotline;
+(NSString*)getMerchantName;
//Filter selected
+(NSMutableArray *)filterCampaignGroup;
+(void)filterCampaignGroup:(NSMutableArray *)pcampaigngroup;
+(NSMutableArray *)filterSite;
+(void)filterSite:(NSMutableArray *)psite;
@end
