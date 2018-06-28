//
//  MZSite.m
//  ProWallet
//
//  Created by Inforios on 10/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZSite.h"
#import "MZUtils.h"



@implementation MZSite
- (MZSiteResponse *)GetMerchantSites:(NSUInteger)poffset{
    MZSiteResponse *returnvalue=[[MZSiteResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/sites"] param:reqparam];
    if(data) {
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            if (json)
                returnvalue =[[MZSiteResponse alloc]initWithDictionary:json];
                
            [returnvalue setError:error];
        }
    return returnvalue;
}

@end
