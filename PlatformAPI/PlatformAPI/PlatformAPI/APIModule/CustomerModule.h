//
//  CustomerModule.h
//  RgWallet
//
//  Created by Inforios on 15/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblCustomerData.h"
#import "TblCustomerDeviceModel.h"
#import "TblCustomerModel.h"

@interface CustomerModule : NSObject
//Login
- (NSString *)loginwithserver:(TblCustomerDeviceModel *)pdevicemod;
//Customer Group
- (BOOL)getCustomerGroupFromServer;
//FacebookLogin
- (NSString *)faceboookloginwithserver:(TblCustomerDeviceModel *)pdevicemod;
//Edit Profile
- (NSString *)putEditProfileDatatoServer:(TblCustomerModel*)pcustomermodel;
//Forgot Password
- (NSString *)sendForgetPasswordToServer:(TblCustomerModel*)pcustomermodel;
//Change Password
- (NSString *)sendChangePasswordToServer:(TblCustomerModel*)pcustomermodel;

//Check Customer
-(TblCustomerData *)CheckUserAvaliable:(NSString *)pemailId;


@end
