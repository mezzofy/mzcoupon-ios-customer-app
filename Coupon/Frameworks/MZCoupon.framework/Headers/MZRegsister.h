//
//  MZRegsister.h
//  ProWallet
//
//  Created by Inforios on 04/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomerDataModel.h"
#import "MZCountryResponse.h"
#import "MZRegsisterResponse.h"

@interface MZRegsister : NSObject
//Country List
- (MZCountryResponse *)GetCountties;
//New Register
- (MZRegsisterResponse *)CustomerSignup:(CustomerDataModel *)pcustomermodel;

@end
