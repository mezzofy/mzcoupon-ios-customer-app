//
//  MerchantListViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 03/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "MerchantListViewController.h"
#import "UIImageView+WebCache.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "CustomCell.h"
#import "Common.h"
#import "OutletDetailViewController.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface MerchantListViewController (){
    
    NSMutableArray *arryoutletlist;
    UIActivityIndicatorView *activeIndicator;
    UIView* actvityview;
    BOOL isFiltered;
    CLLocationManager *manager;
    NSArray *sortedArray;

}
@property (nonatomic, assign) BOOL isLoading;
@end

@implementation MerchantListViewController
@synthesize nClassificationId,nmerctid;
@synthesize searchBar;
@synthesize searchResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    searchBar.delegate =self;
    [self refreshcontroller];
    

    [self loadoutletList];
    [self.tableView reloadData];

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;

   
}
-(void)loadoutletList {
    arryoutletlist=self.arrydetlList;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rowCount;
    
    if(isFiltered){
        rowCount = searchResults.count;
    } else {
        rowCount = [arryoutletlist count];
        
    }
    return rowCount;   // Return the number of rows in the section.
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celloutlet" forIndexPath:indexPath];
    // Configure the cell...
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"merchantKM"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
     sortedArray = [arryoutletlist sortedArrayUsingDescriptors:sortDescriptors];
  
//    TblSite *tblsite;
//    if (isFiltered)
//        tblsite=[searchResults objectAtIndex:indexPath.row];
//    else
//        tblsite=[sortedArray objectAtIndex:indexPath.row];
//    
//    
//    [cell.imgevent sd_setImageWithURL:[NSURL URLWithString:[tblsite merchantLogo]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//    
//    [cell.lbltitle setText:[tblsite merchantName]];
//    [cell.lblCategoryName setText:[tblsite siteName]];
//    [cell.lblKM setText:[NSString stringWithFormat:@"%0.2f KM",[[tblsite merchantKM] doubleValue]]];
//    
//    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
//    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
//    [cell setBackgroundColor:[UIColor clearColor]];

    
    return cell;
}

- (IBAction)btnBack_Touch:(id)sender {
     
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}
-(void)refreshtable:(UIRefreshControl *)sender
{
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    JsonOutletList *objoutlet = [modloader loadclassificationList:nClassificationId merctid:nmerctid];
//    [modloader classificationList:objoutlet.outlets];
//    [modloader addsiteId:nClassificationId mercht:objoutlet.outlets];
    [self loadoutletList];
    [self.tableView reloadData];
    [sender endRefreshing];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar {
    
    [searchBar resignFirstResponder];
    
    isFiltered = true;
    
    searchResults = [[NSMutableArray alloc] init];
    
    [self loadoutletList];
    NSRange nameRange;
//    for (TblSite *prod in arryoutletlist)
//    {
//        nameRange = [prod.merchantName rangeOfString:asearchBar.text options:NSCaseInsensitiveSearch];
//        
//        if(nameRange.location != NSNotFound)
//        {
//            [searchResults addObject:prod];
//        }
//        
//    }
    if ([searchResults count]==0) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@""
                                              message:@"Outlet not found"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Yes", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
        
        
        
        
        
        [alertController addAction:okAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
    
    [self.tableView reloadData];
}
-(void)searchBar:(UISearchBar*)asearchBar textDidChange:(NSString*)text{
    if(text.length == 0)
    {
        isFiltered = FALSE;
        [searchBar performSelector: @selector(resignFirstResponder)
                        withObject: nil
                        afterDelay: 0.1];
        [self.tableView reloadData];
        
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [searchBar resignFirstResponder];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//       NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//       TblSite *tblsite;
//            if (isFiltered)
//                tblsite=[searchResults objectAtIndex:indPath.row];
//            else
//                tblsite=[sortedArray objectAtIndex:indPath.row];
//            if ([segue.identifier isEqualToString:@"detailoutlet"]) {
//                OutletDetailViewController *proDetails = segue.destinationViewController;
//                proDetails.nsiteid = [tblsite siteId];
//
//            }
}

@end
