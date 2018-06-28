//
//  PaymentModule.m
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "PaymentModule.h"
#import "PaymentDao.h"

@implementation PaymentModule
-(void)loadPaymentListfromserver:(NSInteger )poffset {
    
    
    MZPaymentResponse *objmezzofy=[[MZPaymentResponse alloc]init];
    MZPayment *objMZPayment=[[MZPayment alloc]init];
    objmezzofy=[objMZPayment GetPayments:poffset];
    LoaderModule *modloader=[[LoaderModule alloc]init];
            if(poffset==1)
                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_payment_dtl"];
            
            PaymentDataModel *objpay=[[PaymentDataModel alloc]init];
            PaymentDao *daopayment=[[PaymentDao alloc]init];
            for(objpay in [objmezzofy paymentdetails]){
                TblPaymentDtl *objpaydtl=[daopayment getPaymentDtl:objpay.paymentdetail.paymentDetailId];
                if([objpaydtl.paymentDetailId isEqualToString:objpay.paymentdetail.paymentDetailId]&&![objpaydtl.hashCode isEqualToString:objpay.paymentdetail.hashCode])
                    [daopayment UpdatepaymentDtl:objpay.paymentdetail];
                else if([objpaydtl.paymentDetailId isEqualToString:objpay.paymentdetail.paymentDetailId]&&[objpaydtl.hashCode isEqualToString:objpay.paymentdetail.hashCode])
                    [modloader updateDeleteFlagDataFromServer:@"tbl_payment_dtl" tblcolumname:@"paymentDetailId" tableid:objpay.paymentdetail.paymentDetailId];
                else
                    [daopayment addpaymentDtl:objpay.paymentdetail];
            }
    

    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_payment_dtl"];
}
- (NSInteger)getAvaliablePaymentMethodcount{
    PaymentDao *daopayment=[[PaymentDao alloc]init];
    return [daopayment getAvaliablePaymentMethodcount];
}
- (TblPaymentDtl *)getPaymentMethodDetailOffset:(NSInteger)poffset{
    PaymentDao *daopayment=[[PaymentDao alloc]init];
    return [daopayment getPaymentMethodDetailOffset:poffset];
}
@end
