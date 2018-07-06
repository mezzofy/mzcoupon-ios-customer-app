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
#import "SettingsDao.h"
#import "DataReaponseModel.h"
#import "UIActivityView.h"
#import <MZCoupon/MZCoupon.h>

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

+(void)dataResponse:(DataReaponseDataModel *)pdatares;
+(DataReaponseDataModel *)dataResponse;

+(NSString*)countrycode;
+(void)countrycode:(NSString *)pcountrycode;

+(NSString*)Countryname;
+(void)Countryname:(NSString *)pCountryname;

+(NSString*)hotdeals;
+(void)hotdeals:(NSString *)photdeals;

+(UIActivityView*)getActivityViewerwithTitle:(NSString *)title;
+(void)showActivityViewer:(UIActivityView*)activityView;
+(void)hideActivityViewer:(UIActivityView*)activityView;
+(NSString*)ActivityTitle;
+(void)ActivityTitle:(NSString *)ptitle;

+(void)CampaignFilter:(NSString *)pCampaignFilter;
+(NSString *)CampaignFilter;

//Merchant
+(NSString*)getMerchantCurrency;
+(NSString*)getMerchantHotline;
+(NSString*)getMerchantName;
+(NSString*)getMerchantEmail;
//Filter selected
+(NSMutableArray *)filterCampaignGroup;
+(void)filterCampaignGroup:(NSMutableArray *)pcampaigngroup;
+(NSMutableArray *)filterSite;
+(void)filterSite:(NSMutableArray *)psite;
@end
