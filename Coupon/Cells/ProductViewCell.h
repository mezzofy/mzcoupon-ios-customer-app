//
//  ProductViewCell.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewCell : UITableViewCell

#pragma mark - General Details

#pragma mark - Details

@property (nonatomic, retain) IBOutlet UILabel *lblCategoryName;

@property (nonatomic, retain) IBOutlet UIImageView *imgProduct;
@property (nonatomic, retain) IBOutlet UIImageView *imgCatg;
@property (nonatomic, retain) IBOutlet UILabel *lblMerchantName;
@property (nonatomic, retain) IBOutlet UILabel *lblProductName;
@property (nonatomic, retain) IBOutlet UILabel *lblProductDesc;
@property (nonatomic, retain) IBOutlet UILabel *lblOriginalPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblBrandName;
@property (nonatomic, retain) IBOutlet UIImageView *imgSpecials;
@property (strong, nonatomic) IBOutlet UILabel *lblRedeemLeft;

@property (nonatomic, retain) IBOutlet UIButton *btnFavourite;

@property (nonatomic, retain) IBOutlet UILabel *lblFreeText1;
@property (nonatomic, retain) IBOutlet UILabel *lblFreeText2;
@property (nonatomic, retain) IBOutlet UILabel *lblFreeText3;

@property (nonatomic, retain) IBOutlet UIButton *btnSupport;
@property (nonatomic, retain) IBOutlet UIButton *btnShare;
@property (nonatomic, retain) IBOutlet UILabel *lblemail;

@property (strong, nonatomic) IBOutlet UIButton *ButtonHotdeals;
@property (strong, nonatomic) IBOutlet UILabel *lblDistance;
@property (strong, nonatomic) IBOutlet UIImageView *imgHotdeals;
@property (strong, nonatomic) IBOutlet UILabel *lblHotdeals;
@property (strong, nonatomic) IBOutlet UILabel *lblDownload;
@property (strong, nonatomic) IBOutlet UILabel *lblExpirydays;

#pragma mark - Site

@property (nonatomic, retain) IBOutlet UILabel *lblPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblSiteName;
@property (strong, nonatomic) IBOutlet UILabel *lblNowPrice;

#pragma mark - Qty
@property (nonatomic, retain) IBOutlet UILabel *lblQty;
@property (nonatomic, retain) IBOutlet UITextField *txtQty;
@property (nonatomic, retain) IBOutlet UILabel *txttermcond;
@property (nonatomic, retain) IBOutlet UIStepper  *stepper;

#pragma mark - Add Cart
@property (nonatomic, retain) IBOutlet UIButton *btnAddUpdateCart;



@end
