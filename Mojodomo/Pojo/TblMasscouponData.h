//
//  TblMasscouponData.h
//  ProWallet
//
//  Created by Inforios on 13/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblMasscouponData : Jastor

@property (strong, nonatomic)NSString *massId;
@property (strong, nonatomic)NSString *merchantId;
@property (strong, nonatomic)NSString *siteId;
@property (strong, nonatomic)NSString *customerId;
@property (strong, nonatomic)NSString *referenceNo;
@property (strong, nonatomic)NSString *massStatus;
@property (strong, nonatomic)NSString *updatedOn;

@end
