//
//  TblOrderItemData.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblOrderItemData : Jastor
@property (nonatomic, strong) NSString *orderItemId;
@property (nonatomic, strong) NSString *couponId;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *groupName;
@end
