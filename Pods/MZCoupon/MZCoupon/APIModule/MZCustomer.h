//
//  MZCustomer.h
//  RgWallet
//
//  Created by Mezzofy on 15/09/15.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomerData.h"
#import "CustomerDeviceDataModel.h"
#import "CustomerDataModel.h"
#import "MZCustomerResponse.h"
#import "MZCustomerGroupResponse.h"

@interface MZCustomer : NSObject
//Login
-(MZCustomerResponse *)LoginPlatform:(CustomerDeviceDataModel *)pdevicemod;
//Customer Group
- (MZCustomerGroupResponse *)GetCustomerGroupById:(NSString *)pcustomerGroupId;
//FacebookLogin
- (MZCustomerResponse *)LoginFacebook:(CustomerDeviceDataModel *)pdevicemod;
//Edit Profile
- (MZCustomerResponse *)CustomerUpdate:(NSString *)CustomerID CustomerData:(CustomerDataModel*)pcustomermodel;
//Forgot Password
- (MZCustomerResponse *)PasswordForgot:(CustomerDataModel*)pcustomermodel;
//Change Password
- (MZCustomerResponse *)PasswordChange:(CustomerDataModel*)pcustomermodel;

//Check Customer
-(MZCustomerResponse *)CheckUserAvaliable:(NSString *)pemailId;

@end
