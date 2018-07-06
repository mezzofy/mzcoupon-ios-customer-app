//
//  TblCampaign.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "Jastor.h"

@interface TblCampaign : Jastor
@property (nonatomic, copy) NSString* campgrpId;
@property (nonatomic, copy) NSString* campgrpImageurl;
@property (nonatomic, copy) NSString* campgrpName;
@property (nonatomic, copy) NSString* campgrpSeq;
@property (nonatomic, copy) NSString* campgrpStatus;
@property (nonatomic, copy) NSString* hashCode;
@property (nonatomic, copy) NSString* merchantId;
@property (nonatomic, copy) NSString* updatedOn;
@end
