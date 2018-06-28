//
//  MZCustomer.m
//  RgWallet
//
//  Created by Mezzofy on 15/09/15.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZCustomer.h"
#import "CustomerDataModel.h"
#import "CustomerGroupListDataModel.h"
#import "MZUtils.h"


@implementation MZCustomer

-(MZCustomerResponse *)LoginPlatform:(CustomerDeviceDataModel *)pdevicemod{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pdevicemod toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/auth"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}
- (MZCustomerResponse *)LoginFacebook:(CustomerDeviceDataModel *)pdevicemod{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pdevicemod toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/facebookauth"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}

- (MZCustomerGroupResponse *)GetCustomerGroupById:(NSString *)pcustomerGroupId{
    MZCustomerGroupResponse *returnvalue=[[MZCustomerGroupResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/customergroups/%@",pcustomerGroupId] param:nil];
    if(data) {
        
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (json)
            returnvalue=[[MZCustomerGroupResponse alloc]initWithDictionary:json];
        [returnvalue setError:error];
    }
    return  returnvalue;
}
- (MZCustomerResponse *)CustomerUpdate:(CustomerDataModel*)pcustomermodel{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPutRequest:[NSString stringWithFormat:@"api/v1/customers/%@",[MZCouponConfig getCustomerId]] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}
- (MZCustomerResponse *)PasswordForgot:(CustomerDataModel*)pcustomermodel{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/forget"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}
- (MZCustomerResponse *)PasswordChange:(CustomerDataModel*)pcustomermodel{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPutRequest:[NSString stringWithFormat:@"api/v1/customers/changepassword"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}

-(MZCustomerResponse *)CheckUserAvaliable:(NSString *)pemailId{
    MZCustomerResponse *returnvalue=[[MZCustomerResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:pemailId forKey:@"email"];
    NSData *data =[MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/customers/customeremail"] param:reqparam];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZCustomerResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}

@end
