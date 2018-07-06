//
//  SiteTableViewCell.m
//  EB
//
//  Created by Kris on 6/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "SiteTableViewCell.h"

@implementation SiteTableViewCell

@synthesize lblSiteName;
@synthesize lblSiteAddress;
@synthesize lblSiteContact;
@synthesize btnMap;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
