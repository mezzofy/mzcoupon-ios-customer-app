//
//  CustomCell.m
//  EB
//
//  Created by Kaliyarajalu on 02/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize lblCategoryName;
@synthesize imgSpecials;
@synthesize lblCategoryCount;
@synthesize lbltitle;
@synthesize lbldesc;
@synthesize imgevent;
@synthesize btnClear;
@synthesize lblKM;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
