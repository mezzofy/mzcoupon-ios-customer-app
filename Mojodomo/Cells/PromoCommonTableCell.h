//
//  PromoCommonTableCell.h
//  ProWallet
//
//  Created by Inforios Technologies on 26/04/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoCommonTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgLuckyDraw;
@property (weak, nonatomic) IBOutlet UILabel *lblMerchant;
@property (weak, nonatomic) IBOutlet UILabel *lblLuckyDrawName;
@property (weak, nonatomic) IBOutlet UILabel *lblLuckyDrawDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblLuckyDrawCode;


@property (weak, nonatomic) IBOutlet UIImageView *imgCoupon;
@property (weak, nonatomic) IBOutlet UILabel *lblMerchantName;
@property (weak, nonatomic) IBOutlet UILabel *lblCouponName;
@property (weak, nonatomic) IBOutlet UILabel *lblCouponDetail;
@property (weak, nonatomic) IBOutlet UIButton *lblCouponTerms;



@property (weak, nonatomic) IBOutlet UIImageView *imgInstDraw;
@property (weak, nonatomic) IBOutlet UILabel *lblInstDrawMerchant;
@property (weak, nonatomic) IBOutlet UILabel *lblInstDrawName;
@property (weak, nonatomic) IBOutlet UILabel *lblInstDrawMessage;

@property (weak, nonatomic) IBOutlet UILabel *lblInstDrawItem;


@end

