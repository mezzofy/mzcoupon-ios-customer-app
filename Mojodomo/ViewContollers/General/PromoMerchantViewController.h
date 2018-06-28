//
//  LDmerchantViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface PromoMerchantViewController : UIViewController<UITableViewDataSource, UITableViewDataSource,CLLocationManagerDelegate>

@property(weak, nonatomic) UIViewController* parent;
- (IBAction)btn_close:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgMerchant;
@property (weak, nonatomic) IBOutlet UILabel *lblMerchantName;
@property (weak, nonatomic) IBOutlet UILabel *lblMerchantPromoDetails;

@property (weak, nonatomic) IBOutlet UITableView *tableviewCoupons;

@end
