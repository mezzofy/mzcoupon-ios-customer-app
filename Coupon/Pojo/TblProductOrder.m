//
//  TblProductOrder.m
//  ProMerchant
//
//  Created by Inforios on 03/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblProductOrder.h"

@implementation TblProductOrder
@synthesize poId;
@synthesize merchantId;
@synthesize customerId;
@synthesize customerName;
@synthesize poDate;
@synthesize poNo;
@synthesize poTotal;
@synthesize poStatus;
@synthesize payReceipt;
@synthesize payResponse;
@synthesize transferTo;
@synthesize transferFrom;
@synthesize payToken;
@synthesize rewardPoint;
@synthesize hashCode;
@synthesize updatedOn;
@synthesize couponType;
@synthesize paymentDetailId;
@synthesize delflag;
@synthesize customercoupons;

+ (Class)customercoupons_class {
    return [TblCustomerCouponData class];
}

@end
