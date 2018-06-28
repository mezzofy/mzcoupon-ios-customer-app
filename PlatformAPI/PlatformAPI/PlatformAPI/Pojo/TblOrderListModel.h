//
//  TblOrderListModel.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblOrderModel.h"
#import "DataResponseSize.h"
@interface TblOrderListModel : Jastor
@property(nonatomic,strong)NSMutableArray *orders;
@property(nonatomic ,strong)DataResponseSize *size;
@end
