//
//  MassRedeemModule.m
//  ProWallet
//
//  Created by Inforios on 05/10/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MassRedeemModule.h"

@implementation MassRedeemModule

- (void)LoadMassRedeemDetailByMassId:(NSString *)pMassId {
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/%@",pMassId] param:nil];
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
    
}
- (void)LoadMassRedeemDetailByReferenceId:(NSString *)pReferenceId {
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/massrefer/%@",pReferenceId] param:nil];
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
    
}
- (MZCouponMassRedeemResponse *)MassRedeemToServer:(MassCouponDataModel *)pMassCoupon{
    MZCouponMassRedeemResponse *objmezzofy=[[MZCouponMassRedeemResponse alloc]init];
    MZMassRedeem *objMZMassredeem=[[MZMassRedeem alloc]init];
    objmezzofy=[objMZMassredeem MassRedeemCreate:pMassCoupon];
    
    if(objmezzofy.masscoupon.referenceNo){
        return objmezzofy;
    }
    return objmezzofy;
}
- (MZCouponMassRedeemResponse *)getMassRedeemStatusFromServer:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId{
    MZCouponMassRedeemResponse *objmezzofy=[[MZCouponMassRedeemResponse alloc]init];
    MZMassRedeem *objMZMassredeem=[[MZMassRedeem alloc]init];
    
    objmezzofy=[objMZMassredeem GetMassCouponDetail:pMassRefNo SiteId:pSiteId];
    
    
    if(objmezzofy.masscoupon.referenceNo){
        return objmezzofy;
    }
    
    return objmezzofy;
}
@end
