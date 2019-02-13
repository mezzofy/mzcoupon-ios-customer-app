//
//  WalletTxnListModel.h
//  Mezzofy
//
//  Created by Mezzofy on 15/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "WalletTxnDataModel.h"


@interface WalletTxnListDataModel : MZJastor

@property (nonatomic , strong)NSMutableArray *wallettxns;

@end
