//
//  MerchantListViewController.h
//  MzCouponWallet
//
//  Created by Inforios on 03/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MerchantListViewController : UITableViewController<UISearchBarDelegate>

@property (nonatomic,retain) NSMutableArray *searchResults;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSNumber *nClassificationId;
@property (nonatomic, retain) NSNumber *nmerctid;
@property (nonatomic,retain) NSMutableArray *arrydetlList;

@end
