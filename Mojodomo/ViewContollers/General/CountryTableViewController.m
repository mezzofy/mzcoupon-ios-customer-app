//
//  CountryTableViewController.m
//  aaacWallet
//  Merchant Apps
//
//  Created by Mezzofy on 01/01/17.
//  Copyright (c) 2017 Mezzofy (Hong Kong) Limited. All Rights Reserved.
//

#import "CountryTableViewController.h"
#import "RegsisterTableViewCell.h"
#import "Utils.h"
#import "TblCountryData.h"
#import "TblCountryModel.h"
#import "TblCountryList.h"
#import "Common.h"

@interface CountryTableViewController ()
{
    
    TblCountryModel *objcountrylist;
    TblCountryData *objcountry;
     BOOL isFiltered;
}
@end

@implementation CountryTableViewController
@synthesize searchResults,Search,arrcountry;

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.navigationController setNavigationBarHidden:NO];
    Search.delegate = (id)self;
 
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowcount;
    if (isFiltered) {
        rowcount = [searchResults count];
    }else{
     rowcount= [arrcountry count];
    }
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegsisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (isFiltered) {
        objcountry = [searchResults objectAtIndex:indexPath.row];
    }else {
        objcountry = [arrcountry objectAtIndex:indexPath.row];
    }
    NSString *countryname = [NSString stringWithFormat:@"%@ - %@",[objcountry countryCode],[objcountry countryName]];
    cell.lbl_country.text = countryname;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (isFiltered) {
        objcountry = [searchResults objectAtIndex:indexPath.row];
        
    }else {
     objcountry = [arrcountry objectAtIndex:indexPath.row];
     NSLog(@"%@",[objcountry countryCode]);
    }
     [Common countrycode:[objcountry countryCode]];
     [Common Countryname:[objcountry countryName]];
     [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        
        searchResults = [[NSMutableArray alloc] init];
        
        for (TblCountryData *doc in arrcountry)
        {
            NSRange nameRange = [doc.countryName rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [doc.countryCode rangeOfString:text options:NSCaseInsensitiveSearch];
          
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
                [searchResults addObject:doc];
            }
        }
    }
    
    [self.tableView reloadData];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)asearchBar{
    
    [Search resignFirstResponder];
}

- (IBAction)btn_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
