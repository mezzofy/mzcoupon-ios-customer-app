//
//  MZMerchant.m
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZMerchant.h"


#import "MerchantDataModel.h"

@implementation MZMerchant
- (MZMerchantResponse *)GetMerchantById:(NSString *)pmerchantId {
    MZMerchantResponse *returnvalue=[[MZMerchantResponse alloc]init];
    NSString *strMerc =[NSString stringWithFormat:@"api/v1/merchants/%@",pmerchantId];
    
    NSData *data = [MZUtils urlRegGetRequest:strMerc param:nil];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if (json)
            returnvalue = [[MZMerchantResponse alloc]initWithDictionary:json];
 
        [returnvalue setError:error];
        
    }
    return returnvalue;
}

@end
