//
//  ProductOrderData.m
//  Mezzofy
//
//  Created by Mezzofy on 03/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "ProductOrderData.h"

@implementation ProductOrderData
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

@synthesize customercoupons;

+ (Class)customercoupons_class {
    return [CustomerCouponData class];
}

@end
