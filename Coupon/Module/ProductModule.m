//
//  ProductModule.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "ProductModule.h"
#import "LoaderModule.h"
#import "ProductDao.h"
#import "CampaingroupDao.h"
#import "TblCampaignSearchModel.h"
#import <MZCoupon/MZCoupon.h>



@implementation ProductModule

- (void)loadProductListFromServer:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude  {
    
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignResponse *objres=[[MZCampaignResponse alloc]init];
    objres=[objmezzofy getCampaigns:poffset Latitude:platitute Longitude:plongitude];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if(poffset==1)
        [modloader UpdateSyncflagBeforeServerCallCampaign:@"tbl_campaign" Campaignstatus:@"A"];
    
    
    
    [Common dataResponse:objres.size];
    ProductDao *daoprod = [[ProductDao alloc]init];
    
    [daoprod deleteCampaignSite];
    
    for(int i=0;i<objres.campaigns.count;i++){
        TblProductList *objprodlist=[[TblProductList alloc]init];
        objprodlist=[objres.campaigns objectAtIndex:i];
        
        TblProduct *objres = [daoprod getProductsDetail:[objprodlist.campaign campaignId]];
        if([objres.campaignId isEqualToString:objprodlist.campaign.campaignId])
            [daoprod updateProduct:objprodlist.campaign];
        else
            [daoprod addProduct:objprodlist.campaign];
        
        //CampaignImage
        
        for(int i=0;i<objprodlist.campaign.campaignimages.count;i++){
            TblCampaignImageList *objprodimg=[[TblCampaignImageList alloc]init];
            objprodimg=[objprodlist.campaign.campaignimages objectAtIndex:i];
            
            TblCampaignImage *objcampimg = [daoprod getCampaignImage:objprodimg.campaignimage.pimageId];
            
            if (objcampimg) {
                [daoprod updateCampainImage:objprodimg.campaignimage];
            } else {
                [daoprod addCampaignImage:objprodimg.campaignimage];
            }
        }
        
        //Campaignsite
        for(int i=0;i<objprodlist.campaign.sites.count;i++){
            TblCampaignSiteList *objprodsite=[[TblCampaignSiteList alloc]init];
            objprodsite=[objprodlist.campaign.sites objectAtIndex:i];
            
            [objprodsite.site setCampaignId:objprodlist.campaign.campaignId];
            
            [daoprod addCampaignsite:objprodsite.site];
        }
    }
    
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_campaign"];
}
- (void)loadProductDetailsFromServerCampaignID:(NSString *)pcampaignId Latitude:(double)platitute Longitude:(double)plongitude  {
    
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignDetailResponse *mezres=[[MZCampaignDetailResponse alloc]init];
    
    mezres=[objmezzofy getCampaignById:pcampaignId Latitude:platitute Longitude:plongitude];
    ProductDao *daoprod = [[ProductDao alloc]init];
    
    if(mezres.campaign.campaignId){
        TblProduct *objres = [daoprod getProductsDetail:[mezres.campaign campaignId]];
        if([objres.campaignId isEqualToString:mezres.campaign.campaignId])
            [daoprod updateSingleProduct:mezres.campaign];
        else
            [daoprod addSingleProduct:mezres.campaign];
        
        //CampaignImage
        
        for(int i=0;i<mezres.campaign.campaignimages.count;i++){
            TblCampaignImageList *objprodimg=[[TblCampaignImageList alloc]init];
            objprodimg=[mezres.campaign.campaignimages objectAtIndex:i];
            
            TblCampaignImage *objcampimg = [daoprod getCampaignImage:objprodimg.campaignimage.pimageId];
            
            if (objcampimg) {
                [daoprod updateCampainImage:objprodimg.campaignimage];
            } else {
                [daoprod addCampaignImage:objprodimg.campaignimage];
            }
        }
        
        //Campaignsite
        for(int i=0;i<mezres.campaign.sites.count;i++){
            TblCampaignSiteList *objprodsite=[[TblCampaignSiteList alloc]init];
            objprodsite=[mezres.campaign.sites objectAtIndex:i];
            
            [objprodsite.site setCampaignId:mezres.campaign.campaignId];
            
            [daoprod addCampaignsite:objprodsite.site];
            
        }
    }
}
- (void)loadToptenProductListFromServer{
    
    
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignResponse *objres=[[MZCampaignResponse alloc]init];
    objres=[objmezzofy getCampaignsTop];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"topten" flagvalue:@"N" tblindex:@"topten" tblvalue:@"Y"];
    [Common dataResponse:objres.size];
    ProductDao *daoprod = [[ProductDao alloc]init];
    
    [daoprod deleteCampaignSite];
    
    for(int i=0;i<objres.campaigns.count;i++){
        TblProductList *objprodlist=[[TblProductList alloc]init];
        objprodlist=[objres.campaigns objectAtIndex:i];
        
        TblProduct *objres = [daoprod getProductsDetail:[objprodlist.campaign campaignId]];
        if([objres.campaignId isEqualToString:objprodlist.campaign.campaignId])
            [daoprod updateToptenProduct:objprodlist.campaign];
        //
        //                    else if ([objres.campaignId isEqualToString:objprodlist.campaign.campaignId]&&[objres.hashCode isEqualToString:objprodlist.campaign.hashCode])
        //                            [daoloader updateDeleteFlagDataFromServer:@"tbl_campaign" tblcolumname:@"campaignId" tableid:objprodlist.campaign.campaignId];
        else
            [daoprod addToptenProduct:objprodlist.campaign];
        
        //CampaignImage
        
        for(int i=0;i<objprodlist.campaign.campaignimages.count;i++){
            TblCampaignImageList *objprodimg=[[TblCampaignImageList alloc]init];
            objprodimg=[objprodlist.campaign.campaignimages objectAtIndex:i];
            
            TblCampaignImage *objcampimg = [daoprod getCampaignImage:objprodimg.campaignimage.pimageId];
            
            if (objcampimg) {
                [daoprod updateCampainImage:objprodimg.campaignimage];
            } else {
                [daoprod addCampaignImage:objprodimg.campaignimage];
            }
        }
        
        //Campaignsite
        for(int i=0;i<objprodlist.campaign.sites.count;i++){
            TblCampaignSiteList *objprodsite=[[TblCampaignSiteList alloc]init];
            objprodsite=[objprodlist.campaign.sites objectAtIndex:i];
            
            [objprodsite.site setCampaignId:objprodlist.campaign.campaignId];
            
            [daoprod addCampaignsite:objprodsite.site];
        }
    }
}
- (void)loadCampaigngroupsAndDetailsfromserverLatitude:(double)platitute Longitude:(double)plongitude{
    
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignGroupResponse *objres=[[MZCampaignGroupResponse alloc]init];
    objres=[objmezzofy getCampaignGroups:platitute Longitude:plongitude];
    CampaingroupDao *daocamp=[[CampaingroupDao alloc]init];
    [daocamp deleteCampaignGroupDtl];
    
    for(int i=0;i<objres.campaigngroups.count;i++){
        TblCampaignGroup *objcamp=[[TblCampaignGroup alloc]init];
        objcamp=[objres.campaigngroups objectAtIndex:i];
        TblCampaign *tblcamp=[daocamp getCampaignGroup:objcamp.campaigngroup.campgrpId];
        if([tblcamp.campgrpId isEqualToString:objcamp.campaigngroup.campgrpId])
            [daocamp updateCampainGroup:objcamp.campaigngroup];
        else
            [daocamp addCampaignGroup:objcamp.campaigngroup];
        
        for(int j=0;j<objcamp.campGrpDetails.count;j++){
            TblCampaignGroupDtls *objcampdtl=[objcamp.campGrpDetails objectAtIndex:j];
            [daocamp addCampaignGroupDtl:objcampdtl.campGrpDetail];
            ProductDao *daoprod=[[ProductDao alloc]init];
            TblProduct *objprod=[daoprod getProductsDetail:objcampdtl.campGrpDetail.campaignId];
            if(![objprod.campaignId isEqualToString:objcampdtl.campGrpDetail.campaignId]){
                if(!platitute)
                    platitute=0.0f;
                if(!plongitude)
                    plongitude=0.0f;
                [self loadProductDetailsFromServerCampaignID:objcampdtl.campGrpDetail.campaignId Latitude:platitute Longitude:plongitude ];
            }
        }
    }
}
- (void)loadProductListFromServerWithFilter:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude  {
    
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignResponse *objres=[[MZCampaignResponse alloc]init];
    objres=[objmezzofy getCampaignsWithFilter:poffset Latitude:platitute Longitude:plongitude Filtersite:[Common filterSite] FilterCampaignGroup:[Common filterCampaignGroup]];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if(poffset==1)
        [modloader UpdateSyncflagBeforeServerCallCampaign:@"tbl_campaign" Campaignstatus:@"A"];
    
    
    
    [Common dataResponse:objres.size];
    
    
    ProductDao *daoprod = [[ProductDao alloc]init];
    
    [daoprod deleteCampaignSite];
    
    for(int i=0;i<objres.campaigns.count;i++){
        TblProductList *objprodlist=[[TblProductList alloc]init];
        objprodlist=[objres.campaigns objectAtIndex:i];
        
        TblProduct *objres = [daoprod getProductsDetail:[objprodlist.campaign campaignId]];
        if([objres.campaignId isEqualToString:objprodlist.campaign.campaignId])
            [daoprod updateProduct:objprodlist.campaign];
        else
            [daoprod addProduct:objprodlist.campaign];
        
        //CampaignImage
        
        for(int i=0;i<objprodlist.campaign.campaignimages.count;i++){
            TblCampaignImageList *objprodimg=[[TblCampaignImageList alloc]init];
            objprodimg=[objprodlist.campaign.campaignimages objectAtIndex:i];
            
            TblCampaignImage *objcampimg = [daoprod getCampaignImage:objprodimg.campaignimage.pimageId];
            
            if (objcampimg) {
                [daoprod updateCampainImage:objprodimg.campaignimage];
            } else {
                [daoprod addCampaignImage:objprodimg.campaignimage];
            }
        }
        
        //Campaignsite
        for(int i=0;i<objprodlist.campaign.sites.count;i++){
            TblCampaignSiteList *objprodsite=[[TblCampaignSiteList alloc]init];
            objprodsite=[objprodlist.campaign.sites objectAtIndex:i];
            
            [objprodsite.site setCampaignId:objprodlist.campaign.campaignId];
            
            [daoprod addCampaignsite:objprodsite.site];
        }
    }
    
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_campaign"];
    
}

- (void)loadCampaignChannelID:(NSString *)pChannelId Offset:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude{
    MZCampaign *objmezzofy=[[MZCampaign alloc]init];
    MZCampaignResponse *objres=[[MZCampaignResponse alloc]init];
    objres=[objmezzofy getCampaignsWithChannelID:pChannelId Offset:poffset Latitude:platitute Longitude:plongitude];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if(poffset==1)
        [modloader UpdateSyncflagBeforeServerCallCampaign:@"tbl_campaign" Campaignstatus:@"A"];
    
    
    
    [Common dataResponse:objres.size];
    ProductDao *daoprod = [[ProductDao alloc]init];
    
    [daoprod deleteCampaignSite];
    
    for(int i=0;i<objres.campaigns.count;i++){
        TblProductList *objprodlist=[[TblProductList alloc]init];
        objprodlist=[objres.campaigns objectAtIndex:i];
        
        TblProduct *objres = [daoprod getProductsDetail:[objprodlist.campaign campaignId]];
        if([objres.campaignId isEqualToString:objprodlist.campaign.campaignId])
            [daoprod updateProduct:objprodlist.campaign];
        else
            [daoprod addProduct:objprodlist.campaign];
        
        //CampaignImage
        
        for(int i=0;i<objprodlist.campaign.campaignimages.count;i++){
            TblCampaignImageList *objprodimg=[[TblCampaignImageList alloc]init];
            objprodimg=[objprodlist.campaign.campaignimages objectAtIndex:i];
            
            TblCampaignImage *objcampimg = [daoprod getCampaignImage:objprodimg.campaignimage.pimageId];
            
            if (objcampimg) {
                [daoprod updateCampainImage:objprodimg.campaignimage];
            } else {
                [daoprod addCampaignImage:objprodimg.campaignimage];
            }
        }
        
        //Campaignsite
        for(int i=0;i<objprodlist.campaign.sites.count;i++){
            TblCampaignSiteList *objprodsite=[[TblCampaignSiteList alloc]init];
            objprodsite=[objprodlist.campaign.sites objectAtIndex:i];
            
            [objprodsite.site setCampaignId:objprodlist.campaign.campaignId];
            
            [daoprod addCampaignsite:objprodsite.site];
        }
    }
    
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_campaign"];
}

- (TblProduct *)getProductsDetail:(NSString *)pcampid{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getProductsDetail:pcampid];
    
}
- (NSMutableArray *)getProductList:(NSString *)pstatus {
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getProductList:pstatus];
}
- (NSMutableArray *)getCampaignImg:(NSString *)ppcampaignId{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getCampaignImg:ppcampaignId];
}
- (TblProduct *)getCampaignbyOffset:(NSString *)pcampaignName Offset:(NSInteger)poffset{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getCampaignbyOffset:pcampaignName Offset:poffset];
}
- (NSInteger)getCampaigncount:(NSString *)pcampaignName{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getCampaigncount:pcampaignName];
}
- (TblProduct *)getToptenCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getToptenCampaignbyOffset:pcampaignName Offset:poffset];
}
- (NSInteger)getToptenCampaigncount:(NSString *)pcampaignName{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getToptenCampaigncount:pcampaignName];
}
- (TblProduct *)getFavCampaignbyOffset:(NSString *)pcampaignName  Offset:(NSInteger)poffset{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getFavCampaignbyOffset:pcampaignName Offset:poffset];
}
- (NSInteger)getFavCampaigncount:(NSString *)pcampaignName{
    ProductDao *daoprod=[[ProductDao alloc]init];
    return [daoprod getFavCampaigncount:pcampaignName];
}
- (TblCampaign *)getCampaignGroupbyOffset:(NSInteger)poffset{
    CampaingroupDao *daocampgrp=[[CampaingroupDao alloc]init];
    return [daocampgrp getCampaignGroupbyOffset:poffset];
}
- (NSInteger)getCampaignGroupcount{
    CampaingroupDao *daocampgrp=[[CampaingroupDao alloc]init];
    return [daocampgrp getCampaignGroupcount];
}

- (TblProduct *)getCampaignGroupDetailbyCampaignGroupId:(NSString *)pcampgrpId Offset:(NSInteger)poffset{
    CampaingroupDao *daocampgrp=[[CampaingroupDao alloc]init];
    return [daocampgrp getCampaignGroupDetailbyCampaignGroupId:pcampgrpId Offset:poffset];
    
}
- (NSInteger)getCampaignGroupDetailcountCampaignGroupId:(NSString *)pcampgrpId{
    CampaingroupDao *daocampgrp=[[CampaingroupDao alloc]init];
    return [daocampgrp getCampaignGroupDetailcountCampaignGroupId:pcampgrpId];
    
}
- (TblCampaign *)getCampaignGroup:(NSString *)pcampgrpId{
    CampaingroupDao *daocampgrp=[[CampaingroupDao alloc]init];
    return [daocampgrp getCampaignGroup:pcampgrpId];
    
}
@end
