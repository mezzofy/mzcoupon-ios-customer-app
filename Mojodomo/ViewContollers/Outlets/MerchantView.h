//
//  MerchantView.h
//  WalnetCouponWallet
//
//  Created by Inforios on 12/11/15.
//  Copyright © 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantView : UITableViewController<UISearchBarDelegate>

@property (nonatomic,retain) NSMutableArray *searchResults;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSNumber *nClassificationId;

@end
