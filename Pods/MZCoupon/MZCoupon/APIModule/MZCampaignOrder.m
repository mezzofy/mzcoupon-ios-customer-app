//
//  MZCampaignOrder.m
//  ProWallet
//
//  Created by Inforios on 08/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZCampaignOrder.h"
#import "MZUtils.h"
#import "ProductOrderMasterData.h"
#import "ProductOrderListDataModel.h"
#import "ProductOrderDataModel.h"

@implementation MZCampaignOrder
- (MZCampaignProductOrderListResponse *)GetOrders:(NSInteger )pOffset{
    MZCampaignProductOrderListResponse *returnvalue=[[MZCampaignProductOrderListResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSString stringWithFormat:@"%@", [MZCouponConfig getCustomerId]] forKey:@"customerid"];
    [reqparam setValue:[NSNumber numberWithInteger:pOffset] forKey:@"page"];

  
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/pos"] param:reqparam];
    if(data){
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];

    if (json)
        returnvalue=[[MZCampaignProductOrderListResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}

@end
