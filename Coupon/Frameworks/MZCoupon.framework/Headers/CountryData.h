//
//  CountryData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface CountryData : MZJastor


@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *countryStatus;

@end
