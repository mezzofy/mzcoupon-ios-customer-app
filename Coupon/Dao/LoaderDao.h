//
//  LoaderDao.h
//  ProMerchant
//
//  Created by Inforios on 29/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoaderDao : NSObject
- (void)UpdateDeleteFlagBeforeServerCall:(NSString *)tblname;
- (void)DeleteDataFromDataBaseWhereDelFlagEnable:(NSString *)tblname;

- (void)DeleteDataFromDatabase:(NSString *)tblname;
- (BOOL)updateDeleteFlagDataFromServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId;
- (void)RemoveDataFromDatabasetblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId;
- (void)UpdateSyncflagBeforeServerCallCampaign:(NSString *)tblname Campaignstatus:(NSString *)pcampaignstatus;
- (void)RemoveDataFromDatabaseWithDeleteFlagtblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId;
- (void)updateFlagDataFromServer:(NSString *)tblname flagname:(NSString *)pflagname flagvalue:(NSString *)pflagvalue tblindex:(NSString *)pindex tblvalue:(NSString *)pvalue;
- (BOOL)updateDeleteFlagDataBeforeCallServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId ;
@end
