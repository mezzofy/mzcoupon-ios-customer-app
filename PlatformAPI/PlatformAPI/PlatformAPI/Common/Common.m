//
//  Common.m
//  EB
//
//  Created by Kaliyarajalu on 26/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "Common.h"

@implementation Common
static NSString* _devicetoken = NULL;
static DataReaponseModel* _dataResopnse = NULL;
static NSString* _ActivityTitle = NULL;
static NSString* _countrycode = NULL;
static NSString* _Countryname = NULL;
static NSString* _hotdeals =NULL;
static NSString* _CampaignFilter =NULL;
static  NSMutableArray*_selectcampaigngroup = NULL;
static  NSMutableArray*_selectsitelist = NULL;
static NSString* _merchtid=@"DMHA";
//static NSString* _merchtid=@"BIYZ";
//static NSString* _merchtid=@"PTFH";
//BIYZ
//PTFH
+(void)deviceToken:(NSString *)ptoken {
    _devicetoken = ptoken;
}
+(NSString *)deviceToken {
    return _devicetoken;
}
+(void)CampaignFilter:(NSString *)pCampaignFilter {
    _CampaignFilter = pCampaignFilter;
}
+(NSString *)CampaignFilter {
    return _CampaignFilter;
}
+(NSMutableArray *)filterCampaignGroup{
    return _selectcampaigngroup;
}
+(void)filterCampaignGroup:(NSMutableArray *)pcampaigngroup{
    _selectcampaigngroup=pcampaigngroup;
}
+(NSMutableArray *)filterSite{
    return _selectsitelist;
}
+(void)filterSite:(NSMutableArray *)psite{
    _selectsitelist=psite;
}
+(NSString*)merchantid {
    return _merchtid;
}

+(NSString*)countrycode {
    return _countrycode;
}
+(void)countrycode:(NSString *)pcountrycode {
    _countrycode=pcountrycode;
}

+(NSString*)Countryname {
    return _Countryname;
}
+(void)Countryname:(NSString *)pCountryname{
    _Countryname=pCountryname;
}


+(void)setCustomerUsername:(NSString*)pusername{
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    NSString *tempuser=[self getCustomerUsername];
//    if(tempuser!=NULL&&[tempuser length]>0){
//        [dao UpdateSettings:@"CustomerUsername" Value:pusername];
//    }
//    else
//        [dao setValue:@"CustomerUsername" Value:pusername];
}

+(NSString*)getCustomerUsername{
    NSString* retval;
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    retval = [dao getValue:@"CustomerUsername"];
    return retval;
}

+(void)setCustomerEmailID:(NSString*)pusername{
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    NSString *tempuser=[self getCustomerEmailID];
//    if(tempuser!=NULL&&[tempuser length]>0){
//        [dao UpdateSettings:@"CustomerEmailID" Value:pusername];
//    }
//    else
//        [dao setValue:@"CustomerEmailID" Value:pusername];
}

+(NSString*)getCustomerEmailID{
    NSString* retval;
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    retval = [dao getValue:@"CustomerEmailID"];
    return retval;
}

+(void)setCustomerpassword:(NSString*)ppassword{
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    NSString *tempuser=[self getCustomerpassword];
//    if(tempuser!=NULL&&[tempuser length]>0){
//        [dao UpdateSettings:@"CustomerPassword" Value:ppassword];
//    }
//    else
//        [dao setValue:@"CustomerPassword" Value:ppassword];
}
+(NSString*)getCustomerpassword{
    NSString* retval;
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    retval = [dao getValue:@"CustomerPassword"];
    return retval;

}

+(void)setCustomertype:(NSString*)ptype{
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    NSString *tempuser=[self getCustomertype];
//    if(tempuser!=NULL&&[tempuser length]>0){
//        [dao UpdateSettings:@"CustomerType" Value:ptype];
//    }
//    else
//        [dao setValue:@"CustomerType" Value:ptype];
}

+(NSString*)getCustomertype{
    NSString* retval;
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    retval = [dao getValue:@"CustomerType"];
    return retval;

}
+(void)setCustomerId:(NSString*)pcustomerId{
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    NSString *tempuser=[self getCustomerId];
//    if(tempuser!=NULL&&[tempuser length]>0){
//        [dao UpdateSettings:@"CustomerId" Value:pcustomerId];
//    }
//    else
//        [dao setValue:@"CustomerId" Value:pcustomerId];
}
+(NSString*)getCustomerId{
    NSString* retval;
//    SettingsDao* dao = [[SettingsDao alloc]init];
//    retval = [dao getValue:@"CustomerId"];
    return retval;
}
+(NSString*)getMerchantCurrency{
//      countryCode ,merchantId ,merchantCode ,merchantType , ,merchantDesc ,merchantLogourl ,merchantImageurl ,merchantTc ,hashCode ,profileStatus ,merchantStatus ,merchantTimezone ,merchantEmail ,countryName ,channelCode ,
    NSString* retval;
//    MerchantDao* dao = [[MerchantDao alloc]init];
//    retval = [dao getMerchantValue:@"currency"];
    return retval;
}
+(NSString*)getMerchantHotline{
    NSString* retval;
//    MerchantDao* dao = [[MerchantDao alloc]init];
//    retval = [dao getMerchantValue:@"merchantHotline"];
    return retval;
}
+(NSString*)getMerchantName{
    NSString* retval;
//    MerchantDao* dao = [[MerchantDao alloc]init];
//    retval = [dao getMerchantValue:@"merchantName"];
    return retval;
}

+(void)dataResponse:(DataReaponseModel *)pdatares {
    _dataResopnse = pdatares;
}
+(DataReaponseModel *)dataResponse {
    return _dataResopnse;
}

+(NSString*)hotdeals{
    return _hotdeals;
}
+(void)hotdeals:(NSString *)photdeals{
    _hotdeals=photdeals;
}













@end
