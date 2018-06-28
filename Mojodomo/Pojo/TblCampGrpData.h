//
//  TblCampGrpData.h
//  Mezzofy Customer
//
//  Created by Vasanth Inforios on 13/12/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblCampGrpData : Jastor

@property (nonatomic, strong)NSString* campgrpId;
@property (nonatomic, strong)NSString* merchantId;
@property (nonatomic, strong)NSString* campgrpName;
@property (nonatomic, strong)NSString* campgrpImageurl;
@property (nonatomic, assign)NSUInteger campgrpSeq;
@property (nonatomic, strong)NSString* campgrpStatus;
@property (nonatomic, strong)NSString* hashCode;
@property (nonatomic, strong)NSString* updatedOn;
@end
