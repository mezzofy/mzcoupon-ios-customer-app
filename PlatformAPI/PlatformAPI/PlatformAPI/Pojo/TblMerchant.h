//
//  TblMerchant.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "Jastor.h"

@interface TblMerchant : Jastor

//@property (nonatomic, strong) NSNumber *merchantId;
//@property (nonatomic, strong) NSString *merchantName;
//@property (nonatomic, strong) NSString* merchantDesc;
//@property (nonatomic, strong) NSString* merchantLogo;
//@property (nonatomic, strong) NSString* backgroundImage;
//@property (nonatomic, strong) NSString* remark;
//@property (nonatomic, strong) NSString* status;

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
