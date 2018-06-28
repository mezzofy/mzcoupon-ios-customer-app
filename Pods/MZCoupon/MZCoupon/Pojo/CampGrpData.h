//
//  CampGrpData.h
//  Mezzofy
//
//  Created by Mezzofy on 13/12/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface CampGrpData : MZJastor

@property (nonatomic, strong)NSString* campgrpId;
@property (nonatomic, strong)NSString* merchantId;
@property (nonatomic, strong)NSString* campgrpName;
@property (nonatomic, strong)NSString* campgrpImageurl;
@property (nonatomic, assign)NSUInteger campgrpSeq;
@property (nonatomic, strong)NSString* campgrpStatus;
@property (nonatomic, strong)NSString* hashCode;
@property (nonatomic, strong)NSString* updatedOn;
@end
