//
//  CustomItemCell.h
//  EB
//
//  Created by Kaliyarajalu on 26/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWTableViewCell.h"

@interface CustomItemCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lblItemName;
@property (nonatomic, retain) IBOutlet UILabel *lblCategory;
@property (nonatomic, retain) IBOutlet UILabel *lblBoh;

@property (nonatomic, retain) IBOutlet UILabel *lblOptions;
@property (nonatomic, retain) IBOutlet UILabel *lblPreviewItem;

@property (nonatomic, retain) IBOutlet UIButton *btnConfirm;
@property (nonatomic, retain) IBOutlet UIButton *btnCheckMark;

@end
