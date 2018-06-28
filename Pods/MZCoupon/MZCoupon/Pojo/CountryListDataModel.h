//
//  CountryListDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"
#import "CountryDataModel.h"

@interface CountryListDataModel : MZJastor

@property (nonatomic, strong) NSMutableArray *countries;

@end
