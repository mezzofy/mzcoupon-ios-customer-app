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
#import "CouponDao.h"
#import "ProductDao.h"
#import "TblStockModel.h"
#import "ProductModule.h"
#import "DataResponseSize.h"


@implementation CouponModule
- (void)getCouponListFromServerCouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    MZCouponModule *objcoupon=[[MZCouponModule alloc]init];
    MZCouponResponse *objcouponresponse=[[MZCouponResponse alloc]init];
    objcouponresponse=[objcoupon getCoupons:[Common getCustomerId] CouponStatus: pcouponstatus Offset:poffset];
    CouponDao *daocoupon=[[CouponDao alloc]init];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    [Common dataResponse:objcouponresponse.size];
    if(poffset==1)
        [modloader updateDeleteFlagDataBeforeCallServer:@"tbl_coupon" tblcolumname:@"couponStatus" tableid:pcouponstatus];
    TblCustomerCouponList *objcouponlist=[[TblCustomerCouponList alloc]init];
    objcouponlist.customercoupons=[objcouponresponse customercoupons];
    for(TblCustomerCouponModel *objcouponmod in objcouponlist.customercoupons){
        TblCouponData *objcoupondata=[[TblCouponData alloc]init];
        objcoupondata=[daocoupon getCouponDataStatus:objcouponmod.coupon.couponStatus CouponId:objcouponmod.coupon.couponId];
        if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
            [daocoupon updateCouponData:objcouponmod.coupon];
        else if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && [objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
            [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objcouponmod.coupon.couponId];
        else
            [daocoupon addCoupondata:objcouponmod.coupon];
    }
    [modloader RemoveDataFromDatabaseWithDeleteFlagtblname:@"tbl_coupon" wheretblcolumn:@"couponStatus" tableid:pcouponstatus];
    
    
    
}
- (void)getCouponCountListfromServer:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    
    
    MZCouponModule *objMZCoupon=[[MZCouponModule alloc]init];
    MZCouponResponse *objmezzofy=[[MZCouponResponse alloc]init];
    objmezzofy=[objMZCoupon getCouponByStatus:[Common getCustomerId] CouponStatus:pcouponstatus Offset:poffset];
    
    LoaderModule *modloader=[[LoaderModule alloc]init];
    [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_count"];
    
    
    [Common dataResponse:objmezzofy.size];
    
    TblCustomerCouponList *objcouponlist=[[TblCustomerCouponList alloc]init];
    objcouponlist.customercoupons=[objmezzofy customercoupons];
    for(TblCustomerCouponModel *tblcoupmdl in objcouponlist.customercoupons){
        ProductDao *daoprod = [[ProductDao alloc]init];
        TblProduct *objres = [daoprod getProductsDetail:[tblcoupmdl.campaign campaignId]];
        if(!objres.campaignId){
            ProductModule *objprod=[[ProductModule alloc]init];
            [objprod loadProductDetailsFromServerCampaignID:[tblcoupmdl.campaign campaignId] Latitude:0.0 Longitude:0.0];
        }
        CouponDao *daocoupon=[[CouponDao alloc]init];
        [daocoupon insertCouponCountByCampaigniD:tblcoupmdl.campaign.campaignId couponCount:tblcoupmdl.size];
        
    }
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_coupon_count"];
}
- (void)getCampaignCouponListFromServer:(NSString *)pcampaign CouponStatus:(NSString *)pcouponstatus Offset:(NSUInteger)poffset{
    
    
    MZCouponModule *objMZCoupon=[[MZCouponModule alloc]init];
    MZCouponResponse *objmezzofy=[[MZCouponResponse alloc]init];
    objmezzofy=[objMZCoupon getCouponsByCampaign:pcampaign Customer:[Common getCustomerId] CouponStatus:pcouponstatus Offset:poffset];
    CouponDao *daocoupon=[[CouponDao alloc]init];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if(poffset==1)
        [modloader updateDeleteFlagDataBeforeCallServer:@"tbl_coupon" tblcolumname:@"couponStatus" tableid:pcouponstatus];
    for(TblCustomerCouponModel *objcouponmod in objmezzofy.customercoupons){
        TblCouponData *objcoupondata=[[TblCouponData alloc]init];
        objcoupondata=[daocoupon getCouponDataStatus:objcouponmod.coupon.couponStatus CouponId:objcouponmod.coupon.couponId];
        if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
            [daocoupon updateCouponData:objcouponmod.coupon];
        else if([objcouponmod.coupon.couponId isEqualToString:objcoupondata.couponId] && [objcouponmod.coupon.hashCode isEqualToString:objcoupondata.hashCode])
            [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objcouponmod.coupon.couponId];
        else
            [daocoupon addCoupondata:objcouponmod.coupon];
    }
    [modloader RemoveDataFromDatabaseWithDeleteFlagtblname:@"tbl_coupon" wheretblcolumn:@"couponStatus" tableid:pcouponstatus];
    
    
}
- (TblCouponData *)getCouponDetailsFromServer:(NSString *)pCouponId{
    
    MZCouponModule *MZobjcoupon=[[MZCouponModule alloc]init];
    MZCouponSizeResponse *objmezzofy=[[MZCouponSizeResponse alloc]init];
    objmezzofy=[MZobjcoupon getCouponById:pCouponId];
    CouponDao *daocoupon=[[CouponDao alloc]init];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    
    TblCouponData *objcoupondata=[[TblCouponData alloc]init];
    objcoupondata=[daocoupon getCouponDataStatus:objmezzofy.coupon.couponStatus CouponId:objmezzofy.coupon.couponId];
    if([objmezzofy.coupon.couponId isEqualToString:objcoupondata.couponId] && ![objmezzofy.coupon.hashCode isEqualToString:objcoupondata.hashCode])
        [daocoupon updateCouponDataPlatform:objmezzofy.coupon];
    else if([objmezzofy.coupon.couponId isEqualToString:objcoupondata.couponId] && [objmezzofy.coupon.hashCode isEqualToString:objcoupondata.hashCode])
        [modloader updateFlagDataFromServer:@"tbl_coupon" flagname:@"delflag" flagvalue:@"N" tblindex:@"couponId" tblvalue:objmezzofy.coupon.couponId];
    else
        [daocoupon addCoupondataPlatform:objmezzofy.coupon];
    
    objcoupondata=[daocoupon getCouponDataStatus:objmezzofy.coupon.couponStatus CouponId:objmezzofy.coupon.couponId];
    
    return objcoupondata;
}
- (NSString *)getCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    NSString *retval=@"";
    MZCouponModule *MZobjcoupon=[[MZCouponModule alloc]init];
    MZCouponStockResponse *objmezzofy=[[MZCouponStockResponse alloc]init];
    objmezzofy =[MZobjcoupon getCouponStockDetailsFromServerCampaignId:pcampaignId couponId:pCouponId];
    if(objmezzofy.stock)
        retval=objmezzofy.stock.stockqty;
    else
        retval=[objmezzofy message];
    
    return retval;
}
- (NSString *)releaseCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    NSString *retval=@"";
    MZCouponModule *MZobjcoupon=[[MZCouponModule alloc]init];
    MZCouponStockResponse *objmezzofy=[[MZCouponStockResponse alloc]init];
    objmezzofy =[MZobjcoupon ReleaseCouponStockByCampaignId:pcampaignId couponId:pCouponId];
    if(objmezzofy.stock)
        retval=objmezzofy.stock.stockqty;
    else
        retval=[objmezzofy message];

    return retval;
    
}
- (NSString *)RedeemCouponStockDetailsFromServerCampaignId:(NSString *)pcampaignId couponId:(NSString *)pCouponId{
    
    NSString *retval=@"";
    MZCouponModule *MZobjcoupon=[[MZCouponModule alloc]init];
    MZCouponStockResponse *objmezzofy=[[MZCouponStockResponse alloc]init];
    
    objmezzofy=[MZobjcoupon getredeamstockfromserver:pcampaignId couponId:pCouponId];
    if(objmezzofy.stock)
        retval=objmezzofy.stock.stockqty;
    else
        retval=[objmezzofy message];
    return retval;
    
}
- (NSString *)SendGiftCouponToPartner:(GiftcouponDataModel *)pGiftCoupon{
    NSString *retval=@"";
    
    MZCouponModule *MZobjcoupon=[[MZCouponModule alloc]init];
    MZCouponGiftResponse *objmezzofy=[[MZCouponGiftResponse alloc]init];
    objmezzofy=[MZobjcoupon SendGiftCoupon:pGiftCoupon];
    if(objmezzofy.sharecoupon.customerId){
        retval=@"SUCCESS";
    }
    else
        retval=[objmezzofy message];
    
    
    return retval;
}

- (TblProduct *)getCampaignWithCouponCountByOffset:(NSInteger)poffset{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getCampaignWithCouponCountByOffset:poffset];
}
- (NSInteger)getCampaigncountWithCouponCount{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getCampaigncountWithCouponCount];
}
- (TblCouponData *)getCampaignWithCouponType:(NSString *)ptype ByOffset:(NSInteger)poffset{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getCampaignWithCouponType:ptype ByOffset:poffset];
}
- (NSInteger)getCampaigncountWithCouponType:(NSString *)ptype{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getCampaigncountWithCouponType:ptype];
}
- (TblCouponData *)getActiveCouponCampaignId:(NSString *)pCampaignid ByOffset:(NSInteger)poffset{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getActiveCouponCampaignId:pCampaignid ByOffset:poffset];
}
- (NSInteger)getActiveCouponCampaignId:(NSString *)pCampaignid{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getActiveCouponCampaignId:pCampaignid];
}
- (TblCouponData *)getCouponDetailsWhereCouponId:(NSString *)pcouponid{
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getCouponDetailsWhereCouponId:pcouponid];
}

- (NSMutableArray *)getMyCouponBySite:(NSString *)psite {
    CouponDao *daocoupon=[[CouponDao alloc]init];
    return [daocoupon getMyCouponBySite:psite];
}

@end
