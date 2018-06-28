//
//  CouponCell.m
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "CouponCell.h"

@implementation CouponCell
@synthesize prodimg, lblcouponno, lblexpiryDate, lblmerchantname, lblorgprice, lblproductdesc, lblproductname, lblsellprice, lblcouponName,lblSiteName,lblCouponCount,stepperValue;
@synthesize imgBadge;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
