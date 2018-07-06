//
//  WalletTopTransactionModule.m
//  ProWallet
//
//  Created by Inforios on 15/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "WalletTopUpTransactionModule.h"
#import "LoaderModule.h"
#import "WalletTopUpTransactionDao.h"

@implementation WalletTopUpTransactionModule

- (NSString *)PostWalletTopUpTransationDataToServer:(WalletTxnDataModel *)pwalletTxnmodel{
    NSString *retval=@"";
    MZWalletTransactionResponse *objmezzofy=[[MZWalletTransactionResponse alloc]init];
    MZWalletTopUpTransaction *objMZWalleTopup=[[MZWalletTopUpTransaction alloc]init];
    objmezzofy=[objMZWalleTopup WalletTransactionCreate:pwalletTxnmodel];

        if(objmezzofy.wallettxn.customerId){
            retval=@"SUCCESS";
        }
        else
            retval=[objmezzofy message];
    
    return retval;
    
}
- (NSString *)getWalletTopUpTransationDataFromServer:(NSString *)pTransationId{
    NSString *retval=@"";
    MZWalletTransactionResponse *objmezzofy=[[MZWalletTransactionResponse alloc]init];
    MZWalletTopUpTransaction *objMZWalleTopup=[[MZWalletTopUpTransaction alloc]init];
    objmezzofy=[objMZWalleTopup WalletTopUpTransationByTransactionId:pTransationId];

            if(objmezzofy.wallettxn.transactionReference)
                retval=[NSString stringWithFormat:@"%@",objmezzofy.wallettxn.transactionReference];

    return retval;

}
- (void)getWalletAllTransationListFromServer:(NSString *)pStatus Offset:(NSUInteger )poffsetId{
    
    
    MZWalletTransactionListResponse *objmezzofy=[[MZWalletTransactionListResponse alloc]init];
    MZWalletTopUpTransaction *objMZWalleTopup=[[MZWalletTopUpTransaction alloc]init];
    objmezzofy=[objMZWalleTopup GetWalletTransactions:[Common getCustomerId] Status:pStatus Offset:poffsetId];
            LoaderModule *modloader=[[LoaderModule alloc]init];
            WalletTopUpTransactionDao *daowallet=[[WalletTopUpTransactionDao alloc]init];
            if(poffsetId==1)
                [modloader updateDeleteFlagDataBeforeCallServer:@"tbl_wallet_transcation" tblcolumname:@"status" tableid:pStatus];
            for(WalletTxnDataModel *objwallet in objmezzofy.wallettxns){
                TblWalletTxnData *objwalletdata=[[TblWalletTxnData alloc]init];
                objwalletdata =[daowallet getWalletTransaction:objwallet.wallettxn.transactionReference];
                if([objwalletdata.transactionReference isEqualToString:objwallet.wallettxn.transactionReference])
                    [daowallet UpdateWalletTransactionList:objwallet.wallettxn];
                else
                    [daowallet AddWalletTransactionList:objwallet.wallettxn];
            }
            [modloader RemoveDataFromDatabaseWithDeleteFlagtblname:@"tbl_wallet_transcation" wheretblcolumn:@"status" tableid:pStatus];
    

    
    
}

- (TblWalletTxnData *)getWalletTransactionbyOffset:(NSInteger)poffset Status:(NSString *)pstatus{
    WalletTopUpTransactionDao *daowallet=[[WalletTopUpTransactionDao alloc]init];
    return [daowallet getWalletTransactionbyOffset:poffset Status:pstatus];
}
- (NSInteger)getWalletTransactioncountStatus:(NSString *)pstatus{
    WalletTopUpTransactionDao *daowallet=[[WalletTopUpTransactionDao alloc]init];
    return [daowallet getWalletTransactioncountStatus:pstatus];
}
@end
