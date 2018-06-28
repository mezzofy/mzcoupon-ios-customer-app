//
//  ProductListController.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ProductListController : UITableViewController<UISearchBarDelegate,CLLocationManagerDelegate,UITabBarControllerDelegate>

@property (nonatomic,retain) NSMutableArray *searchResults;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSNumber* catfilterid;
@property (nonatomic, retain) NSString* catfiltername;
- (IBAction)Btn_hotdeals:(id)sender;


@end
