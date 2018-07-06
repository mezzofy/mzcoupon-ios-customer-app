//
//  SiteModule.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "SiteModule.h"
#import "Utils.h"
#import "LoaderModule.h"
#import "DataResponseSize.h"
#import "TblSiteList.h"
#import "SiteDao.h"

@implementation SiteModule
- (void)getSiteFromServer{
    int totalpage=1;
    for(int i=1;i<=totalpage;i++){
        MZSiteResponse *objmezzofy=[[MZSiteResponse alloc]init];
        MZSite *objMZSite=[[MZSite alloc]init];
        objmezzofy=[objMZSite GetMerchantSites:i];
    
                SiteDao *daosite=[[SiteDao alloc]init];
                LoaderModule *modloader=[[LoaderModule alloc]init];
                if(i==1)
                    [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_site"];
        
                totalpage=[objmezzofy.size.pagesize intValue];
        
                for(SiteDataModel *objsitemod in objmezzofy.sites){
                    TblSite *objsitedata=[[TblSite alloc]init];
                    objsitedata=[daosite getSite:objsitemod.site.siteId];
                    if([objsitedata.siteId isEqualToString:objsitemod.site.siteId]&&![objsitedata.hashCode isEqualToString:objsitemod.site.hashCode])
                        [daosite updateSite:objsitemod.site];
                    
                    else if([objsitedata.siteId isEqualToString:objsitemod.site.siteId]&&[objsitedata.hashCode isEqualToString:objsitemod.site.hashCode])
                        [modloader updateDeleteFlagDataFromServer:@"tbl_site" tblcolumname:@"siteId" tableid:objsitemod.site.siteId];
                    else
                        [daosite addSite:objsitemod.site];
                }
                
        
        
    
        }
}
- (NSMutableArray *)getSiteFromTable:(NSString *)pcampainId{
    SiteDao *daosite=[[SiteDao alloc]init];
    return [daosite getSiteFromTable:pcampainId];
    
}
- (TblSite *)getSite:(NSString *)psiteid{
    SiteDao *daosite=[[SiteDao alloc]init];
    return [daosite getSite:psiteid];
}
- (NSMutableArray *)getAllSiteFromTable{
    SiteDao *daosite=[[SiteDao alloc]init];
    return [daosite getAllSiteFromTable];

}
- (NSMutableArray *)getAllSiteFromTableForFilter{
    SiteDao *daosite=[[SiteDao alloc]init];
    return [daosite getAllSiteFromTableForFilter];
    
}
@end
