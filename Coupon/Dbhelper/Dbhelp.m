//
//  Dbhelp.m
//  hht
//
//  Created by Kaliyarajalu on 07/08/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "Dbhelp.h"
#import "Utils.h"
#import <sqlite3.h>


@implementation Dbhelp

//- (void)createLoginDbPath {
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docsPath = [paths objectAtIndex:0];
//    
//    NSString *fullpath = [docsPath stringByAppendingPathComponent:@"logindbV1.sqlite"];
//    [Utils logindbpath:fullpath];
//    
//    NSLog(@"Login DB Path is : %@",[Utils logindbpath]);
//    
//    if (![[NSFileManager defaultManager] fileExistsAtPath:[Utils logindbpath]])
//    {
//        FMDatabase *database =[FMDatabase databaseWithPath:[Utils logindbpath]];
//        
//        [database open];
//        [database beginTransaction];
//        
//        BOOL res = TRUE;
//        
//        
//        
//        if(res)
//            [database commit];
//        else
//            [database rollback];
//        
//        [database close];
//    }
//}


- (BOOL)CreateDataBase{
    
    BOOL res = FALSE;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *fullpath = [docsPath stringByAppendingPathComponent:@"CouponWalletdb_V1.1.0.sqlite"];
    
    [Utils dbpath:fullpath];
    NSLog(@"Main Path is : %@",fullpath);
    if (![[NSFileManager defaultManager] fileExistsAtPath:[Utils dbpath]])
    {
        NSLog(@"Main Path is : %@",[Utils dbpath]);
        FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
        
        [database open];
        [database beginTransaction];
        
         res = TRUE;
        
        //1 Merchant
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_merchant(tbl_merchant_Id INTEGER PRIMARY KEY AUTOINCREMENT,countryCode VARCHAR,merchantId VARCHAR,merchantCode VARCHAR,merchantType VARCHAR,merchantName VARCHAR,merchantDesc VARCHAR,merchantLogourl VARCHAR,merchantImageurl VARCHAR,merchantTc VARCHAR,hashCode VARCHAR,profileStatus VARCHAR,merchantHotline VARCHAR,merchantStatus VARCHAR,merchantTimezone VARCHAR,merchantEmail VARCHAR,countryName VARCHAR,channelCode VARCHAR,currency VARCHAR)"];

        //2 Settings
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_settings(settings_id INTEGER PRIMARY KEY AUTOINCREMENT,settings_key VARCHAR,settings_value VARCHAR)"];
        
        //3 Customer
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_customer (tbl_customer_id INTEGER PRIMARY KEY AUTOINCREMENT, customerId VARCHAR, merchantId VARCHAR, customerGroupId VARCHAR, customerFirstName VARCHAR, customerLastName VARCHAR, customerPassword VARCHAR, customerEmail VARCHAR, countryCode VARCHAR, customerDob VARCHAR,  customerMobile VARCHAR, customerGender VARCHAR, customerAddress VARCHAR, userType VARCHAR, vipNo VARCHAR, dgvipNo VARCHAR, fbToken VARCHAR, customerStatus VARCHAR, hashCode VARCHAR, createdOn VARCHAR, updatedOn VARCHAR, updatedBy VARCHAR, customerUsername VARCHAR, customerImageUrl VARCHAR)"];
        
        //4 Customer Data
        res =res &&[database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_customerdevicedtl (tbl_customerdevicedtl INTEGER PRIMARY KEY AUTOINCREMENT, custDeviceId VARCHAR, customerId VARCHAR, deviceToken VARCHAR, deviceName VARCHAR, deviceUuid VARCHAR, updatedOn VARCHAR)"];
        
        
        //5 Site
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_site(tbl_site_Id INTEGER PRIMARY KEY AUTOINCREMENT,siteId VARCHAR,merchantId VARCHAR,siteName VARCHAR,siteAddress VARCHAR,siteLatitude double,siteLongitude double,siteLocation VARCHAR,siteEmailId VARCHAR,siteOnlineStatus VARCHAR,siteContact VARCHAR,siteStatus VARCHAR, siteRedeemPass VARCHAR,hashCode VARCHAR,locationId VARCHAR,siteDesc VARCHAR,siteDisplayWallet ,siteSeqNo VARCHAR,siteImageurl VARCHAR,createdOn VARCHAR,updatedOn VARCHAR,updatedBy VARCHAR,delflag VARCHAR)"];
        
        //6 campaign
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_campaign (tbl_campaign_id INTEGER PRIMARY KEY AUTOINCREMENT,campaignId  VARCHAR, merchantId  VARCHAR, productId  VARCHAR, productmerchantId  VARCHAR, campaignCode  VARCHAR, orginalPrice  VARCHAR, campaignName  VARCHAR, campaignDesc  VARCHAR, sellingPrice  VARCHAR, campaignTc  VARCHAR, campaignStatus  VARCHAR, campaignType  VARCHAR, brand  VARCHAR, expirydue  VARCHAR, dailyLimit  VARCHAR, packQty  VARCHAR, emailStaff  VARCHAR, couponOver  VARCHAR, expiryDays  VARCHAR,dayFilter  VARCHAR, fromDate  VARCHAR, toDate  VARCHAR, totalRedeem  VARCHAR, allocationCount  VARCHAR, couponUrl  VARCHAR, passbookUrl  VARCHAR, issuedcoupon  VARCHAR ,redeemcoupon  VARCHAR, allocationcoupon  VARCHAR, campaignNote1 VARCHAR, campaignNote2 VARCHAR, campaignNote3 VARCHAR, distance VARCHAR,dailyLimitType VARCHAR, redemptionQuota VARCHAR, campaignUuid VARCHAR, typeService VARCHAR, reviewUrl VARCHAR, videoUrl VARCHAR, startDate  VARCHAR, endDate  VARCHAR, ratecoupon  VARCHAR,outletDistance  VARCHAR,expiryname  VARCHAR,txBrand  VARCHAR,campaignRemark  VARCHAR,pickup  VARCHAR,delivery  VARCHAR,booking  VARCHAR,outcall  VARCHAR, hashCode  VARCHAR, createdOn  VARCHAR, delflag VARCHAR, favourite VARCHAR, topten VARCHAR,channelCode VARCHAR)"];
        
        
        //7 CampaignGroup
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_campaign_group (campgrpId VARCHAR,campgrpImageurl VARCHAR,campgrpName VARCHAR,campgrpSeq VARCHAR, campgrpStatus VARCHAR,hashCode VARCHAR, merchantId VARCHAR, updatedOn VARCHAR)"];
        
        //8 CampaignGroupDtl
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_campaign_groupdtl (campaignId VARCHAR,campgrpId VARCHAR)"];
        
        //9 CampaignImage
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_campaign_image (pimageId VARCHAR,campaignId VARCHAR,campaignImage VARCHAR)"];
        
        //10 CampaignSite
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_campaign_site (siteId VARCHAR,campaignId VARCHAR,assigned VARCHAR)"];
        
        //11 CustomerGroup
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_customerGroup (tbl_customerGroup_id INTEGER PRIMARY KEY AUTOINCREMENT,customerGroupId VARCHAR, merchantId VARCHAR, groupName VARCHAR, groupStatus VARCHAR, dollarSpending VARCHAR, rewardPoint VARCHAR, hashCode VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];

        //12 Product order
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_product_order (tbl_product_order_id INTEGER PRIMARY KEY AUTOINCREMENT, poId VARCHAR, merchantId VARCHAR, customerId VARCHAR, customerName VARCHAR, poDate VARCHAR, poNo VARCHAR, poTotal VARCHAR, poStatus VARCHAR, payReceipt VARCHAR, payResponse VARCHAR,transferTo VARCHAR,transferFrom VARCHAR, payToken VARCHAR, rewardPoint VARCHAR, hashCode VARCHAR, couponType VARCHAR, paymentDetailId VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];
        
        //13 Product Order Detail
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_product_order_dtl (tbl_product_order_dtl_id INTEGER PRIMARY KEY AUTOINCREMENT, podtlId VARCHAR, productId VARCHAR, campaignId VARCHAR, poId VARCHAR, campaignName VARCHAR, campaignPrice VARCHAR, campaignQty VARCHAR, campaignTotal VARCHAR, status VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];
        
        //14 Site
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_site(tbl_site_Id INTEGER PRIMARY KEY AUTOINCREMENT, siteId VARCHAR, merchantId VARCHAR, siteName VARCHAR, siteAddress VARCHAR, siteLatitude double, siteLongitude double, siteLocation VARCHAR, siteEmailId VARCHAR, siteOnlineStatus VARCHAR, siteContact VARCHAR, siteStatus VARCHAR,  siteRedeemPass VARCHAR, hashCode VARCHAR, locationId VARCHAR, siteDesc VARCHAR, siteDisplayWallet VARCHAR, siteSeqNo VARCHAR, siteImageurl VARCHAR, createdOn VARCHAR, updatedOn VARCHAR, updatedBy VARCHAR, delflag VARCHAR)"];
        
        //15 Coupon
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon(tbl_coupon_Id INTEGER PRIMARY KEY AUTOINCREMENT, couponId VARCHAR, productId VARCHAR, allocationId VARCHAR, campaignId VARCHAR, customerId VARCHAR, campaignCode VARCHAR, couponNo VARCHAR, purchaseDate VARCHAR, redeemDate VARCHAR, startDate VARCHAR, endDate VARCHAR, couponName VARCHAR, productNote1 VARCHAR, productNote2 VARCHAR, productNote3 VARCHAR, sellingPrice VARCHAR, orginalPrice VARCHAR, productDesc VARCHAR, productImageurl VARCHAR, couponStatus VARCHAR, hashCode VARCHAR, createdOn VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];
        
        //16 Coupon Count
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon_count(tbl_coupon_count_Id INTEGER PRIMARY KEY AUTOINCREMENT, campaignId VARCHAR, size VARCHAR ,delflag VARCHAR)"];
        
        //17 Wallet

        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_wallet(tbl_wallet_Id INTEGER PRIMARY KEY AUTOINCREMENT, walletId VARCHAR, customerId VARCHAR, walletCredit VARCHAR ,qrCode VARCHAR, qrTime VARCHAR ,rewardPoint VARCHAR ,updatedOn VARCHAR ,delflag VARCHAR)"];
        
        //18 Coupon_order
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon_order(tbl_coupon_order_Id INTEGER PRIMARY KEY AUTOINCREMENT,couponId  VARCHAR ,merchantId  VARCHAR ,siteId  VARCHAR ,productId  VARCHAR ,customerId  VARCHAR ,customerName  VARCHAR ,trackId  VARCHAR ,orderDate  VARCHAR ,startendTime  VARCHAR ,orderType  VARCHAR ,orderRemark  VARCHAR ,contactNo  VARCHAR ,orderNo  VARCHAR ,hashCode  VARCHAR ,orderStatus  VARCHAR ,pushRead  VARCHAR ,customerAddress  VARCHAR ,updatedOn  VARCHAR ,pickupDeliveryType  VARCHAR, delflag VARCHAR)"];
        
        //19 Coupon_order_item
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon_order_item(tbl_coupon_order_item_Id INTEGER PRIMARY KEY AUTOINCREMENT,orderItemId  VARCHAR ,couponId  VARCHAR ,itemId  VARCHAR ,itemName  VARCHAR ,delflag VARCHAR)"];
        
        //20 Coupon_order_track
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon_order_track(tbl_coupon_order_track_Id INTEGER PRIMARY KEY AUTOINCREMENT,trackId   VARCHAR ,merchantId  VARCHAR ,trackName  VARCHAR ,trackStatus  VARCHAR ,trackSeq  VARCHAR ,notificationMsg  VARCHAR ,notificationStatus  VARCHAR ,updatedOn  VARCHAR ,delflag VARCHAR)"];
        
        //21 Coupon_order_modifier
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_coupon_order_modifier(tbl_coupon_order_modifier_Id INTEGER PRIMARY KEY AUTOINCREMENT,orderModifierId  VARCHAR ,orderItemId  VARCHAR ,modifierId  VARCHAR ,modifierName  VARCHAR ,delflag VARCHAR)"];
        
        //22 Add To Cart
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_cart (tbl_cart_id INTEGER PRIMARY KEY AUTOINCREMENT,        campaignId  VARCHAR, merchantId  VARCHAR,orginalPrice  VARCHAR, campaignCode  VARCHAR, campaignName  VARCHAR, campaignDesc  VARCHAR, sellingPrice  VARCHAR, campaignTc  VARCHAR, campaignStatus  VARCHAR, reviewUrl VARCHAR,productQty VARCHAR, campaignImage VARCHAR,  totalPrice VARCHAR, status VARCHAR ,flag VARCHAR)"];
        
        //23 PaymentDetail
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_payment_dtl (tbl_payment_dtl_id INTEGER PRIMARY KEY AUTOINCREMENT, paymentDetailId VARCHAR, merchantId VARCHAR, paymentId VARCHAR, paymentLogourl VARCHAR, paymentName VARCHAR, paymentMerchantId VARCHAR, paymentKey VARCHAR, paymentToken VARCHAR, paymentUrl VARCHAR, paymentStatus VARCHAR,paymentType VARCHAR,paymentEnviornment VARCHAR,currency VARCHAR, hashCode VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];
      
        //24 Wallet Transaction
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_wallet_transcation (tbl_wallet_transcation_id INTEGER PRIMARY KEY AUTOINCREMENT,transactionReference VARCHAR, userId VARCHAR, merchantId VARCHAR, siteId VARCHAR, customerId VARCHAR, walletId VARCHAR, transactionType VARCHAR, transactionAmount VARCHAR, transactionPayRef VARCHAR, paidOn VARCHAR, processBy VARCHAR, status VARCHAR, transactionNotes VARCHAR, hashCode VARCHAR, transactionDate VARCHAR, paymentResponse VARCHAR, rewardPoint VARCHAR, updatedOn VARCHAR, approvalCode VARCHAR, delflag VARCHAR)"];
        
        //25 Channel
        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_channel (tbl_channel_id INTEGER PRIMARY KEY AUTOINCREMENT,          channelLocId VARCHAR, merchantId VARCHAR, countryCode VARCHAR, countryName VARCHAR, merchantName VARCHAR, timeZone VARCHAR, channelCode VARCHAR, channelAddress VARCHAR, googleAddress VARCHAR, headerImage VARCHAR, latitude VARCHAR, channelRemark VARCHAR, channelImage VARCHAR, longitude VARCHAR, channelDesc VARCHAR, qrImage VARCHAR, channelUrl VARCHAR, targetUrl VARCHAR, channelStatus VARCHAR, connectCount VARCHAR, createdBy VARCHAR, createdOn VARCHAR, updatedOn VARCHAR, delflag VARCHAR)"];
      

        if(res)
            [database commit];
        else
            [database rollback];
        
        [database close];
    }
    
    return res;

}

- (void)DeleteTables{
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];

    [database executeUpdate:@" DELETE FROM tbl_merchant"];                  //1
    [database executeUpdate:@" DELETE FROM tbl_settings "];                 //2
    [database executeUpdate:@" DELETE FROM tbl_customer "];                 //3
    [database executeUpdate:@" DELETE FROM tbl_customerdevicedtl "];        //4
    [database executeUpdate:@" DELETE FROM tbl_site "];                     //5
    [database executeUpdate:@" DELETE FROM tbl_campaign "];                 //6
    [database executeUpdate:@" DELETE FROM tbl_campaign_group "];           //7
    [database executeUpdate:@" DELETE FROM tbl_campaign_groupdtl "];        //8
    [database executeUpdate:@" DELETE FROM tbl_campaign_image "];           //9
    [database executeUpdate:@" DELETE FROM tbl_campaign_site "];            //10
    [database executeUpdate:@" DELETE FROM tbl_customerGroup "];            //11
    [database executeUpdate:@" DELETE FROM tbl_product_order "];            //12
    [database executeUpdate:@" DELETE FROM tbl_product_order_dtl "];        //13
    [database executeUpdate:@" DELETE FROM tbl_site "];                     //14
    [database executeUpdate:@" DELETE FROM tbl_coupon "];                   //15
    [database executeUpdate:@" DELETE FROM tbl_coupon_count "];             //16
    [database executeUpdate:@" DELETE FROM tbl_wallet "];                   //17
    [database executeUpdate:@" DELETE FROM tbl_coupon_order "];             //18
    [database executeUpdate:@" DELETE FROM tbl_coupon_order_item "];        //19
    [database executeUpdate:@" DELETE FROM tbl_coupon_order_track "];       //20
    [database executeUpdate:@" DELETE FROM tbl_coupon_order_modifier "];    //21
    [database executeUpdate:@" DELETE FROM tbl_cart "];                     //22
    [database executeUpdate:@" DELETE FROM tbl_payment_dtl "];              //23
    [database executeUpdate:@" DELETE FROM tbl_wallet_transcation "];       //24
    [database executeUpdate:@" DELETE FROM tbl_channel "];                  //25
    
    [database close];
    
}






//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_transaction(trans_id INTEGER PRIMARY KEY AUTOINCREMENT,transactionId integer,transactionNo VARCHAR,transactionTotal double,customerId integer,placeId integer,transactionDate VARCHAR,hashCode VARCHAR,randomUid VARCHAR,createdOn VARCHAR,status VARCHAR, payResponse VARCHAR,transferRemark VARCHAR)"];
//


//
//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_transaction_detail(transDetl_id INTEGER PRIMARY KEY AUTOINCREMENT,prodName VARCHAR,prodId integer,prodPrice double,prodQty double,prodTotal double,transactionId integer,transdtlId integer,merchantName VARCHAR)"];
//





//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_product_item(productitem_id INTEGER PRIMARY KEY AUTOINCREMENT,prodId integer,itemId integer)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_modifier(modifier_id INTEGER PRIMARY KEY AUTOINCREMENT,modifierId integer,itemId integer,modifierName VARCHAR,modifierRemark VARCHAR)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_product_time (prod_time_id INTEGER PRIMARY KEY AUTOINCREMENT, prodId integer, startTime VARCHAR, endTime VARCHAR, pickupDeliveryType VARCHAR)"];
//



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_product_group (prod_group_id INTEGER PRIMARY KEY AUTOINCREMENT, groupId integer, prodId integer, groupName VARCHAR, maxItem integer, status VARCHAR)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_item(key_item_id INTEGER PRIMARY KEY AUTOINCREMENT, itemId integer, itemName VARCHAR, status VARCHAR, groupId integer, maxModifier integer)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_site_time (site_time_id INTEGER PRIMARY KEY AUTOINCREMENT, merchantId integer,siteId integer, startTime VARCHAR, endTime VARCHAR, pickupDeliveryType VARCHAR)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_branch (compSiteId integer, compyId integer, siteName VARCHAR, siteAddress VARCHAR, siteLocation VARCHAR, siteContact VARCHAR ,latitude double, longitude double, status VARCHAR)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_selectedmodifier (temp_mod_id INTEGER PRIMARY KEY AUTOINCREMENT, itemId integer, modifierId integer)"];


//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_selecteditem (group_mod_id INTEGER PRIMARY KEY AUTOINCREMENT, groupId integer, itemId integer)"];



//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_orderdetails (ord_key_id INTEGER PRIMARY KEY AUTOINCREMENT, couponId VARCHAR, product integer, shopname integer, orderType VARCHAR, time VARCHAR, contact VARCHAR, remarks VARCHAR,address VARCHAR,orderDate VARCHAR)"];


//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_order_items (orditm_key_id INTEGER PRIMARY KEY AUTOINCREMENT, groupId integer, itemId integer,couponId VARCHAR,itemName varchar,groupName varchar)"];


//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_order_modifier (ordmod_key_id INTEGER PRIMARY KEY AUTOINCREMENT, modifierId integer, itemId integer,couponId VARCHAR,modifierName varchar)"];




//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_event (event_key_id INTEGER PRIMARY KEY AUTOINCREMENT, eventId integer, eventTitle VARCHAR,eventDesc VARCHAR,eventImage VARCHAR,eventImageName VARCHAR,eventUrl VARCHAR,hashCode VARCHAR,status VARCHAR,flag VARCHAR,assigned VARCHAR,eventDate VARCHAR)"];

//        res = res && [database executeUpdate:@"CREATE TABLE tbl_location(location_id INTEGER PRIMARY KEY AUTOINCREMENT,locationId integer,companyId integer,locationName VARCHAR,status VARCHAR)"];


//        res = res && [database executeUpdate:@"CREATE TABLE IF NOT EXISTS tbl_promo_history (promo_key integer PRIMARY KEY AUTOINCREMENT,type VARCHAR,code VARCHAR, promoid  VARCHAR, createdon VARCHAR)"];
@end
