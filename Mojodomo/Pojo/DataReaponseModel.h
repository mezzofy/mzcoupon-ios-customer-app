//
//  DataReaponseModel.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "Jastor.h"

@interface DataReaponseModel : Jastor

@property (nonatomic, copy) NSNumber *pagesize;
@property (nonatomic, copy) NSNumber *totalsize;
@property (nonatomic, copy) NSNumber *resultsize;

@property (nonatomic, copy) NSString *response_code;
@property (nonatomic, copy) NSString *response_msg;
@end
