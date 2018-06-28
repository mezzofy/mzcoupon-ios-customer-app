//
//  TblOrderModifierData.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblOrderModifierData : Jastor
@property (nonatomic, strong) NSString *orderModifierId;
@property (nonatomic, strong) NSString *orderItemId;
@property (nonatomic, strong) NSString *modifierId;
@property (nonatomic, strong) NSString *modifierName;
@end
