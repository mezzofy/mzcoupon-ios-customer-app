//
//  CouponCell.h
//  EB
//
//  Created by Inforios on 11/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponCell : UITableViewCell
@property (nonatomic, retain) IBOutlet UIImageView *prodimg;
@property (nonatomic, retain) IBOutlet UILabel *lblorgprice;
@property (nonatomic, retain) IBOutlet UILabel *lblsellprice;
@property (nonatomic, retain) IBOutlet UILabel *lblmerchantname;
@property (nonatomic, retain) IBOutlet UILabel *lblproductname;
@property (nonatomic, retain) IBOutlet UILabel *lblproductdesc;
@property (nonatomic, retain) IBOutlet UILabel *lblexpiryDate;
@property (nonatomic, retain) IBOutlet UILabel *lblcouponno;
@property (nonatomic, retain) IBOutlet UILabel *lblcouponName;
@property (nonatomic, retain) IBOutlet UIImageView *barcodeimg;
@property (nonatomic, retain) IBOutlet UILabel *lblSiteName;
@property (nonatomic, retain) IBOutlet UIImageView *imgBadge;
@property (nonatomic, retain) IBOutlet UILabel *lblCouponCount;
@property (nonatomic, retain) IBOutlet UIStepper *stepperValue;
@property (strong, nonatomic) IBOutlet UILabel *lblRedeemLeft;
@end
