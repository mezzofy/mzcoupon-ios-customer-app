//
//  MZMerchantResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 26/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//


#import "MZJastor.h"
#import "MerchantData.h"
@interface MZMerchantResponse : MZJastor

@property (nonatomic, strong) MerchantData *merchant;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
