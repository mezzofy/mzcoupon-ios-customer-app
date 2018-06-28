//
//  CustomerGroupData.h
//  Mezzofy
//
//  Created by Mezzofy on 07/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"


@interface CustomerGroupData : MZJastor

@property (nonatomic, strong) NSString *customerGroupId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *groupStatus;
@property (nonatomic, strong) NSString *dollarSpending;
@property (nonatomic, strong) NSString *rewardPoint;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *updatedOn;


@end
