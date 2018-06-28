//
//  WalletTopTransaction.m
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZWalletTopUpTransaction.h"

@implementation MZWalletTopUpTransaction

- (MZWalletTransactionResponse *)WalletTransactionCreate:(WalletTxnDataModel *)pwalletTxnmodel{
    MZWalletTransactionResponse *returnvalue=[[MZWalletTransactionResponse alloc]init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pwalletTxnmodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[MZUtils urlPostRequest:[NSString stringWithFormat:@"api/v1/wallettxn"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZWalletTransactionResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;
    
}
- (MZWalletTransactionResponse *)WalletTopUpTransationByTransactionId:(NSString *)pTransationId{
    MZWalletTransactionResponse *returnvalue=[[MZWalletTransactionResponse alloc]init];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/wallettxn/%@",pTransationId] param:Nil];
    if(data) {
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
            returnvalue=[[MZWalletTransactionResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    return returnvalue;

 
}
- (MZWalletTransactionListResponse *)GetWalletTransactions:(NSString *)pStatus Offset:(NSInteger )poffsetId{
    
    MZWalletTransactionListResponse *returnvalue=[[MZWalletTransactionListResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[MZCouponConfig getCustomerId] forKey:@"customerid"];
    [reqparam setValue:pStatus forKey:@"status"];
    [reqparam setValue:[NSNumber numberWithInteger:poffsetId] forKey:@"page"];
    
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/wallettxn"] param:reqparam];
    if(data) {
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (json)
            returnvalue=[[MZWalletTransactionListResponse alloc]initWithDictionary:json];
        
        [returnvalue setError:error];
    }
    
    return returnvalue;
}

@end
