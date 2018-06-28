//
//  MZCouponPayment.m
//  Mezzofy
//
//  Created by Mezzofy on 17/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponPayment.h"
#import "MZUtils.h"
#import "OverCouponData.h"

@implementation MZCouponPayment
- (MZCouponProductOrderResponse *)RequestFreeCoupon:(ProductOrderListDataModel *)pproductOrder{
    MZCouponProductOrderResponse *returnvalue=[[MZCouponProductOrderResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pproductOrder toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/pos"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if(json)
            returnvalue=[[MZCouponProductOrderResponse alloc]initWithDictionary:json];
            
        [returnvalue setError:error];
    }
    return returnvalue;
}
- (MZCouponProductOrderResponse *)RequestChargeCoupons:(ProductOrderListDataModel *)pproductOrder{
    MZCouponProductOrderResponse *returnvalue=[[MZCouponProductOrderResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pproductOrder toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/pos/paypal"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if(json)
            returnvalue=[[MZCouponProductOrderResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}
- (MZCouponOverResponse *)checkProductAvilability:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt{
     MZCouponOverResponse *returnvalue=[[MZCouponOverResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:pQyt forKey:@"qty"];
        NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/pos/overcoupon/%@",pCouponId] param:reqparam];
        if(data) {
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (json)
                returnvalue=[[MZCouponOverResponse alloc]initWithDictionary:json];
                
            [returnvalue setError:error];
                
        }
        
    return returnvalue;
}
@end
