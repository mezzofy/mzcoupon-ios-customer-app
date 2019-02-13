//
//  ChannelTableViewCell.h
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChannelTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_ChannelHeader;
@property (weak, nonatomic) IBOutlet UILabel *lbl_ChannelTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_ChannelDesc;

@end

NS_ASSUME_NONNULL_END
