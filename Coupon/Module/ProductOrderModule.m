//
//  ProductOrderModule.m
//  ProWallet
//
//  Created by Inforios on 08/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "ProductOrderModule.h"
#import "Utils.h"
#import "LoaderDao.h"
#import "TblProductOrderMaster.h"
#import "ProductOrderDao.h"
#import "TblProductOrderListModel.h"
#import "TblProductOrderModel.h"

@implementation ProductOrderModule
- (NSString *)loadProductorderListfromserver:(NSInteger )psize{
    NSString *retval=@"";
    MZCampaignProductOrderListResponse *objmezzofy=[[MZCampaignProductOrderListResponse alloc]init];
    MZCampaignOrder *objMZCampaignorder=[[MZCampaignOrder alloc]init];
    objmezzofy=[objMZCampaignorder GetOrders:psize];
        LoaderDao *daoloader=[[LoaderDao alloc]init];
//        TblProductOrderMaster *objprodmtr=[[TblProductOrderMaster alloc]initWithDictionary:json];
        if(objmezzofy.pos.count>0){
            retval=@"SUCCESS";
        ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
        TblProductOrderListModel *objprodlist=[[TblProductOrderListModel alloc]init];
        TblProductOrderModel *objproddlt=[[TblProductOrderModel alloc]init];
        [daoloader UpdateDeleteFlagBeforeServerCall:@"tbl_product_order"];
        [daoloader UpdateDeleteFlagBeforeServerCall:@"tbl_product_order_dtl"];
        for(objprodlist in objmezzofy.pos){
            TblProductOrder *temppod=[daopayment getProductOrderbyproductId:objprodlist.po.poId];
            if([temppod.poId isEqualToString:objprodlist.po.poId]&&![temppod.hashCode isEqualToString:objprodlist.po.hashCode]){
                [daoloader RemoveDataFromDatabasetblname:@"tbl_product_order_dtl" wheretblcolumn:@"poId" tableid:objprodlist.po.poId];
                for(objproddlt in objprodlist.podetails){
                    [daopayment addProductOrderDtl:objproddlt.podetail];
                }
                [daopayment updateProductOrder:objprodlist.po];
            }else if ([temppod.poId isEqualToString:objprodlist.po.poId]&&[temppod.hashCode isEqualToString:objprodlist.po.hashCode]){
                for(objproddlt in objprodlist.podetails){
                    [daoloader updateDeleteFlagDataFromServer:@"tbl_product_order_dtl" tblcolumname:@"podtlId" tableid:objproddlt.podetail.podtlId];
                }
                [daoloader updateDeleteFlagDataFromServer:@"tbl_product_order" tblcolumname:@"poId" tableid:objprodlist.po.poId];
            }else{
                [daopayment addProductOrder:objprodlist.po];
                for(objproddlt in objprodlist.podetails){
                    [daopayment addProductOrderDtl:objproddlt.podetail];
                }
            }
        }
        [daoloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_product_order"];
        [daoloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_product_order_dtl"];


        }else
            retval=[objmezzofy message];
    

    return retval;
}
- (TblProductOrder *)getTransactionRecordsOffset:(NSInteger)poffset{
    
    ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
    return  [daopayment getTransactionRecordsOffset:poffset];
    
}
- (NSInteger)getTransactionRecordsCount{
    ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
    return [daopayment getTransactionRecordsCount];
}

- (NSInteger)getProductOrderdetailcountbyproductorderId:(NSString *)ppoId{
    ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
    return [daopayment getProductOrderdetailcountbyproductorderId:ppoId];
}
-(TblProductOrderDtl *)getProductOrderdetailbyproductorderId:(NSString *)ppoId Offset:(NSInteger)poffset{
    ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
    return [daopayment getProductOrderdetailbyproductorderId:ppoId Offset:poffset];
}
-(TblProductOrder *)getProductOrderbyproductId:(NSString *)ppoId{
    ProductOrderDao *daopayment=[[ProductOrderDao alloc]init];
    return [daopayment getProductOrderbyproductId:ppoId];
}
@end
