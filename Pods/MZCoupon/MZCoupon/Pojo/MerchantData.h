//
//  MerchantData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface MerchantData : MZJastor


@property (nonatomic, strong) NSString* countryCode;
@property (nonatomic, strong) NSString* merchantId;
@property (nonatomic, strong) NSString* merchantCode;
@property (nonatomic, strong) NSString* merchantType;
@property (nonatomic, strong) NSString* merchantName;
@property (nonatomic, strong) NSString* merchantDesc;
@property (nonatomic, strong) NSString* merchantLogourl;
@property (nonatomic, strong) NSString* merchantImageurl;
@property (nonatomic, strong) NSString* merchantTc;
@property (nonatomic, strong) NSString* hashCode;
@property (nonatomic, strong) NSString* profileStatus;
@property (nonatomic, strong) NSString* merchantHotline;
@property (nonatomic, strong) NSString* merchantStatus;
@property (nonatomic, strong) NSString* merchantTimezone;
@property (nonatomic, strong) NSString* merchantEmail;
@property (nonatomic, strong) NSString* countryName;
@property (nonatomic, strong) NSString* channelCode;
@property (nonatomic, strong) NSString* currency;
@end
