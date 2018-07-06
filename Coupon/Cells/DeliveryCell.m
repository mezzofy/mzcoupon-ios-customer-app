//
//  DeliveryCell.m
//  EB
//
//  Created by Kaliyarajalu on 25/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "DeliveryCell.h"

@implementation DeliveryCell
@synthesize lblSelect;

@synthesize imgSite;
@synthesize lblSiteName;
@synthesize lblSiteAddress;
@synthesize lblContact;

@synthesize lblCompany;
@synthesize lblTime;
@synthesize txtName;
@synthesize txtContact;
@synthesize txtRemarks;
@synthesize btnOrder;
@synthesize btnConfirm;

@synthesize lblRemarks;
@synthesize txtaddres;
@synthesize mapview;
@synthesize textsetaddress;
@synthesize btnAdress;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
