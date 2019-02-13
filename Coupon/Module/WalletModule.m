//
//  WalletModule.m
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "WalletModule.h"
#import "Utils.h"
#import "Common.h"
#import "TblWalletModel.h"
#import "WalletDao.h"
#import "LoaderModule.h"

@implementation WalletModule
- (void)getWalletFromServer{
    MZWalletResponse *objmezzofy=[[MZWalletResponse alloc]init];
    MZWallet *objMZWallet=[[MZWallet alloc]init];
    objmezzofy=[objMZWallet GetCustomerWallet];
    
            LoaderModule *modloader=[[LoaderModule alloc]init];
            WalletDao *objwallet=[[WalletDao alloc]init];
            if(objmezzofy.wallet.walletId){
                [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_wallet"];
                TblWalletData *wallet=[objwallet getWallet:objmezzofy.wallet.walletId];
                if([wallet.walletId isEqualToString:objmezzofy.wallet.walletId])
                    [objwallet UpdateWalletList:objmezzofy.wallet];
                else
                    [objwallet AddWalletList:objmezzofy.wallet];
            }
            [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_wallet"];
            
    
    
    
}

- (WalletData *)getWalletQRCODERequestFromServer{
    MZWalletResponse *objmezzofy=[[MZWalletResponse alloc]init];
    MZWallet *objMZWallet=[[MZWallet alloc]init];
    objmezzofy=[objMZWallet GetCustomerWalletQR];
    WalletData *objwallet=[[WalletData alloc]init];

            if(objmezzofy.wallet.walletId)
                objwallet=objmezzofy.wallet;
    return objwallet;
}


-(TblWalletData *)getwallet{
    WalletDao *daowallet=[[WalletDao alloc]init];
    return [daowallet getwallet];
}
@end
