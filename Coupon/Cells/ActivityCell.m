//
//  ActivityCell.m
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell
@synthesize lblTxnId,lblTxnNo,lblTxnPrice;
@synthesize lblTxnDateTime;
@synthesize lblTxnStatus;
@synthesize lblTxnStaff;
@synthesize lblTxnMerchant;
@synthesize lblTxnOutlet;
@synthesize btndecline;
@synthesize btnapprove;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
