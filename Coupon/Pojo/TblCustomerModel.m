//
//  Tbl_CustomerModel.m
//  ProWallet
//
//  Created by Inforios on 25/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblCustomerModel.h"

@implementation TblCustomerModel
@synthesize customer;

+(Class)customer_class{
    return [TblCustomerData class];
}
@end
