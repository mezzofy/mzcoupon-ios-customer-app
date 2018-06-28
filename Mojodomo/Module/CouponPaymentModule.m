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
- (NSString *)downloadFreeCouponFromServer:(ProductOrderListDataModel *)pproductOrder{
    NSString *retval=@"";
    
    MZCouponProductOrderResponse *objmezzofy=[[MZCouponProductOrderResponse alloc]init];
    MZCouponPayment *MZPayment=[[MZCouponPayment alloc]init];
    objmezzofy=[MZPayment RequestFreeCoupon:pproductOrder];
    
    if(objmezzofy.po.poId){
        NSLog(@"%@",objmezzofy);
        retval=@"SUCCESS";
    }
    else
        retval=[objmezzofy message];
    
    
    return retval;
}
- (ProductOrderData *)downloadChargeCouponFromServer:(ProductOrderListDataModel *)pproductOrder{
    ProductOrderData *retval=[[ProductOrderData alloc]init];
    
    MZCouponProductOrderResponse *objmezzofy=[[MZCouponProductOrderResponse alloc]init];
    MZCouponPayment *MZPayment=[[MZCouponPayment alloc]init];
    objmezzofy=[MZPayment RequestChargeCoupons:pproductOrder];
    
    
    if(objmezzofy.po.poId)
        retval=objmezzofy.po;
    
    return retval;
}
- (NSString *)checkAvalibalityInServer:(NSString *)pCouponId CouponQuantity:(NSString *)pQyt{
    NSString *retval=@"";
    
    
    MZCouponOverResponse *objmezzofy=[[MZCouponOverResponse alloc]init];
    MZCouponPayment *MZPayment=[[MZCouponPayment alloc]init];
    
    objmezzofy=[MZPayment checkProductAvilability:pCouponId CouponQuantity:pQyt];
    
    if(objmezzofy.couponcount)
        retval=[NSString stringWithFormat:@"%@",[objmezzofy couponcount]];
    
    
    return retval;
}
@end
