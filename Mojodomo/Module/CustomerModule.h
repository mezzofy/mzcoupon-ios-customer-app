//
//  CustomerModule.h
//  RgWallet
//
//  Created by Inforios on 15/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblCustomerData.h"
#import "CustomerDao.h"
#import "TblCustomerDeviceModel.h"
#import "TblCustomerModel.h"

@interface CustomerModule : NSObject
//Login
- (NSString *)loginwithserver:(CustomerDeviceDataModel *)pdevicemod;
//Customer Group
- (BOOL)getCustomerGroupFromServer;
//FacebookLogin
- (NSString *)faceboookloginwithserver:(CustomerDeviceDataModel *)pdevicemod;
//Edit Profile
- (NSString *)putEditProfileDatatoServer:(CustomerDataModel*)pcustomermodel;
//Forgot Password
- (NSString *)sendForgetPasswordToServer:(CustomerDataModel*)pcustomermodel;
//Change Password
- (NSString *)sendChangePasswordToServer:(CustomerDataModel*)pcustomermodel;

//Check Customer
-(CustomerData *)CheckUserAvaliable:(NSString *)pemailId;

//DataBase
- (TblCustomerData *)getCustmerList;
- (BOOL)AddCustomerList:(CustomerData *)pcustomerdata;

@end
