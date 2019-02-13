//
//  CampaignData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface CampaignData : MZJastor
@property (nonatomic, copy) NSString* campgrpId;
@property (nonatomic, copy) NSString* campgrpImageurl;
@property (nonatomic, copy) NSString* campgrpName;
@property (nonatomic, copy) NSString* campgrpSeq;
@property (nonatomic, copy) NSString* campgrpStatus;
@property (nonatomic, copy) NSString* hashCode;
@property (nonatomic, copy) NSString* merchantId;
@property (nonatomic, copy) NSString* updatedOn;
@end
