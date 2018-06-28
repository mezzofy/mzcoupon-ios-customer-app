//
//  CountryTableViewController.h
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import <UIKit/UIKit.h>

@interface CountryTableViewController : UITableViewController<UISearchBarDelegate>

@property (nonatomic,retain) NSMutableArray *searchResults;
@property (strong, nonatomic) IBOutlet UISearchBar *Search;
@property (strong, nonatomic)NSMutableArray *arrcountry;
- (IBAction)btn_back:(id)sender;

@end
