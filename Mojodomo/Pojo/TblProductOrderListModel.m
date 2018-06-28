//
//  TblProductOrderListModel.m
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblProductOrderListModel.h"
#import "TblProductOrderModel.h"
@implementation TblProductOrderListModel
@synthesize podetails;
@synthesize po;
+(Class)po_class{
    return [TblProductOrder class];
}
+(Class)podetails_class{
    return [TblProductOrderModel class];
}

@end
