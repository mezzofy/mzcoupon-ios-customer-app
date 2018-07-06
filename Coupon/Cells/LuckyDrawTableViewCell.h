//
//  LuckyDrawTableViewCell.h
//  ProWallet
//
//  Created by Kris on 2/15/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuckyDrawTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lblname;
@property (nonatomic, retain) IBOutlet UILabel *lbldescription;
@property (nonatomic, retain) IBOutlet UILabel *lblsno;
@property (nonatomic, retain) IBOutlet UILabel *lbldatetime;
@property (nonatomic, retain) IBOutlet UIImageView *img;

@end
