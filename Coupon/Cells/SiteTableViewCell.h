//
//  SiteTableViewCell.h
//  EB
//
//  Created by Kris on 6/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiteTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lblSiteName;
@property (nonatomic, retain) IBOutlet UILabel *lblSiteAddress;
@property (nonatomic, retain) IBOutlet UITextView *lblSiteContact;
@property (nonatomic, retain) IBOutlet UIButton *btnMap;

@end
