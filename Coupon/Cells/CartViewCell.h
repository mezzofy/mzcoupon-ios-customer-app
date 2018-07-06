//
//  CartViewCell.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *imgProduct;

@property (nonatomic, retain) IBOutlet UILabel *lblProductName;
@property (nonatomic, retain) IBOutlet UILabel *lblProductQty;
@property (nonatomic, retain) IBOutlet UILabel *lblProductPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblMerchtName;


@end
