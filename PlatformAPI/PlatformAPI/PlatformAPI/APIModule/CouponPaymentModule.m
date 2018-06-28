//
//  CouponPaymentModule.m
//  ProWallet
//
//  Created by Inforios on 17/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CouponPaymentModule.h"
#import "Utils.h"
#import "TblOverCouponData.h"

@implementation CouponPaymentModule
- (NSString *)downloadFreeCouponFromServer:(TblProductOrderListModel *)pproductOrder{
    NSString *retval=@"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pproductOrder toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/pos"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        NSLog(@"%@",json);
        TblProductOrderListModel *objproduct=[[TblProductOrderListModel alloc]initWithDictionary:json];
        if(objproduct.po.poId){
            NSLog(@"%@",objproduct);
            retval=@"SUCCESS";
        }
        else
            retval=[json valueForKey:@"message"];
        
    }
    return retval;
}
- (TblProductOrder *)downloadChargeCouponFromServer:(TblProductOrderListModel *)pproductOrder{
    TblProductOrder *retval=[[TblProductOrder alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pproductOrder toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/pos/paypal"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        NSLog(@"%@",json);
        TblProductOrderListModel *objproduct=[[TblProductOrderListModel alloc]initWithDictionary:json];
       if(objproduct.po.poId)
           retval=objproduct.po;
        
    }
    return retval;
}
- (NSString *)checkAvalibalityInServer:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt{
    NSString *retval=@"";
        NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
        [reqparam setValue:pQyt forKey:@"qty"];

        NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/pos/overcoupon/%@",pCouponId] param:reqparam];
        if(data) {
            NSError *error;
        

            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (json){
                TblOverCouponData *objcoupon=[[TblOverCouponData alloc]initWithDictionary:json];
                if(objcoupon.couponcount)
                retval=[NSString stringWithFormat:@"%@",[objcoupon couponcount]];
                
            }
        
    }

    return retval;
}
@end
