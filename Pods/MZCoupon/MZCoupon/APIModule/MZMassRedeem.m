//
//  MZMassRedeem.m
//  Mezzofy
//
//  Created by Mezzofy on 05/10/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZMassRedeem.h"

@implementation MZMassRedeem

//- (void)LoadMassRedeemDetailByMassId:(NSString *)pMassId {
//    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/%@",pMassId] param:nil];
//    if(data){
//        NSError* error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
//
//        if (json) {
//            NSLog(@"%@",json);
//
//        }
//    }
//
//}
//- (void)LoadMassRedeemDetailByReferenceId:(NSString *)pReferenceId {
//    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/massrefer/%@",pReferenceId] param:nil];
//    if(data){
//        NSError* error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
//
//        if (json) {
//            NSLog(@"%@",json);
//
//        }
//    }
//
//}
- (MZCouponMassRedeemResponse *)MassRedeemCreate:(MassCouponDataModel *)pMassCoupon{
    MZCouponMassRedeemResponse *returnvalue=[[MZCouponMassRedeemResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pMassCoupon toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/massredeem/"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        if(json)
            returnvalue=[[MZCouponMassRedeemResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
        }
    
    return returnvalue;
}
- (MZCouponMassRedeemResponse *)GetMassCouponDetail:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId{
    MZCouponMassRedeemResponse *returnvalue=[[MZCouponMassRedeemResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:pSiteId forKey:@"siteid"];
     NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/massrefer/%@",pMassRefNo] param:reqparam];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        
        if(json)
            returnvalue=[[MZCouponMassRedeemResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    
    return returnvalue;
}
@end

