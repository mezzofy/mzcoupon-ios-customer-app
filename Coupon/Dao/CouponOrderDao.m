//
//  CouponOrderDao.m
//  ProWallet
//
//  Created by Inforios on 19/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CouponOrderDao.h"

@implementation CouponOrderDao

- (BOOL)addCouponOrderdata:(OrderData *)pOrderdata{

    BOOL retval = false;

    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon_order (couponId ,merchantId ,siteId ,productId ,customerId ,customerName ,trackId ,orderDate ,startendTime ,orderType ,orderRemark ,contactNo ,orderNo ,hashCode ,orderStatus ,pushRead ,customerAddress ,updatedOn ,pickupDeliveryType , delflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",pOrderdata.couponId,pOrderdata.merchantId,pOrderdata.siteId,pOrderdata.productId,pOrderdata.customerId,pOrderdata.customerName,pOrderdata.trackId,pOrderdata.orderDate,pOrderdata.startendTime,pOrderdata.orderType,pOrderdata.orderRemark,pOrderdata.contactNo,pOrderdata.orderNo,pOrderdata.hashCode,pOrderdata.orderStatus,pOrderdata.pushRead,pOrderdata.customerAddress,pOrderdata.updatedOn,pOrderdata.pickupDeliveryType];
    
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponOrderData:(OrderData *)pOrderdata{
    
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon_order set merchantId = ? ,siteId = ? ,productId= ? ,customerId= ? ,customerName= ? ,trackId= ? ,orderDate= ? ,startendTime= ? ,orderType= ? ,orderRemark= ? ,contactNo= ? ,orderNo= ? ,hashCode= ? ,orderStatus= ? ,pushRead= ? ,customerAddress= ? ,updatedOn= ? ,pickupDeliveryType= ? , delflag ='N') WHERE couponId = ? ",pOrderdata.merchantId,pOrderdata.siteId,pOrderdata.productId,pOrderdata.customerId,pOrderdata.customerName,pOrderdata.trackId,pOrderdata.orderDate,pOrderdata.startendTime,pOrderdata.orderType,pOrderdata.orderRemark,pOrderdata.contactNo,pOrderdata.orderNo,pOrderdata.hashCode,pOrderdata.orderStatus,pOrderdata.pushRead,pOrderdata.customerAddress,pOrderdata.updatedOn,pOrderdata.pickupDeliveryType,pOrderdata.couponId];
    
    [database close];
    return retval;
    
    
}
- (TblOrderData *)getCouponOrderData:(NSString *)pcouponId{
    TblOrderData *retval=[[TblOrderData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_coupon_order where couponId = ? ",pcouponId];
    
    if ([ressite next]) {
        
        retval =[[TblOrderData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}

- (BOOL)addCouponOrderItem:(OrderItemData *)pcouponitem{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon_order_item (orderItemId ,couponId ,itemId ,itemName ,delflag ) values(?,?,?,?,'N')",pcouponitem.orderItemId,pcouponitem.couponId,pcouponitem.itemId,pcouponitem.itemName];
    
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponOrderItem:(OrderItemData *)pcouponitem{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon_order_item set  couponId = ?, itemId = ?, itemName = ?,  delflag = 'N' where orderItemId = ?",pcouponitem.couponId,pcouponitem.itemId,pcouponitem.itemName,pcouponitem.orderItemId];
    
    [database close];
    return retval;
    
}
- (TblOrderItemData *)getCouponOrderItem:(NSString *)porderItemId{
    TblOrderItemData *retval=[[TblOrderItemData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_coupon_order_item where orderItemId = ?  ",porderItemId];
    
    if ([ressite next]) {
        
        retval =[[TblOrderItemData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}

- (BOOL)addCouponOrderTrack:(OrderTrackData *)pcouponordertrack{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon_order_track (trackId ,merchantId ,trackName ,trackStatus ,trackSeq ,notificationMsg ,notificationStatus ,updatedOn ,delflag ) values(?,?,?,?,?,?,?,?,'N')",pcouponordertrack.trackId,pcouponordertrack.merchantId,pcouponordertrack.trackName,pcouponordertrack.trackStatus,pcouponordertrack.trackSeq,pcouponordertrack.notificationMsg,pcouponordertrack.notificationStatus,pcouponordertrack.updatedOn];
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponOrderTrack:(OrderTrackData *)pcouponordertrack{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon_order_track set   merchantId = ?, trackName = ?, trackStatus = ?, trackSeq = ?, notificationMsg = ?, notificationStatus = ?, updatedOn = ? ,delflag = 'N' where trackId = ?",pcouponordertrack.merchantId,pcouponordertrack.trackName,pcouponordertrack.trackStatus,pcouponordertrack.trackSeq,pcouponordertrack.notificationMsg,pcouponordertrack.notificationStatus,pcouponordertrack.updatedOn,pcouponordertrack.trackId];
    
    [database close];
    return retval;
    
}
- (TblOrderTrackData *)getCouponOrderTrack:(NSString *)ptrackId{
    TblOrderTrackData *retval=[[TblOrderTrackData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_coupon_order_track where trackId = ?  ",ptrackId];
    
    if ([ressite next]) {
        
        retval =[[TblOrderTrackData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}

- (BOOL)addCouponOrderModifier:(OrderModifierData *)pcouponmodifier{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_coupon_order_modifier (orderModifierId ,orderItemId ,modifierId ,modifierName ,delflag) values(?,?,?,?,'N')",pcouponmodifier.orderItemId,pcouponmodifier.orderItemId,pcouponmodifier.modifierId,pcouponmodifier.modifierName];
    
    [database close];
    return retval;
    
}

- (BOOL)updateCouponOrderModifier:(OrderModifierData *)pcouponmodifier{
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_coupon_order_modifier set   orderItemId = ?, modifierId = ?, modifierName = ?, delflag = 'N' where orderModifierId = ?",pcouponmodifier.orderItemId,pcouponmodifier.modifierId,pcouponmodifier.modifierName,pcouponmodifier.orderItemId];
    
    [database close];
    return retval;
    
}
- (TblOrderModifierData *)getCouponOrderModifier:(NSString *)porderModifierId {
    TblOrderModifierData *retval=[[TblOrderModifierData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_coupon_order_modifier where orderModifierId = ?  ",porderModifierId];
    
    if ([ressite next]) {
        
        retval =[[TblOrderModifierData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}


@end
