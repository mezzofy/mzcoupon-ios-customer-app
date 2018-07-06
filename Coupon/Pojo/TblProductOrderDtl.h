//
//  TblProductOrderDtl.h
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblProductOrderDtl : Jastor
@property (nonatomic, strong) NSString* podtlId;
@property (nonatomic, strong) NSString* productId;
@property (nonatomic, strong) NSString* campaignId;
@property (nonatomic, strong) NSString* poId;
@property (nonatomic, strong) NSString* campaignName;
@property (nonatomic, strong) NSString* campaignPrice;
@property (nonatomic, strong) NSString* campaignQty;
@property (nonatomic, strong) NSString* campaignTotal;
@property (nonatomic, strong) NSString* status;
@property (nonatomic, strong) NSString* updatedOn;
@property (nonatomic, strong) NSString* delflag;
@end
