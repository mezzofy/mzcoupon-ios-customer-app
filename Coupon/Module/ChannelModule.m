//
//  ChannelModule.m
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "ChannelModule.h"

@implementation ChannelModule
- (void)getChannelListFromServer{
    MZChannelResponse *objchannel=[[MZChannelResponse alloc]init];
    MZChannel *modChannel=[[MZChannel alloc]init];
    objchannel=[modChannel GetChannelList];

    ChannelDao *daochannel=[[ChannelDao alloc]init];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_channel"];
    
    for(ChannelLocationDataModel *objchannelmod in objchannel.channellocations){
        TblChannelLocationData *objlocationdata=[[TblChannelLocationData alloc]init];
        objlocationdata=[daochannel getChannelLocationData:objchannelmod.location.channelLocId];
        
        if([objlocationdata.channelLocId isEqualToString:objchannelmod.location.channelLocId])
            [daochannel updateChannel:objchannelmod.location];
        else
            [daochannel addChannel:objchannelmod.location];
    }
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_channel"];

}

- (BOOL)addChannel:(ChannelLocationData *)pchanneldata{
    ChannelDao *daochannel=[[ChannelDao alloc]init];
    return [daochannel addChannel:pchanneldata];
}
- (BOOL)updateChannel:(ChannelLocationData *)pchanneldata
{
    ChannelDao *daochannel=[[ChannelDao alloc]init];
    return [daochannel updateChannel:pchanneldata];
}
- (TblChannelLocationData *)getChannelbyOffset:(NSString *)pChannelCode Offset:(NSInteger)poffset{
    ChannelDao *daochannel=[[ChannelDao alloc]init];
    return [daochannel getChannelbyOffset:pChannelCode Offset:poffset];
}
- (NSInteger)getChannelcount:(NSString *)pchannelCode{
    ChannelDao *daochannel=[[ChannelDao alloc]init];
    return [daochannel getChannelcount:pchannelCode];
}
@end
