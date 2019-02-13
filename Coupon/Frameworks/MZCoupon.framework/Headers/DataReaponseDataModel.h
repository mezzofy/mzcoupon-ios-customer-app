//
//  DataReaponseDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface DataReaponseDataModel : MZJastor

@property (nonatomic, copy) NSNumber *pagesize;
@property (nonatomic, copy) NSNumber *totalsize;
@property (nonatomic, copy) NSNumber *resultsize;

@end
