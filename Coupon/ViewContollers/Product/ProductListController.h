//
//  ProductListController.h
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ProductListController : UITableViewController<UISearchBarDelegate,CLLocationManagerDelegate>

@property (nonatomic,retain) NSMutableArray *searchResults;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSNumber* catfilterid;
@property (nonatomic, retain) NSString* catfiltername;
@property (nonatomic, retain) NSString* channelId;
- (IBAction)Btn_hotdeals:(id)sender;


@end
