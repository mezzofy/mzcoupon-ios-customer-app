//
//  RegsisterModule.h
//  ProWallet
//
//  Created by Inforios on 04/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblCustomerModel.h"
#import <MZCoupon/MZCoupon.h>

@interface RegsisterModule : NSObject
//Country List
- (NSMutableArray *)getCountryListFromServer;
//New Register 
- (NSString *)postRegsisterDatatoServer:(CustomerDataModel *)pcustomermodel;

@end
