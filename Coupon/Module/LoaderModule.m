//
//  LoaderModule.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "LoaderModule.h"
#import "LoaderDao.h"
#import "TblCampaignGroups.h"
#import "TblCampaignGroupDtl.h"
#import "CampaingroupDao.h"
@implementation LoaderModule
    

- (void)UpdateDeleteFlagBeforeServerCall:(NSString *)tblname{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader UpdateDeleteFlagBeforeServerCall:tblname];
    
}
- (void)DeleteDataFromDataBaseWhereDelFlagEnable:(NSString *)tblname{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader DeleteDataFromDataBaseWhereDelFlagEnable:tblname];
    
}
- (void)RemoveDataFromDatabaseWithDeleteFlagtblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader RemoveDataFromDatabaseWithDeleteFlagtblname:tblname wheretblcolumn:pcolumnn tableid:ptblId];
}
- (void)DeleteDataFromDatabase:(NSString *)tblname{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader DeleteDataFromDatabase:tblname];
    
}
- (BOOL)updateDeleteFlagDataFromServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
   return  [daoloader updateDeleteFlagDataFromServer:tblname tblcolumname:pcolumname tableid:ptblId];
    
}
- (BOOL)updateDeleteFlagDataBeforeCallServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId {
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    return [daoloader updateDeleteFlagDataBeforeCallServer:tblname tblcolumname:pcolumname tableid:ptblId];

}
- (void)RemoveDataFromDatabasetblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId{
  LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader RemoveDataFromDatabasetblname:tblname wheretblcolumn:pcolumnn tableid:ptblId];
    
}
- (void)UpdateSyncflagBeforeServerCallCampaign:(NSString *)tblname Campaignstatus:(NSString *)pcampaignstatus{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader UpdateSyncflagBeforeServerCallCampaign:tblname Campaignstatus:pcampaignstatus];
    
}
- (void)updateFlagDataFromServer:(NSString *)tblname flagname:(NSString *)pflagname flagvalue:(NSString *)pflagvalue tblindex:(NSString *)pindex tblvalue:(NSString *)pvalue{
    LoaderDao *daoloader=[[LoaderDao alloc]init];
    [daoloader updateFlagDataFromServer:tblname flagname:pflagname flagvalue:pflagvalue tblindex:pindex tblvalue:pvalue];
}


@end
