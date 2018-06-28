//
//  MerchantModule.m
//  ProWallet
//
//  Created by Inforios on 28/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "MerchantModule.h"
#import "Common.h"
#import "Utils.h"
#import "MerchantDao.h"
#import "TblMerchantModel.h"

@implementation MerchantModule
- (void)MerchantDetailsFromServer {
    MZMerchantResponse *objmezzofy=[MZMerchantResponse alloc];
    MZMerchant * objMZMerchant=[[MZMerchant alloc]init];
    objmezzofy=[objMZMerchant GetMerchantById:[Common merchantid]];
    
    
    MerchantDao *daomerchant = [[MerchantDao alloc]init];
    if(objmezzofy.merchant.merchantId){
        [daomerchant deleteMerchant];
        [daomerchant addMerchant:objmezzofy.merchant];
    }
}
- (TblMerchant *)getMerchant:(NSString *)pmerchantId{
    MerchantDao *daomerchant=[[MerchantDao alloc]init];
    return [daomerchant getMerchant:pmerchantId];
}
@end
