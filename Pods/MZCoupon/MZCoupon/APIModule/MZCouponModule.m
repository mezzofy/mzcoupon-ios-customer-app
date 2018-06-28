//
//  MZCoupon.m
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCouponModule.h"
#import "CustomerCouponListDataModel.h"
#import "CustomerCouponDataModel.h"
#import "MZCouponConfig.h"
#import "MZUtils.h"
#import "StockDataModel.h"
#import "DataResponseSizeData.h"



@implementation MZCouponModule


- (MZCouponResponse * )getCoupons:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    MZCouponResponse *returnvalue=[[MZCouponResponse alloc]init];
    
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@",[MZCouponConfig getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"]; // Active Coupon=A INCATIVE Coupon=I
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons"] param:reqparam];
    NSError* error;
    if(data){
        NSDictionary *json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if (json)
            returnvalue=[[MZCouponResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return  returnvalue;
}

- (MZCouponResponse *)getCouponByStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    MZCouponResponse *returnvalue=[[MZCouponResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [MZCouponConfig getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"];
    //    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons/customercampaigns"] param:reqparam];
    NSError *error;
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue=[[MZCouponResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return  returnvalue;
}
- (MZCouponResponse *)getCouponsByCampaign:(NSString *)pcampaign CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    MZCouponResponse *returnvalue=[[MZCouponResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [MZCouponConfig getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons/campaign/%@",pcampaign] param:reqparam];
    NSError *error;
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue=[[MZCouponResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return  returnvalue;
    
}
- (MZCouponSizeResponse *)getCouponById:(NSString *)pCouponId{
    MZCouponSizeResponse *returnvalue=[[MZCouponSizeResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/coupons/%@",pCouponId] param:nil];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if (json)
            returnvalue=[[MZCouponSizeResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}

- (MZCouponStockResponse *)getredeamstockfromserver:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    MZCouponStockResponse *returnvalue=[[MZCouponStockResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/redeamstock/%@",pcampaignId] param:reqparam];
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if (json)
            returnvalue=[[MZCouponStockResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}
- (MZCouponGiftResponse *)SendGiftCoupon:(GiftcouponDataModel *)pGiftCoupon
{
    MZCouponGiftResponse *returnvalue=[[MZCouponGiftResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pGiftCoupon toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/customercoupons/sharecoupon"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCouponGiftResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
        
    }
    return returnvalue;
}


- (MZCouponStockResponse *)getCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    MZCouponStockResponse *returnvalue=[[MZCouponStockResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/campaignstock/%@",pcampaignId] param:reqparam];
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if (json)
            returnvalue=[[MZCouponStockResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}
- (MZCouponStockResponse *)ReleaseCouponStockByCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    MZCouponStockResponse *returnvalue=[[MZCouponStockResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/releasestock/%@",pcampaignId] param:reqparam];
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if (json)
            returnvalue=[[MZCouponStockResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}

@end
