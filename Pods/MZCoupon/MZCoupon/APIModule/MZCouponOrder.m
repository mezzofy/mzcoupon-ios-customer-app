//
//  MZCouponOrder.m
//  Mezzofy
//
//  Created by Mezzofy on 13/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponOrder.h"
#import "OrderListDataModel.h"

@implementation MZCouponOrder
- (MZCouponOrderListResponse *)GetCouponOrder:(NSUInteger)poffset{
    MZCouponOrderListResponse *returnvalue=[[MZCouponOrderListResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@",[MZCouponConfig getCustomerId] ] forKey:@"customerid"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders"] param:reqparam];
    
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if (json)
            returnvalue=[[MZCouponOrderListResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}


- (MZCouponOrderResponse *)CreateCouponOrder:(OrderDataModel *)pOrderCoupon{
    MZCouponOrderResponse *returnvalue=[[MZCouponOrderResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pOrderCoupon toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/orders/"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if(json)
            returnvalue=[[MZCouponOrderResponse alloc]initWithDictionary:json];

        [returnvalue setError:error];
    }
    return returnvalue;
}

- (MZCouponOrderResponse *)TrackCouponOrder:(NSString *)pCouponId{
    MZCouponOrderResponse *returnvalue=[[MZCouponOrderResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/ordertrack/%@",pCouponId] param:nil];
    if(data) {
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCouponOrderResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}
- (MZCouponOrderResponse *)GetCouponOrderById:(NSString *)pCouponId{
    MZCouponOrderResponse *returnvalue=[[MZCouponOrderResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/%@",pCouponId] param:nil];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        
        if(json)
            returnvalue=[[MZCouponOrderResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
return returnvalue;
}
-(MZCouponSiteResponse *)CheckSitePass:(NSString *)pSitepass{
    MZCouponSiteResponse *returnvalue=[[MZCouponSiteResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/sites/sitepass/%@",pSitepass] param:nil];
    if(data) {
        NSError *error;
        
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue=[[MZCouponSiteResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    
    }
    
    return returnvalue;
}


@end
