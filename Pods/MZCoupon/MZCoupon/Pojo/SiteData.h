//
//  SiteData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface SiteData : MZJastor

@property (nonatomic, strong) NSString *siteId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *siteName;
@property (nonatomic, strong) NSString *siteAddress;
@property (nonatomic, strong) NSString *siteLatitude;
@property (nonatomic, strong) NSString *siteLongitude;
@property (nonatomic, strong) NSString *siteLocation;
@property (nonatomic, strong) NSString *siteEmailId;
@property (nonatomic, strong) NSString *siteOnlineStatus;
@property (nonatomic, strong) NSString *siteContact;
@property (nonatomic, strong) NSString *siteStatus;
@property (nonatomic, strong) NSString *siteRedeemPass;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *locationId;
@property (nonatomic, strong) NSString *markStatus;
@property (nonatomic, strong) NSString *campStatus;
@property (nonatomic, strong) NSString *siteDesc;
@property (nonatomic, strong) NSString *siteDisplayWallet;
@property (nonatomic, strong) NSString *siteSeqNo;
@property (nonatomic, strong) NSString *siteImageurl;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *updatedBy;

@end

