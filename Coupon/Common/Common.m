//
//  Common.m
//  EB
//
//  Created by Kaliyarajalu on 26/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "Common.h"
#import "AppDelegate.h"
#import "MerchantDao.h"
@implementation Common
static NSString* _devicetoken = NULL;
static DataReaponseDataModel* _dataResopnse = NULL;
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
    SettingsDao* dao = [[SettingsDao alloc]init];
    NSString *tempuser=[self getCustomerUsername];
    if(tempuser!=NULL&&[tempuser length]>0){
        [dao UpdateSettings:@"CustomerUsername" Value:pusername];
    }
    else
        [dao setValue:@"CustomerUsername" Value:pusername];
}

+(NSString*)getCustomerUsername{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"CustomerUsername"];
    return retval;
}

+(void)setCustomerEmailID:(NSString*)pusername{
    SettingsDao* dao = [[SettingsDao alloc]init];
    NSString *tempuser=[self getCustomerEmailID];
    if(tempuser!=NULL&&[tempuser length]>0){
        [dao UpdateSettings:@"CustomerEmailID" Value:pusername];
    }
    else
        [dao setValue:@"CustomerEmailID" Value:pusername];
}

+(NSString*)getCustomerEmailID{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"CustomerEmailID"];
    return retval;
}

+(void)setCustomerpassword:(NSString*)ppassword{
    SettingsDao* dao = [[SettingsDao alloc]init];
    NSString *tempuser=[self getCustomerpassword];
    if(tempuser!=NULL&&[tempuser length]>0){
        [dao UpdateSettings:@"CustomerPassword" Value:ppassword];
    }
    else
        [dao setValue:@"CustomerPassword" Value:ppassword];
}
+(NSString*)getCustomerpassword{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"CustomerPassword"];
    return retval;

}

+(void)setCustomertype:(NSString*)ptype{
    SettingsDao* dao = [[SettingsDao alloc]init];
    NSString *tempuser=[self getCustomertype];
    if(tempuser!=NULL&&[tempuser length]>0){
        [dao UpdateSettings:@"CustomerType" Value:ptype];
    }
    else
        [dao setValue:@"CustomerType" Value:ptype];
}

+(NSString*)getCustomertype{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"CustomerType"];
    return retval;

}
+(void)setCustomerId:(NSString*)pcustomerId{
    SettingsDao* dao = [[SettingsDao alloc]init];
    NSString *tempuser=[self getCustomerId];
    if(tempuser!=NULL&&[tempuser length]>0){
        [dao UpdateSettings:@"CustomerId" Value:pcustomerId];
    }
    else
        [dao setValue:@"CustomerId" Value:pcustomerId];
}
+(NSString*)getCustomerId{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"CustomerId"];
    return retval;
}
+(NSString*)getMerchantCurrency{
//      countryCode ,merchantId ,merchantCode ,merchantType , ,merchantDesc ,merchantLogourl ,merchantImageurl ,merchantTc ,hashCode ,profileStatus ,merchantStatus ,merchantTimezone ,merchantEmail ,countryName ,channelCode ,
    NSString* retval;
    MerchantDao* dao = [[MerchantDao alloc]init];
    retval = [dao getMerchantValue:@"currency"];
    return retval;
}
+(NSString*)getMerchantHotline{
    NSString* retval;
    MerchantDao* dao = [[MerchantDao alloc]init];
    retval = [dao getMerchantValue:@"merchantHotline"];
    return retval;
}
+(NSString*)getMerchantName{
    NSString* retval;
    MerchantDao* dao = [[MerchantDao alloc]init];
    retval = [dao getMerchantValue:@"merchantName"];
    return retval;
}
+(NSString*)getMerchantEmail{
    NSString* retval;
    MerchantDao* dao = [[MerchantDao alloc]init];
    retval = [dao getMerchantValue:@"merchantEmail"];
    return retval;
}
+(NSString*)getMerchantID{
    NSString* retval;
    SettingsDao* dao = [[SettingsDao alloc]init];
    retval = [dao getValue:@"MerchantID"];
    return retval;
}
+(void)dataResponse:(DataReaponseDataModel *)pdatares {
    _dataResopnse = pdatares;
}
+(DataReaponseDataModel *)dataResponse {
    return _dataResopnse;
}

+(NSString*)hotdeals{
    return _hotdeals;
}
+(void)hotdeals:(NSString *)photdeals{
    _hotdeals=photdeals;
}




+(UIActivityView*)getActivityViewerwithTitle:(NSString *)title {
    [Common ActivityTitle:title];
    UIActivityView *activityView;
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIWindow *window = delegate.window;
    activityView = [[UIActivityView alloc] initWithFrame: CGRectMake(0, 0, window.bounds.size.width, window.bounds.size.height)];
    activityView.active = true;
    return activityView;
}

+(void)showActivityViewer:(UIActivityView *)activityView {
    
    if(activityView.active == false)
        return;
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    UIWindow *window = delegate.window;
    activityView.backgroundColor = [UIColor blackColor];
    activityView.alpha = 0.5;
    
    UIActivityIndicatorView *activityWheel = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(window.bounds.size.width / 2 - 12, window.bounds.size.height / 2 - 150, 24, 24)];
    activityWheel.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    activityWheel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                      UIViewAutoresizingFlexibleRightMargin |
                                      UIViewAutoresizingFlexibleTopMargin |
                                      UIViewAutoresizingFlexibleBottomMargin);
    [activityView addSubview:activityWheel];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UILabel *progressLabel = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth-300)/2, (screenHeight/2)-115, 300, 25)];
    progressLabel.textColor = [UIColor whiteColor];
    progressLabel.backgroundColor = [UIColor clearColor];
    progressLabel.textAlignment = NSTextAlignmentCenter;
    progressLabel.text = [Common ActivityTitle];
    [activityView addSubview:progressLabel];
    
    [window addSubview: activityView];
    
    [[[activityView subviews] objectAtIndex:0] startAnimating];
}

+(NSString*)ActivityTitle {
    return _ActivityTitle;
}
+(void)ActivityTitle:(NSString *)ptitle {
    _ActivityTitle=ptitle;
}

+(void)hideActivityViewer:(UIActivityView*)activityView {
    [Common ActivityTitle:@""];
    activityView.active = false;
    
    if(activityView!=NULL){
        if([activityView.subviews count] > 0){
            [[[activityView subviews] objectAtIndex:0] stopAnimating];
        }
        [activityView removeFromSuperview];
    }
    activityView = nil;
}


@end
