//
//  SettingsDao.m
//  ProWallet
//
//  Created by Inforios on 26/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "SettingsDao.h"
#import "Utils.h"
#import "FMDatabase.h"

@implementation SettingsDao
-(void)setValue:(NSString *)pkey Value:(NSString *)pvalue {
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    [database executeUpdate:@"insert into tbl_settings (settings_key, settings_value) values(?,?)", pkey, pvalue];
    [database close];
}

-(NSString *)getValue:(NSString *)pkey {
    NSString *retval = NULL;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT settings_value FROM tbl_settings WHERE settings_key = ?",pkey];
    
    if ([res next]) {
        retval = [res stringForColumnIndex:0];
    }
    
    [database close];
    
    return retval;
}
-(void)UpdateSettings:(NSString *)pkey Value:(NSString *)pvalue {
    FMDatabase *database = [FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    [database executeUpdate:@"update tbl_settings set settings_value=? WHERE settings_key=?", pvalue, pkey];
    
    [database close];
    
}
@end
