//
//  ChannelDao.m
//  Coupon
//
//  Created by Vasanth Inforios on 08/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "ChannelDao.h"
#import "Utils.h"

@implementation ChannelDao
- (BOOL)addChannel:(ChannelLocationData *)pchanneldata{
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"insert into tbl_channel (channelLocId , merchantId , countryCode , countryName , merchantName , timeZone , channelCode , channelAddress , googleAddress , headerImage , latitude , channelRemark , channelImage , longitude , channelDesc , qrImage , channelUrl , targetUrl , channelStatus , connectCount , createdBy , createdOn , updatedOn , delflag ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')",pchanneldata.channelLocId, pchanneldata.merchantId, pchanneldata.countryCode, pchanneldata.countryName, pchanneldata.merchantName, pchanneldata.timeZone, pchanneldata.channelCode, pchanneldata.channelAddress, pchanneldata.googleAddress, pchanneldata.headerImage, pchanneldata.latitude, pchanneldata.channelRemark, pchanneldata.channelImage, pchanneldata.longitude, pchanneldata.channelDesc, pchanneldata.qrImage, pchanneldata.channelUrl, pchanneldata.targetUrl, pchanneldata.channelStatus, pchanneldata.connectCount, pchanneldata.createdBy, pchanneldata.createdOn, pchanneldata.updatedOn];
    
    
    [database close];
    return retval;
    
}

- (BOOL)updateChannel:(ChannelLocationData *)pchanneldata{
    
    
    BOOL retval = false;
    
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval = [database executeUpdate:@"update tbl_channel set  merchantId = ? , countryCode = ?, countryName = ? , merchantName = ? , timeZone = ? , channelCode = ?, channelAddress = ? , googleAddress = ?, headerImage = ? , latitude = ?, channelRemark = ? , channelImage  = ?, longitude = ? , channelDesc = ?, qrImage = ? , channelUrl = ?, targetUrl = ?, channelStatus = ? , connectCount = ?, createdBy = ?, createdOn = ? , updatedOn = ?, delflag = 'N' where channelLocId = ?", pchanneldata.merchantId, pchanneldata.countryCode, pchanneldata.countryName, pchanneldata.merchantName, pchanneldata.timeZone, pchanneldata.channelCode, pchanneldata.channelAddress, pchanneldata.googleAddress, pchanneldata.headerImage, pchanneldata.latitude, pchanneldata.channelRemark, pchanneldata.channelImage, pchanneldata.longitude, pchanneldata.channelDesc, pchanneldata.qrImage, pchanneldata.channelUrl, pchanneldata.targetUrl, pchanneldata.channelStatus, pchanneldata.connectCount, pchanneldata.createdBy, pchanneldata.createdOn, pchanneldata.updatedOn,pchanneldata.channelLocId];
    
    
    [database close];
    return retval;
    
    
}
- (TblChannelLocationData *)getChannelbyOffset:(NSString *)pChannelCode Offset:(NSInteger)poffset{
    TblChannelLocationData *retval=[[TblChannelLocationData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM tbl_channel  where delflag='N'  LIMIT 1 OFFSET %ld ",(long)poffset];
    if([pChannelCode length] > 0){
        query = [NSString stringWithFormat:@"SELECT * FROM tbl_channel  WHERE (UPPER(channelCode) LIKE '%%%@%%') AND delflag='N' LIMIT 1 OFFSET %ld",[pChannelCode uppercaseString],(long)poffset];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        retval = [[TblChannelLocationData alloc]initWithDictionary:[res resultDictionary]];
    }
    
    [database close];
    
    return retval;
    
}
- (NSInteger)getChannelcount:(NSString *)pchannelCode{
    NSInteger count = 0;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    NSString* query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_channel where delflag='N' "];
    if([pchannelCode length] > 0){
        query = [NSString stringWithFormat:@"SELECT count(*) FROM tbl_channel  WHERE (UPPER(channelCode) LIKE '%%%@%%') AND delflag='N'  ",[pchannelCode uppercaseString]];
    }
    FMResultSet *res = [database executeQuery:query];
    if ([res next]) {
        count = [res intForColumnIndex:0];
    }
    
    [database close];
    return count;
}
- (TblChannelLocationData *)getChannelLocationData:(NSString *)pchannelLocId{
    TblChannelLocationData *retval=[[TblChannelLocationData alloc]init];
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *ressite = [database executeQuery:@"SELECT * FROM tbl_channel where channelLocId = ?  ",pchannelLocId];
    
    if ([ressite next]) {
        
        retval =[[TblChannelLocationData alloc]initWithDictionary:[ressite resultDictionary]];
        
    }
    
    [database close];
    
    return retval;
}
@end
