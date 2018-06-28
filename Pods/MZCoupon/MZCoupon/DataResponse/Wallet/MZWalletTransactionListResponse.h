//
//  MZWalletTransactionListResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//


#import "MZJastor.h"
#import "WalletTxnDataModel.h"
#import "DataReaponseDataModel.h"

@interface MZWalletTransactionListResponse : MZJastor
@property (nonatomic , strong)NSMutableArray *wallettxns;

@property (nonatomic, strong)DataReaponseDataModel* size;
@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;

@end
