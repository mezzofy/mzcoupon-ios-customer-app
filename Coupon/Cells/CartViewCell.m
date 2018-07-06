//
//  CartViewCell.m
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "CartViewCell.h"

@implementation CartViewCell
@synthesize imgProduct;
@synthesize lblProductName;
@synthesize lblProductQty;
@synthesize lblProductPrice;
@synthesize lblMerchtName;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
