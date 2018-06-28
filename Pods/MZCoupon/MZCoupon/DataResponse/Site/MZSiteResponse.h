//
//  MZSiteResponse.h
//  Mezzofy
//
//  Created by Vasanth Inforios on 27/02/18.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "SiteDataModel.h"
#import "DataReaponseDataModel.h"
@interface MZSiteResponse : MZJastor
@property (nonatomic, strong) NSMutableArray *sites;
@property (nonatomic, strong)DataReaponseDataModel* size;

@property (nonatomic, strong)NSError *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *developerMessage;
@end
