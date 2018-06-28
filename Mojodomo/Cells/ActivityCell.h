//
//  ActivityCell.h
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *lblTxnId;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnNo;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnDateTime;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnStatus;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnStaff;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnMerchant;
@property (nonatomic, retain) IBOutlet UILabel *lblTxnOutlet;
@property (nonatomic, retain) IBOutlet UIButton *btndecline;
@property (nonatomic, retain) IBOutlet UIButton *btnapprove;

@end
