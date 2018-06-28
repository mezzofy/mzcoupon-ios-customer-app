//
//  CouponOrderModule.m
//  ProWallet
//
//  Created by Inforios on 13/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CouponOrderModule.h"
#import "LoaderModule.h"
#import "TblOrderListModel.h"

@implementation CouponOrderModule
- (void)getCouponOrderListFromServer:(NSUInteger)poffset{
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@",[Common getCustomerId] ] forKey:@"customerid"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders"] param:reqparam];
    
    
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
//        if (json) {
//            CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
//            LoaderModule *modloader=[[LoaderModule alloc]init];
//            if(poffset==1){
//                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order"];
//                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order_item"];
//                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order_modifier"];
//            }
//            TblOrderListModel *objorderlist=[[TblOrderListModel alloc]initWithDictionary:json];
//
//            for(TblOrderModel *objorder in objorderlist.orders){
//                TblOrderData *objorderdata=[[TblOrderData alloc]init];
//                objorderdata=[daoorder getCouponOrderData:objorder.order.couponId];
//                if([objorder.order.couponId isEqualToString:objorderdata.couponId] && ![objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                    [daoorder updateCouponOrderData:objorder.order];
//                else if([objorder.order.couponId isEqualToString:objorderdata.couponId] && [objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                    [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objorder.order.couponId];
//                else
//                    [daoorder addCouponOrderdata:objorder.order];
//
//
//                for (TblOrderItemModel *modorderitem in objorder.orderitems){
//                    TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
//                    orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
//                    if(orderitemdata.orderItemId)
//                        [daoorder updateCouponOrderItem:modorderitem.orderitem];
//                    else
//                        [daoorder addCouponOrderItem:modorderitem.orderitem];
//
//                    for (TblOrderModifierModel *modordermodifier in modorderitem.ordermodifiers){
//                        TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
//
//                        ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
//
//
//                        if(ordermodifierdata.modifierId)
//                            [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
//                        else
//                            [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
//
//                    }
//                }
//            }
//            [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_coupon_order"];
//
//        }
    }
}


- (NSString *)OrderCouponToServer:(TblOrderModel *)pOrderCoupon{
    NSString *retval=@"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pOrderCoupon toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/orders/"] body:jsonData];
//    if(data){
//        NSError *error;
//        NSDictionary* json = [NSJSONSerialization
//                              JSONObjectWithData:data
//                              options:kNilOptions
//                              error:&error];
////        NSLog(@"%@",json);
//        CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
//        LoaderModule *modloader=[[LoaderModule alloc]init];
//        TblOrderModel *objorder=[[TblOrderModel alloc]initWithDictionary:json];
//        if(objorder.order.orderNo){
//            TblOrderModel *objorder=[[TblOrderModel alloc]initWithDictionary:json];
//            TblOrderData *objorderdata=[[TblOrderData alloc]init];
//            objorderdata=[daoorder getCouponOrderData:objorder.order.couponId];
//            if([objorder.order.couponId isEqualToString:objorderdata.couponId] && ![objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                [daoorder updateCouponOrderData:objorder.order];
//            else if([objorder.order.couponId isEqualToString:objorderdata.couponId] && [objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objorder.order.couponId];
//            else
//                [daoorder addCouponOrderdata:objorder.order];
//
//            for (TblOrderItemModel *modorderitem in objorder.orderitems){
//                TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
//                orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
//                if(orderitemdata.orderItemId)
//                    [daoorder updateCouponOrderItem:modorderitem.orderitem];
//                else
//                    [daoorder addCouponOrderItem:modorderitem.orderitem];
//
//                for (TblOrderModifierModel *modordermodifier in modorderitem.ordermodifiers){
//                    TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
//
//                    ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
//
//
//                    if(ordermodifierdata.modifierId)
//                        [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
//                    else
//                        [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
//
//                }
//            }
//            retval=@"SUCCESS";
//        }
//        else
//            retval=[json valueForKey:@"message"];
//
//    }
    return retval;
}

- (NSString *)getOrderTrackFromServer:(NSString *)pCouponId{
    NSString *retval=@"";
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/ordertrack/%@",pCouponId] param:nil];
    if(data) {
        NSError *error;
        
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
//        if (json){
//            TblOrderModel *objorder=[[TblOrderModel alloc]initWithDictionary:json];
//            if(objorder.order.orderNo)
//                retval=[NSString stringWithFormat:@"%@",objorder.order.orderNo];
//
//        }
        
    }
    
    return retval;
}
- (void)getCouponOrderDetailsFromServer:(NSString *)pCouponId{
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/orders/%@",pCouponId] param:nil];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
//        if (json) {
////            NSLog(@"%@",json);
//            CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
//            LoaderModule *modloader=[[LoaderModule alloc]init];
//
//            TblOrderModel *objorder=[[TblOrderModel alloc]initWithDictionary:json];
//            TblOrderData *objorderdata=[[TblOrderData alloc]init];
//            objorderdata=[daoorder getCouponOrderData:objorder.order.couponId];
//            if([objorder.order.couponId isEqualToString:objorderdata.couponId] && ![objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                [daoorder updateCouponOrderData:objorder.order];
//            else if([objorder.order.couponId isEqualToString:objorderdata.couponId] && [objorder.order.hashCode isEqualToString:objorderdata.hashCode])
//                [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objorder.order.couponId];
//            else
//                [daoorder addCouponOrderdata:objorder.order];
//
//            for (TblOrderItemModel *modorderitem in objorder.orderitems){
//                TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
//                orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
//                if(orderitemdata.orderItemId)
//                    [daoorder updateCouponOrderItem:modorderitem.orderitem];
//                else
//                    [daoorder addCouponOrderItem:modorderitem.orderitem];
//
//                for (TblOrderModifierModel *modordermodifier in modorderitem.ordermodifiers){
//                    TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
//
//                    ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
//
//
//                    if(ordermodifierdata.modifierId)
//                        [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
//                    else
//                        [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
//
//                }
//            }
//
//        }
    }
    
    
}
-(TblSite *)getSiteFromServerBySitepass:(NSString *)pSitepass{
    TblSite *retval=[[TblSite alloc]init];
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/sites/sitepass/%@",pSitepass] param:nil];
    if(data) {
        NSError *error;
        
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
//        if (json){
//            TblSiteModel *modsite=[[TblSiteModel alloc]initWithDictionary:json];
//            if(modsite.site.siteId)
//                retval=modsite.site;
//        }
        
    }
    
    return retval;
}


@end
