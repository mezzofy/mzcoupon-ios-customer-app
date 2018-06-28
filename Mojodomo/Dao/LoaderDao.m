//
//  LoaderDao.m
//  ProMerchant
//
//  Created by Inforios on 29/06/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "LoaderDao.h"
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"
@implementation LoaderDao
- (void)UpdateDeleteFlagBeforeServerCall:(NSString *)tblname{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"Update %@ set delflag = 'Y'",tblname]];
    [database close];
}
- (void)UpdateSyncflagBeforeServerCallCampaign:(NSString *)tblname Campaignstatus:(NSString *)pcampaignstatus{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"Update %@ set delflag = 'Y' Where campaignStatus = '%@' ",tblname,pcampaignstatus]];
    [database close];
}


- (void)DeleteDataFromDataBaseWhereDelFlagEnable:(NSString *)tblname{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"delete from %@ where delflag = 'Y'",tblname]];
    [database close];
}
- (BOOL)updateDeleteFlagDataFromServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId  {
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval = [database executeUpdate:[NSString stringWithFormat:@"update %@ set delflag = 'N' where %@ = '%@'",tblname,pcolumname,ptblId]];
    [database close];
    return retval;
}
- (BOOL)updateDeleteFlagDataBeforeCallServer:(NSString *)tblname tblcolumname:(NSString *)pcolumname tableid:(NSString *)ptblId  {
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval = [database executeUpdate:[NSString stringWithFormat:@"update %@ set delflag = 'Y' where %@ = '%@'",tblname,pcolumname,ptblId]];
    [database close];
    return retval;
}
- (void)DeleteDataFromDatabase:(NSString *)tblname{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"delete from %@ ",tblname]];
    [database close];
}
- (void)RemoveDataFromDatabasetblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"delete from %@ where %@ = '%@'",tblname,pcolumnn,ptblId]];
    [database close];
}

- (void)RemoveDataFromDatabaseWithDeleteFlagtblname:(NSString *)tblname wheretblcolumn:(NSString *)pcolumnn tableid:(NSString *)ptblId{
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"delete from %@ where %@ = '%@' AND delflag = 'Y'",tblname,pcolumnn,ptblId]];
    [database close];
}
- (void)updateFlagDataFromServer:(NSString *)tblname flagname:(NSString *)pflagname flagvalue:(NSString *)pflagvalue tblindex:(NSString *)pindex tblvalue:(NSString *)pvalue {
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    [database executeUpdate:[NSString stringWithFormat:@"update %@ set %@ = '%@' where %@ = '%@'",tblname,pflagname,pflagvalue,pindex,pvalue]];
    [database close];
}
@end
