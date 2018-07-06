//
//  CustomCell.h
//  EB
//
//  Created by Kaliyarajalu on 02/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lblCategoryName;
@property (nonatomic, retain) IBOutlet UILabel *lblCategoryCount;

@property (nonatomic, retain) IBOutlet UIImageView *imgSpecials;

//Event
@property (nonatomic, retain) IBOutlet UILabel *lbltitle;
@property (nonatomic, retain) IBOutlet UILabel *lbldesc;

@property (nonatomic, retain) IBOutlet UIImageView *imgevent;
@property (nonatomic, retain) IBOutlet UIButton *btnClear;
@property (nonatomic, retain) IBOutlet UILabel *lblKM;

@end
