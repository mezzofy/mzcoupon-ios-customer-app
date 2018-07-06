//
//  NotificationTableViewCell.h
//  ProWallet
//
//  Created by Kris on 2/22/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lbltype;
@property (nonatomic, retain) IBOutlet UILabel *lblname;
@property (nonatomic, retain) IBOutlet UILabel *lbldescription;
@property (nonatomic, retain) IBOutlet UILabel *lbldatetime;

@end
