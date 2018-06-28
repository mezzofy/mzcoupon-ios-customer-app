//
//  MZPayment.m
//  ProWallet
//
//  Created by Inforios on 25/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MZPayment.h"

@implementation MZPayment
-(MZPaymentResponse *)GetPayments:(NSInteger )poffset {
    MZPaymentResponse *returnvalue=[[MZPaymentResponse alloc]init];
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"page"];
    NSData *data = [MZUtils urlGetRequest:[NSString stringWithFormat:@"api/v1/payments/paymentdtls"] param:reqparam];
    if(data){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json)
            returnvalue =[[MZPaymentResponse alloc]initWithDictionary:json];
        [returnvalue setError:error];

    }
    return returnvalue;
}

@end
