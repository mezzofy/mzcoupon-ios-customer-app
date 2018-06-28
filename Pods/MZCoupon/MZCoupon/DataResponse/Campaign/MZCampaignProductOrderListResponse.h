//
//  MZCampaignProductOrderListResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 12/03/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "ProductOrderListDataModel.h"

@interface MZCampaignProductOrderListResponse : MZJastor
@property(nonatomic,strong)NSMutableArray *pos;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
