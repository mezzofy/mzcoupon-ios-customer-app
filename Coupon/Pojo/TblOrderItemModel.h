//
//  TblOrderItemModel.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"
#import "TblOrderItemData.h"
#import "TblOrderModifierModel.h"

@interface TblOrderItemModel : Jastor
@property(nonatomic ,strong)TblOrderItemData *orderitem;
@property(nonatomic,strong)NSMutableArray *ordermodifiers;
@end
