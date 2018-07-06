//
//  ProductDao.h
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Utils.h"
#import "TblCampaignGroups.h"
#import "TblCampaignImageList.h"
#import "TblProductLists.h"
#import "TblCampaignSite.h"
#import <MZCoupon/MZCoupon.h>

@interface ProductDao : NSObject
- (TblProduct *)getProductsDetail:(NSString *)pprodid;
- (BOOL)updateSingleProduct:(ProductData *)pprod;
- (BOOL)addSingleProduct:(ProductData *)pprod;
- (BOOL)updateProduct:(TblProduct *)pprod;
- (BOOL)addProduct:(TblProduct *)pprod;
- (void)updateAllocationTotalQtyFromServer:(NSString *)pallocationqty CampaignId:(NSString *)pcampaignid;
- (NSMutableArray *)getProductList:(NSString *)pprod campaignStatus:(NSString *)pstatus;
- (BOOL)deleteProduct:(TblProduct *)pprod;
- (BOOL)DeleteImage:(NSString *)pimgid;
- (BOOL)updateCampainImage:(TblCampaignImage *)pcampaign;
- (BOOL)addCampaignImage:(TblCampaignImage *)pcampaign;
- (TblCampaignImage *)getCampaignImage:(NSString *)pcampimage;
- (NSMutableArray *)getCampaignImg:(NSString *)ppcampaignId;
- (TblCampaignImageList *)getCampaignlistImg:(NSString *)pimageid;
- (void)deleteProdImg:(NSString *)pprod;
- (NSMutableArray *)getProductList:(NSString *)pstatus;

- (TblProduct *)getCampaignbyOffset:(NSString *)pcampaignName Offset:(NSInteger)poffset;
- (NSInteger)getCampaigncount:(NSString *)pcampaignName;
- (TblProduct *)getToptenCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset;
- (NSInteger)getToptenCampaigncount:(NSString *)pcampaignName;

- (BOOL)updateToptenProduct:(TblProduct *)pprod;
- (BOOL)addToptenProduct:(TblProduct *)pprod;


- (BOOL)addCampaignsite:(TblCampaignSite *)pcampaign;
- (BOOL)updateCampainsite:(TblCampaignSite *)pcampaign;
- (TblCampaignSite *)getCampaignsite:(NSString *)pcampsite campaignId:(NSString *)pcamid;
- (BOOL)deleteCampaignSite;
- (TblCampaignSite *)getCampaignsitelist:(NSString *)campaignId SiteId:(NSString *)siteId;
- (void)deleteProdsite:(NSString *)pprod;
- (TblProduct *)getFavCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset;
- (NSInteger)getFavCampaigncount:(NSString *)pcampaignName;
@end
