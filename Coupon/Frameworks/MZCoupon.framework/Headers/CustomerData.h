//
//  CustomerData.h
//  Mezzofy
//
//  Created by Mezzofy on 25/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface CustomerData : MZJastor
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *customerGroupId;
@property (nonatomic, strong) NSString *customerFirstName;
@property (nonatomic, strong) NSString *customerLastName;
@property (nonatomic, strong) NSString *customerPassword;
@property (nonatomic, strong) NSString *customerEmail;
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *customerDob;
@property (nonatomic, strong) NSString *customerMobile;
@property (nonatomic, strong) NSString *customerGender;
@property (nonatomic, strong) NSString *customerAddress;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *vipNo;
@property (nonatomic, strong) NSString *dgvipNo;
@property (nonatomic, strong) NSString *fbToken;
@property (nonatomic, strong) NSString *customerStatus;
@property (nonatomic, strong) NSString *hashCode;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, strong) NSString *updatedOn;
@property (nonatomic, strong) NSString *updatedBy;
@property (nonatomic, strong) NSString *customerUsername;
@property (nonatomic, strong) NSString *customerImageUrl;
@end
