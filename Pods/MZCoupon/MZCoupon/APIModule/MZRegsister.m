//
//  MZRegsister.m
//  ProWallet
//
//  Created by Inforios on 04/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZRegsister.h"
#import "MZUtils.h"
#import "CountryListDataModel.h"

@implementation MZRegsister
- (MZCountryResponse *)GetCountties{
    MZCountryResponse *returnvalue=[[MZCountryResponse alloc]init];
    NSData *data = [MZUtils urlRegGetRequest:[NSString stringWithFormat:@"api/v1/countries"] param:nil];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCountryResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
        
    }
    return returnvalue;
}
- (MZRegsisterResponse *)CustomerSignup:(CustomerDataModel *)pcustomermodel{
    MZRegsisterResponse *returnvalue=[[MZRegsisterResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        if(json)
            returnvalue=[[MZRegsisterResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;

}

@end
