//
//  ProductModule.h
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "TblProductLists.h"
#import "TblCampaignGroups.h"
#import "TblCampaignCode.h"
#import "TblCampaignSiteList.h"

@interface ProductModule : NSObject
//Product List->Campaign List
- (void)loadProductListFromServer:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude;

//Product List->Campaign List with filter
- (void)loadProductListFromServerWithFilter:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude;

//Product Detail From Server
- (void)loadProductDetailsFromServerCampaignID:(NSString *)pcampaignId Latitude:(double)platitute Longitude:(double)plongitude;

//Top ten Product List->Campaign List
- (void)loadToptenProductListFromServer;
//campaign Group
- (void)loadCampaigngroupsAndDetailsfromserverLatitude:(double)platitute Longitude:(double)plongitude;

//Campaign With Channel
- (void)loadCampaignChannelID:(NSString *)pChannelId Offset:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude;

//DataBase
- (NSMutableArray *)getProductList:(NSString *)pstatus;
- (NSMutableArray *)getCampaignImg:(NSString *)ppcampaignId;
- (TblProduct *)getCampaignbyOffset:(NSString *)pcampaignName Offset:(NSInteger)poffset;
- (NSInteger)getCampaigncount:(NSString *)pcampaignName;
- (TblProduct *)getToptenCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset;
- (NSInteger)getToptenCampaigncount:(NSString *)pcampaignName;
- (TblProduct *)getFavCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset;
- (NSInteger)getFavCampaigncount:(NSString *)pcampaignName;
- (TblProduct *)getProductsDetail:(NSString *)pprodid;
- (TblCampaign *)getCampaignGroupbyOffset:(NSInteger)poffset;
- (NSInteger)getCampaignGroupcount;
- (TblProduct *)getCampaignGroupDetailbyCampaignGroupId:(NSString *)pcampgrpId Offset:(NSInteger)poffset;
- (NSInteger)getCampaignGroupDetailcountCampaignGroupId:(NSString *)pcampgrpId;
- (TblCampaign *)getCampaignGroup:(NSString *)pcampgrpId;
@end
