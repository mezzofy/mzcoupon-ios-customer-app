//
//  MZNotification.m
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 15/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZNotification.h"

@implementation MZNotification
- (MZNotificationResponse *)GetNotifications:(NSUInteger)poffset {
    
    MZNotificationResponse *returnvalue=[[MZNotificationResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [MZCouponConfig getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/notificatios"]param:reqparam];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if (json)
            returnvalue=[[MZNotificationResponse alloc]initWithDictionary:json];
            
        [returnvalue setError:error];
            
        }
    
    return returnvalue;
}

@end
