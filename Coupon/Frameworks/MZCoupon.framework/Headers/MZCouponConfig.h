//
//  Common.h
//  Mezzofy
//
//  Created by Mezzofy on 26/11/14.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MZCouponConfig : NSObject

+(void)SetupMerchantID:(NSString *)MerchantID Server:(BOOL)server AccessToken:(NSString *)ptoken AccessKey:(NSString *)pkey;
+(void)SetupCustomerID:(NSString *)pCustomerID;
+(NSString*)merchantid;
+(NSString*)getCustomerId;
+(NSString*)AccessToken;
+(NSString*)AccessKey;
+(BOOL)Server;
@end
