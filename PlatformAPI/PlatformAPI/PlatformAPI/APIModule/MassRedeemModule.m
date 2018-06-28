////
////  MassRedeemModule.m
////  ProWallet
////
////  Created by Inforios on 05/10/17.
////  Copyright © 2017 Thoughts Igniter. All rights reserved.
////
//
//#import "MassRedeemModule.h"
//
//@implementation MassRedeemModule
//
//- (void)LoadMassRedeemDetailByMassId:(NSString *)pMassId {
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
//    
//}
//- (void)LoadMassRedeemDetailByReferenceId:(NSString *)pReferenceId {
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
//    
//}
//- (TblMassCouponModel *)MassRedeemToServer:(TblMassCouponModel *)pMassCoupon{
//    TblMassCouponModel *objmodel=[[TblMassCouponModel alloc]init];
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pMassCoupon toDictionary] options:kNilOptions error:&error];
//    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/massredeem/"] body:jsonData];
//    if(data){
//        NSError *error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
//        
//        if(json){
//            TblMassCouponModel *objmasscouponmodel=[[TblMassCouponModel alloc]initWithDictionary:json];
//            if(objmasscouponmodel.masscoupon.referenceNo){
//                return objmasscouponmodel;
//            }
//        }
//    }
//    return objmodel;
//}
//- (TblMassCouponModel *)getMassRedeemStatusFromServer:(NSString *)pMassRefNo SiteId:(NSString *)pSiteId{
//    TblMassCouponModel *objmodel=[[TblMassCouponModel alloc]init];
//    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
//    [reqparam setValue:pSiteId forKey:@"siteid"];
//     NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/massredeem/massrefer/%@",pMassRefNo] param:reqparam];
//    if(data){
//        NSError *error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
//        
//        if(json){
//            TblMassCouponModel *objmasscouponmodel=[[TblMassCouponModel alloc]initWithDictionary:json];
//            if(objmasscouponmodel.masscoupon.referenceNo){
//                return objmasscouponmodel;
//            }
//        }
//    }
//    return objmodel;
//}
//@end

