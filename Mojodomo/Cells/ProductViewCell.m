//
//  ProductViewCell.m
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "ProductViewCell.h"

@implementation ProductViewCell
@synthesize imgProduct;
@synthesize lblMerchantName;
@synthesize lblProductName;
@synthesize lblProductDesc;
@synthesize lblOriginalPrice;
@synthesize lblPrice;
@synthesize lblBrandName;
@synthesize btnFavourite;
@synthesize btnShare;
@synthesize txttermcond;
@synthesize lblemail;



@synthesize lblFreeText1;
@synthesize lblFreeText2;
@synthesize lblFreeText3;

@synthesize btnSupport;

@synthesize lblSiteName;
@synthesize lblQty;
@synthesize txtQty;
@synthesize stepper;
@synthesize btnAddUpdateCart;
@synthesize imgCatg;
@synthesize lblCategoryName;
@synthesize imgSpecials;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
