//
//  CustomItemCell.m
//  EB
//
//  Created by Kaliyarajalu on 26/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "CustomItemCell.h"

@implementation CustomItemCell
@synthesize lblItemName;
@synthesize lblCategory;
@synthesize lblBoh;

@synthesize lblOptions;
@synthesize lblPreviewItem;
@synthesize btnConfirm;
@synthesize btnCheckMark;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
