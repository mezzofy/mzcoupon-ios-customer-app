//
//  TblCustomerGroupData.h
//  ProWallet
//
//  Created by Inforios on 07/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"


@interface TblCustomerGroupData : Jastor

@property (nonatomic, strong) NSString *customerGroupId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *groupStatus;
@property (nonatomic, strong) NSString *dollarSpending;
@property (nonatomic, strong) NSString *rewardPoint;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *delflag;

@end
