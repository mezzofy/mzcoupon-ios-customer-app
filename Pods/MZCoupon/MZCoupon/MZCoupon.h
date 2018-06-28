//
//  Mezzofy.h
//  Mezzofy
//
//  Created by Mezzofy on 13/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for Mezzofy.
FOUNDATION_EXPORT double MezzofyVersionNumber;

//! Project version string for Mezzofy.
FOUNDATION_EXPORT const unsigned char MezzofyVersionString[];
//Common
#import <MZCoupon/MZUtils.h>
#import <MZCoupon/MZCouponConfig.h>
//Data
#import <MZCoupon/DataReaponseDataModel.h>
#import <MZCoupon/DataResponseSizeData.h>
#import <MZCoupon/CampaignData.h>
#import <MZCoupon/CampaignCodeData.h>
#import <MZCoupon/CampaignGroupData.h>
#import <MZCoupon/CampaignGroupDtlData.h>
#import <MZCoupon/CampaignGroupDtlsData.h>
#import <MZCoupon/CampaignGroupsData.h>
#import <MZCoupon/CampaignImageData.h>
#import <MZCoupon/CampaignImageListDataModel.h>
#import <MZCoupon/CampaignSearchDataModel.h>
#import <MZCoupon/CampaignSiteData.h>
#import <MZCoupon/CampaignSiteListDataModel.h>
#import <MZCoupon/CampGrpData.h>
#import <MZCoupon/CountryData.h>
#import <MZCoupon/CountryListDataModel.h>
#import <MZCoupon/CountryDataModel.h>
#import <MZCoupon/CouponData.h>
#import <MZCoupon/CustomerCouponData.h>
#import <MZCoupon/CustomerCouponListDataModel.h>
#import <MZCoupon/CustomerCouponDataModel.h>
#import <MZCoupon/CustomerData.h>
#import <MZCoupon/CustomerDeviceData.h>
#import <MZCoupon/CustomerDeviceDataModel.h>
#import <MZCoupon/CustomerGroupData.h>
#import <MZCoupon/CustomerGroupListDataModel.h>
#import <MZCoupon/CustomerGroupDataModel.h>
#import <MZCoupon/CustomerDataModel.h>
#import <MZCoupon/GiftcouponData.h>
#import <MZCoupon/GiftcouponDataModel.h>
#import <MZCoupon/MasscouponData.h>
#import <MZCoupon/MasscouponDetailData.h>
#import <MZCoupon/MasscouponDetailDataModel.h>
#import <MZCoupon/MasscouponDataModel.h>
#import <MZCoupon/MerchantData.h>
#import <MZCoupon/MerchantDataModel.h>
#import <MZCoupon/NotificationData.h>
#import <MZCoupon/NotificationListDataModel.h>
#import <MZCoupon/NotificationDataModel.h>
#import <MZCoupon/OrderData.h>
#import <MZCoupon/OrderItemData.h>
#import <MZCoupon/OrderItemDataModel.h>
#import <MZCoupon/OrderListDataModel.h>
#import <MZCoupon/OrderDataModel.h>
#import <MZCoupon/OrderModifierData.h>
#import <MZCoupon/OrderModifierDataModel.h>
#import <MZCoupon/OrderTrackData.h>
#import <MZCoupon/OrderTrackDataModel.h>
#import <MZCoupon/OverCouponData.h>
#import <MZCoupon/PaymentData.h>
#import <MZCoupon/PaymentDtlData.h>
#import <MZCoupon/PaymentMasterData.h>
#import <MZCoupon/PaymentDataModel.h>
#import <MZCoupon/ProductData.h>
#import <MZCoupon/ProductListData.h>
#import <MZCoupon/ProductListsData.h>
#import <MZCoupon/ProductOrderData.h>
#import <MZCoupon/ProductOrderDtlData.h>
#import <MZCoupon/ProductOrderListDataModel.h>
#import <MZCoupon/ProductOrderMasterData.h>
#import <MZCoupon/ProductOrderDataModel.h>
#import <MZCoupon/SiteData.h>
#import <MZCoupon/SiteListData.h>
#import <MZCoupon/SiteDataModel.h>
#import <MZCoupon/StockData.h>
#import <MZCoupon/StockDataModel.h>
#import <MZCoupon/WalletData.h>
#import <MZCoupon/WalletDataModel.h>
#import <MZCoupon/WalletTxnData.h>
#import <MZCoupon/WalletTxnListDataModel.h>
#import <MZCoupon/WalletTxnDataModel.h>
//ResponseData
#import <MZCoupon/MZCustomerResponse.h>
#import <MZCoupon/MZCustomerGroupResponse.h>
#import <MZCoupon/MZWalletResponse.h>
#import <MZCoupon/MZWalletTransactionResponse.h>
#import <MZCoupon/MZWalletTransactionListResponse.h>
#import <MZCoupon/MZSiteResponse.h>
#import <MZCoupon/MZCountryResponse.h>
#import <MZCoupon/MZRegsisterResponse.h>
#import <MZCoupon/MZCampaignDetailResponse.h>
#import <MZCoupon/MZCampaignOrderResponse.h>
#import <MZCoupon/MZCampaignResponse.h>
#import <MZCoupon/MZCampaignGroupResponse.h>
#import <MZCoupon/MZPaymentResponse.h>
#import <MZCoupon/MZNotificationResponse.h>
#import <MZCoupon/MZMerchantResponse.h>
#import <MZCoupon/MZCouponResponse.h>
#import <MZCoupon/MZCouponSiteResponse.h>
#import <MZCoupon/MZCouponOrderResponse.h>
#import <MZCoupon/MZCouponOrderListResponse.h>
#import <MZCoupon/MZCouponMassRedeemResponse.h>
#import <MZCoupon/MZCouponGiftResponse.h>
#import <MZCoupon/MZCouponStockResponse.h>
#import <MZCoupon/MZCouponSizeResponse.h>
#import <MZCoupon/MZCouponProductOrderResponse.h>
#import <MZCoupon/MZCouponOverResponse.h>
#import <MZCoupon/MZCampaignProductOrderListResponse.h>
//Module
#import <MZCoupon/MZMerchant.h>
#import <MZCoupon/MZNotification.h>
#import <MZCoupon/MZPayment.h>
#import <MZCoupon/MZCampaign.h>
#import <MZCoupon/MZCampaignOrder.h>
#import <MZCoupon/MZRegsister.h>
#import <MZCoupon/MZSite.h>
#import <MZCoupon/MZWallet.h>
#import <MZCoupon/MZWalletTopUpTransaction.h>
#import <MZCoupon/MZCouponModule.h>
#import <MZCoupon/MZCouponOrder.h>
#import <MZCoupon/MZCouponPayment.h>
#import <MZCoupon/MZCustomer.h>
#import <MZCoupon/MZMassRedeem.h>




