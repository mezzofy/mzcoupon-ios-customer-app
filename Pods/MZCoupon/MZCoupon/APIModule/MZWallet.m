//
//  Wallet.m
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZWallet.h"
#import "MZUtils.h"
#import "MZCouponConfig.h"




@implementation MZWallet
- (MZWalletResponse *)GetCustomerWallet{
    MZWalletResponse *returnvalue=[[MZWalletResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/wallet/balance/%@",[MZCouponConfig getCustomerId]] param:nil];
    NSError *error;
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue =[[MZWalletResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}

- (MZWalletResponse *)GetCustomerWalletQR{
    MZWalletResponse *returnvalue=[[MZWalletResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/wallet/qrrequest/%@",[MZCouponConfig getCustomerId]] param:nil];
    NSError *error;
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue =[[MZWalletResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
}
@end
