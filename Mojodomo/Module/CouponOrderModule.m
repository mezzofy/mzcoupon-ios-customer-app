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
    
    MZCouponOrderListResponse *objmezzofy=[[MZCouponOrderListResponse alloc]init];
    MZCouponOrder *MZCouponorder=[[MZCouponOrder alloc]init];
    objmezzofy=[MZCouponorder GetCouponOrder:poffset];
    
    
    
            CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
            LoaderModule *modloader=[[LoaderModule alloc]init];
            if(poffset==1){
                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order"];
                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order_item"];
                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_coupon_order_modifier"];
            }

    
            for(OrderDataModel *objorder in objmezzofy.orders){
                TblOrderData *objorderdata=[[TblOrderData alloc]init];
                objorderdata=[daoorder getCouponOrderData:objorder.order.couponId];
                if([objorder.order.couponId isEqualToString:objorderdata.couponId] && ![objorder.order.hashCode isEqualToString:objorderdata.hashCode])
                    [daoorder updateCouponOrderData:objorder.order];
                else if([objorder.order.couponId isEqualToString:objorderdata.couponId] && [objorder.order.hashCode isEqualToString:objorderdata.hashCode])
                    [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objorder.order.couponId];
                else
                    [daoorder addCouponOrderdata:objorder.order];
                
                
                for (OrderItemDataModel *modorderitem in objorder.orderitems){
                    TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
                    orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
                    if(orderitemdata.orderItemId)
                        [daoorder updateCouponOrderItem:modorderitem.orderitem];
                    else
                        [daoorder addCouponOrderItem:modorderitem.orderitem];
                    
                    for (OrderModifierDataModel *modordermodifier in modorderitem.ordermodifiers){
                        TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
                        
                        ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
                        
                        
                        if(ordermodifierdata.modifierId)
                            [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
                        else
                            [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
                        
                    }
                }
            }
            [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_coupon_order"];
            
    
    
}


- (NSString *)OrderCouponToServer:(OrderDataModel *)pOrderCoupon{
    NSString *retval=@"";
    MZCouponOrderResponse *objmezzofy=[[MZCouponOrderResponse alloc]init];
     MZCouponOrder *MZCouponorder=[[MZCouponOrder alloc]init];
    objmezzofy=[MZCouponorder CreateCouponOrder:pOrderCoupon];
    
        CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
        LoaderModule *modloader=[[LoaderModule alloc]init];
    
        if(objmezzofy.order.orderNo){
            
            TblOrderData *objorderdata=[[TblOrderData alloc]init];
            objorderdata=[daoorder getCouponOrderData:objmezzofy.order.couponId];
            if([objmezzofy.order.couponId isEqualToString:objorderdata.couponId] && ![objmezzofy.order.hashCode isEqualToString:objorderdata.hashCode])
                [daoorder updateCouponOrderData:objmezzofy.order];
            else if([objmezzofy.order.couponId isEqualToString:objorderdata.couponId] && [objmezzofy.order.hashCode isEqualToString:objorderdata.hashCode])
                [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objmezzofy.order.couponId];
            else
                [daoorder addCouponOrderdata:objmezzofy.order];
            
            for (OrderItemDataModel *modorderitem in objmezzofy.orderitems){
                TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
                orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
                if(orderitemdata.orderItemId)
                    [daoorder updateCouponOrderItem:modorderitem.orderitem];
                else
                    [daoorder addCouponOrderItem:modorderitem.orderitem];
                
                for (OrderModifierDataModel *modordermodifier in modorderitem.ordermodifiers){
                    TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
                    
                    ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
                    
                    
                    if(ordermodifierdata.modifierId)
                        [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
                    else
                        [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
                    
                }
            }
            retval=@"SUCCESS";
        }
        else
            retval=[objmezzofy message];
        
    
    return retval;
}

- (NSString *)getOrderTrackFromServer:(NSString *)pCouponId{
    NSString *retval=@"";
    MZCouponOrderResponse *objmezzofy=[[MZCouponOrderResponse alloc]init];
    MZCouponOrder *MZCouponorder=[[MZCouponOrder alloc]init];
    objmezzofy=[MZCouponorder TrackCouponOrder:pCouponId];
    if(objmezzofy.order.orderNo)
        retval=[NSString stringWithFormat:@"%@",objmezzofy.order.orderNo];
    
    return retval;
}
- (void)getCouponOrderDetailsFromServer:(NSString *)pCouponId{
    MZCouponOrderResponse *objmezzofy=[[MZCouponOrderResponse alloc]init];
    MZCouponOrder *MZCouponorder=[[MZCouponOrder alloc]init];
    objmezzofy=[MZCouponorder GetCouponOrderById:pCouponId];
    
            CouponOrderDao *daoorder=[[CouponOrderDao alloc]init];
            LoaderModule *modloader=[[LoaderModule alloc]init];
            
    
            TblOrderData *objorderdata=[[TblOrderData alloc]init];
            objorderdata=[daoorder getCouponOrderData:objmezzofy.order.couponId];
            if([objmezzofy.order.couponId isEqualToString:objorderdata.couponId] && ![objmezzofy.order.hashCode isEqualToString:objorderdata.hashCode])
                [daoorder updateCouponOrderData:objmezzofy.order];
            else if([objmezzofy.order.couponId isEqualToString:objorderdata.couponId] && [objmezzofy.order.hashCode isEqualToString:objorderdata.hashCode])
                [modloader updateDeleteFlagDataFromServer:@"tbl_coupon_order" tblcolumname:@"couponId" tableid:objmezzofy.order.couponId];
            else
                [daoorder addCouponOrderdata:objmezzofy.order];
            
            for (OrderItemDataModel *modorderitem in objmezzofy.orderitems){
                TblOrderItemData *orderitemdata=[[TblOrderItemData alloc]init];
                orderitemdata=[daoorder getCouponOrderItem:modorderitem.orderitem.orderItemId];
                if(orderitemdata.orderItemId)
                    [daoorder updateCouponOrderItem:modorderitem.orderitem];
                else
                    [daoorder addCouponOrderItem:modorderitem.orderitem];
                
                for (OrderModifierDataModel *modordermodifier in modorderitem.ordermodifiers){
                    TblOrderModifierData *ordermodifierdata=[[TblOrderModifierData alloc]init];
                    
                    ordermodifierdata=[daoorder getCouponOrderModifier:modordermodifier.ordermodifier.modifierId];
                    
                    
                    if(ordermodifierdata.modifierId)
                        [daoorder updateCouponOrderModifier:modordermodifier.ordermodifier];
                    else
                        [daoorder addCouponOrderModifier:modordermodifier.ordermodifier];
                    
                }
         
    }
    
    
}
//-(TblSite *)getSiteFromServerBySitepass:(NSString *)pSitepass{
//    TblSite *retval=[[TblSite alloc]init];
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/sites/sitepass/%@",pSitepass] param:nil];
//    if(data) {
//        NSError *error;
//        
//        
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        
//        if (json){
//            TblSiteModel *modsite=[[TblSiteModel alloc]initWithDictionary:json];
//            if(modsite.site.siteId)
//                retval=modsite.site;
//        }
//        
//    }
//    
//    return retval;
//}

- (TblOrderData *)getCouponOrderData:(NSString *)pcouponId{
    CouponOrderDao *daocoupon=[[CouponOrderDao alloc]init];
    return [daocoupon getCouponOrderData:pcouponId];
}

@end
