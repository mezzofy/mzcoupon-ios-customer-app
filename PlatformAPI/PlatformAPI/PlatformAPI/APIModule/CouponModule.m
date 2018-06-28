//
//  CouponModule.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CouponModule.h"
#import "TblCustomerCouponList.h"
#import "TblCustomerCouponModel.h"
#import "Common.h"
#import "Utils.h"
#import "LoaderModule.h"
#import "TblStockModel.h"
#import "DataResponseSize.h"



@implementation CouponModule
{
    
    DataReaponseModel *objresmodel;
    
}
+ (void)getCouponListFromServerCouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [Common getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons"] param:reqparam];
    
   
    if(data){
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];
    
//    if (json) {
////        CouponDao *daocoupon=[[CouponDao alloc]init];
//        LoaderModule *modloader=[[LoaderModule alloc]init];
//        DataResponseSize *size = [[DataResponseSize alloc]initWithDictionary:json];
//        [Common dataResponse:size.size];
//        if(poffset==1)
//            [modloader updateDeleteFlagDataBeforeCallServer:@"tbl_coupon" tblcolumname:@"couponStatus" tableid:pcouponstatus];
//        TblCustomerCouponList *objcouponlist=[[TblCustomerCouponList alloc]initWithDictionary:json];
//        for(TblCustomerCouponModel *objcouponmod in objcouponlist.customercoupons){
//            TblCouponData *objcoupondata=[[TblCouponData alloc]init];
//            objcoupondata=[daocoupon getCouponDataStatus:objcouponmod.coupon.couponStatus CouponId:objcouponmod.coupon.couponId];
//            if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [daocoupon updateCouponData:objcouponmod.coupon];
//            else if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && [objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objcouponmod.coupon.couponId];
//            else
//                [daocoupon addCoupondata:objcouponmod.coupon];
//        }
//        [modloader RemoveDataFromDatabaseWithDeleteFlagtblname:@"tbl_coupon" wheretblcolumn:@"couponStatus" tableid:pcouponstatus];
//
//    }
    }
}
+ (void)getCouponCountListfromServer:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [Common getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"];
    //    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons/customercampaigns"] param:reqparam];
    NSError *error;
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
//        if (json){
//            NSDictionary *arritemres = [json objectForKey:@"size"];
//
//            LoaderModule *modloader=[[LoaderModule alloc]init];
//            [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_count"];
//            objresmodel = [[DataReaponseModel alloc]initWithDictionary:arritemres];
//
//            [Common dataResponse:objresmodel];
//
//            TblCustomerCouponList *objcouponlist=[[TblCustomerCouponList alloc]initWithDictionary:json];
//            for(TblCustomerCouponModel *tblcoupmdl in objcouponlist.customercoupons){
//                ProductDao *daoprod = [[ProductDao alloc]init];
//                TblProduct *objres = [daoprod getProductsDetail:[tblcoupmdl.campaign campaignId]];
//                if(!objres.campaignId){
//                   ProductModule *objprod=[[ProductModule alloc]init];
//                    [objprod loadProductDetailsFromServerCampaignID:[tblcoupmdl.campaign campaignId] Latitude:0.0 Longitude:0.0];
//                }
//                CouponDao *daocoupon=[[CouponDao alloc]init];
//                [daocoupon insertCouponCountByCampaigniD:tblcoupmdl.campaign.campaignId couponCount:tblcoupmdl.size];
//
//            }
//            [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_coupon_count"];
//        }
    }
}
+ (void)getCampaignCouponListFromServer:(NSString *)pcampaign CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [Common getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:pcouponstatus forKey:@"status"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/customercoupons/campaign/%@",pcampaign] param:reqparam];
    
    if(data){
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];
    
//    if (json) {
//        CouponDao *daocoupon=[[CouponDao alloc]init];
//        LoaderModule *modloader=[[LoaderModule alloc]init];
//        if(poffset==1)
//            [modloader updateDeleteFlagDataBeforeCallServer:@"tbl_coupon" tblcolumname:@"couponStatus" tableid:pcouponstatus];
//        TblCustomerCouponList *objcouponlist=[[TblCustomerCouponList alloc]initWithDictionary:json];
//        for(TblCustomerCouponModel *objcouponmod in objcouponlist.customercoupons){
//            TblCouponData *objcoupondata=[[TblCouponData alloc]init];
//            objcoupondata=[daocoupon getCouponDataStatus:objcouponmod.coupon.couponStatus CouponId:objcouponmod.coupon.couponId];
//            if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [daocoupon updateCouponData:objcouponmod.coupon];
//            else if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && [objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objcouponmod.coupon.couponId];
//            else
//                [daocoupon addCoupondata:objcouponmod.coupon];
//        }
//        [modloader RemoveDataFromDatabaseWithDeleteFlagtblname:@"tbl_coupon" wheretblcolumn:@"couponStatus" tableid:pcouponstatus];
//
//        }
    }
    
}
+ (TblCouponData *)getCouponDetailsFromServer:(NSString *)pCouponId{
    TblCouponData *objcoupondata=[[TblCouponData alloc]init];
    
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/coupons/%@",pCouponId] param:nil];
    
    if(data){
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];
    
//    if (json) {
//        CouponDao *daocoupon=[[CouponDao alloc]init];
//        LoaderModule *modloader=[[LoaderModule alloc]init];
//        TblCustomerCouponModel *objcouponmod=[[TblCustomerCouponModel alloc]initWithDictionary:json];
//            objcoupondata=[daocoupon getCouponDataStatus:objcouponmod.coupon.couponStatus CouponId:objcouponmod.coupon.couponId];
//            if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [daocoupon updateCouponData:objcouponmod.coupon];
//            else if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && [objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
//                [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objcouponmod.coupon.couponId];
//            else
//                [daocoupon addCoupondata:objcouponmod.coupon];
//
//        objcoupondata=objcouponmod.coupon;
//
//        }
    }
    return objcoupondata;
}
+ (NSString *)getCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    NSString *retval=@"";
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/campaignstock/%@",pcampaignId] param:reqparam];
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
//        if (json) {
//            TblStockModel *objstock=[[TblStockModel alloc]initWithDictionary:json];
//            if(objstock.stock)
//                retval=objstock.stock.stockqty;
//            else
//                retval=[json valueForKey:@"message"];
//
//
//        }
    }
    return retval;
}
+ (NSString *)releaseCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    NSString *retval=@"";
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/releasestock/%@",pcampaignId] param:reqparam];

    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
//        if (json) {
//            TblStockModel *objstock=[[TblStockModel alloc]initWithDictionary:json];
//            if(objstock.stock)
//                retval=objstock.stock.stockqty;
//            else
//                retval=[json valueForKey:@"message"];
//
//
//        }
    }
    return retval;

}
+ (NSString *)RedeemCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    NSString *retval=@"";
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", pCouponId] forKey:@"couponid"];
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/redeamstock/%@",pcampaignId] param:reqparam];
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
//        if (json) {
//            TblStockModel *objstock=[[TblStockModel alloc]initWithDictionary:json];
//            if(objstock.stock)
//                retval=objstock.stock.stockqty;
//            else
//                retval=[json valueForKey:@"message"];
//
//
//        }
    }
    return retval;
    
}
+ (NSString *)SendGiftCouponToPartner:(TblGiftcouponModel *)pGiftCoupon{
    NSString *retval=@"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pGiftCoupon toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/customercoupons/sharecoupon"] body:jsonData];
//    if(data){
//        NSError *error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
//        TblGiftcouponModel *objgiftcoupon=[[TblGiftcouponModel alloc]initWithDictionary:json];
//        if(objgiftcoupon.sharecoupon.customerId){
//            retval=@"SUCCESS";
//        }
//        else
//            retval=[json valueForKey:@"message"];
//
//    }
    return retval;
}


@end
