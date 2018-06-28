//
//  MZCouponConfig.m
//  Mezzofy
//
//  Created by Mezzofy on 26/11/14.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponConfig.h"

@implementation MZCouponConfig

//static NSString* _merchtid=@"DMHA";
//static NSString* _CustomerId=@"ZHYVRS";
static NSString* _merchtid=NULL;
static NSString* _CustomerId=NULL;
static NSString* AccessToken=NULL;
static NSString* AccessKey=NULL;
static bool IsUAT=NULL;
//static NSString* _merchtid=@"BIYZ";
//static NSString* _merchtid=@"PTFH";
//BIYZ
//PTFH
+(void)SetupMerchantID:(NSString *)MerchantID Server:(BOOL)server AccessToken:(NSString *)ptoken AccessKey:(NSString *)pkey{
    IsUAT=server;
    _merchtid=MerchantID;
    AccessToken=ptoken;
    AccessKey=pkey;
}
+(void)SetupCustomerID:(NSString *)pCustomerID{
    _CustomerId=pCustomerID;
}
+(NSString*)merchantid {
    return _merchtid;
}

+(NSString*)getCustomerId{
    return _CustomerId;
}
+(NSString*)AccessToken {
    return AccessToken;
}
+(NSString*)AccessKey{
    return AccessKey;
}
+(BOOL)Server{
    return IsUAT;
}
@end
