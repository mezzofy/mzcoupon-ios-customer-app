//
//  MZCampaign.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZCampaign.h"
#import "CampaignSearchDataModel.h"



@implementation MZCampaign

- (MZCampaignResponse *)getCampaigns:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude  {
    MZCampaignResponse *returnvalue=[[MZCampaignResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];

    [reqparam setValue:[NSString stringWithFormat:@"A"] forKey:@"status"];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    if(!platitute)
        platitute=0.0f;
    if(!plongitude)
        plongitude=0.0f;
    
    [reqparam setValue:[NSNumber numberWithInteger:platitute] forKey:@"latitude"];
    [reqparam setValue:[NSNumber numberWithInteger:plongitude] forKey:@"longitude"];

    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/campaigns/customercampaigns"] param:reqparam];
    if(data) {
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            if (json){
                returnvalue =[[MZCampaignResponse alloc]initWithDictionary:json];
        }
            [returnvalue setError:error];
    }
        return returnvalue;
}
- (MZCampaignDetailResponse *)getCampaignById:(NSString *)pcampaignId Latitude:(double)platitute Longitude:(double)plongitude  {
    MZCampaignDetailResponse *returnvalue=[[MZCampaignDetailResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    
    [reqparam setValue:[NSString stringWithFormat:@"A"] forKey:@"status"];
    if(!platitute)
        platitute=0.0f;
    if(!plongitude)
        plongitude=0.0f;
    
    [reqparam setValue:[NSNumber numberWithInteger:platitute] forKey:@"latitude"];
    [reqparam setValue:[NSNumber numberWithInteger:plongitude] forKey:@"longitude"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/campaigns/campaigndistance/%@",pcampaignId] param:reqparam];
    if(data) {
        
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            if (json)
                returnvalue =[[MZCampaignDetailResponse alloc]initWithDictionary:json];
            
            [returnvalue setError:error];
        
    }
    return returnvalue;
}
- (MZCampaignResponse *)getCampaignsTop{
    MZCampaignResponse *returnvalue=[[MZCampaignResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/campaigns/topcoupon"] param:nil];
    if(data) {
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue =[[MZCampaignResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
        
    }
    return returnvalue;
}
- (MZCampaignGroupResponse *)getCampaignGroups:(double)platitute Longitude:(double)plongitude{
    MZCampaignGroupResponse *returnvalue=[[MZCampaignGroupResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/campaigngroups"] param:nil];
    if(data) {
        
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            if (json)
                returnvalue=[[MZCampaignGroupResponse alloc]initWithDictionary:json];
                
            [returnvalue setError:error];
            

            }
    return returnvalue;
}
- (MZCampaignResponse *)getCampaignsWithFilter:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude Filtersite:(NSMutableArray *)pfiltersite FilterCampaignGroup:(NSMutableArray *)pfiltercampaigngroup  {
    
    MZCampaignResponse *returnvalue=[[MZCampaignResponse alloc]init];
    CampaignSearchDataModel *objsearch=[[CampaignSearchDataModel alloc]init];
    [objsearch setPage:poffset];
    if(pfiltersite.count>0)
    [objsearch setSites:pfiltersite];
    if(pfiltercampaigngroup.count>0)
    [objsearch setGroups:pfiltercampaigngroup];
    [objsearch setLatitude:[NSString stringWithFormat:@"%f",platitute]];
    [objsearch setLongitude:[NSString stringWithFormat:@"%f",plongitude]];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[objsearch toDictionary] options:kNilOptions error:&error];
    NSData *data = [MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/campaigns/campaignsearch"] body:jsonData];
    if(data) {

            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            if (json)
                returnvalue =[[MZCampaignResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
                
    }
    return returnvalue;
}

@end
