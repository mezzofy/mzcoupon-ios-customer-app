//
//  MerchantView.m
//  WalnetCouponWallet
//
//  Created by Inforios on 12/11/15.
//  Copyright © 2015 Thoughts Igniter. All rights reserved.
//

#import "MerchantView.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "Common.h"
#import "CustomCell.h"
#import "UIImageView+WebCache.h"
#import "MerchantListViewController.h"
#import "OutletDetailViewController.h"
#import "Utils.h"

@interface MerchantView (){
    UIActivityIndicatorView *activeIndicator;
    UIView* actvityview;
    BOOL isFiltered;
    NSMutableArray *arrymerctlist;
    NSMutableArray* arryoutletlist;
}

@end

@implementation MerchantView
@synthesize nClassificationId;
@synthesize searchBar,searchResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    searchBar.delegate =self;
    [self refreshcontroller];
    NSString *netconnect = [Utils NetworkConnection];
     if (![netconnect isEqualToString:@"No Internet"]) {
//    activeIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    //Process
//   // actvityview = [Common getActivityViewer];
//    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    
//    [modloader getoutletmerchantList:nClassificationId];
//
//    
//    if(actvityview)
//       // [Common hideActivityViewer:actvityview];
//    
//    [Common hideActivityViewer:activeIndicator];
}else
    [self loadmerctList];
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}
-(void)loadmerctList {
//    ClassificationModule *daoclass = [[ClassificationModule alloc]init];
//    arrymerctlist = [daoclass getClassificationMerchant];
    
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
        rowCount = [arrymerctlist count];
    }
    return rowCount;   // Return the number of rows in the section.
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellmerct" forIndexPath:indexPath];
    // Configure the cell...
//    TblMerchant *tblmert;
//    if (isFiltered)
//        tblmert=[searchResults objectAtIndex:indexPath.row];
//    else
//        tblmert=[arrymerctlist objectAtIndex:indexPath.row];
//    
//    [cell.imgevent sd_setImageWithURL:[NSURL URLWithString:[tblmert merchantLogo]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//    
//    [cell.lbltitle setText:[tblmert merchantName]];
//    [cell.lblCategoryName setText:[tblmert merchantDesc]];
//  
//    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
//    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
//    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar {
    
    [searchBar resignFirstResponder];
    
    isFiltered = true;
    
    searchResults = [[NSMutableArray alloc] init];
    
    [self loadmerctList];
    NSRange nameRange;
//    for (TblMerchant *prod in arrymerctlist)
//    {
//        nameRange = [prod.merchantName rangeOfString:asearchBar.text options:NSCaseInsensitiveSearch];
//        
//        if(nameRange.location != NSNotFound)
//        {
//            [searchResults addObject:prod];
//        }
//        
//    }
//    if ([searchResults count]==0) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Merchant not found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//    }
    
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
//    
//    [modloader getoutletmerchantList:nClassificationId];
    [self loadmerctList];
    [self.tableView reloadData];
    [sender endRefreshing];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    TblMerchant *tblmert=[arrymerctlist objectAtIndex:indexPath.row];
//    activeIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    //Process
//    actvityview = [Common getActivityViewer];
//    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
//
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    JsonOutletList *objoutlet = [modloader loadclassificationList:nClassificationId merctid:[tblmert merchantId]];
//    [modloader classificationList:objoutlet.outlets];
//    [modloader addsiteId:nClassificationId mercht:objoutlet.outlets];
//    if(actvityview)
//        [Common hideActivityViewer:actvityview];
//    
//    [Common hideActivityViewer:activeIndicator];
//    SiteModule *daosite = [[SiteModule alloc]init];
//    arryoutletlist = [daosite getclassificationListById:nClassificationId mercht:[tblmert merchantId]];
//    if ([arryoutletlist count] ==1){
//        [self performSegueWithIdentifier:@"showmerctdetl" sender:self];
//    }  else{
//        [self performSegueWithIdentifier:@"showmerct" sender:self];
//    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//    TblMerchant *tblmert;
//    if (isFiltered)
//        tblmert=[searchResults objectAtIndex:indPath.row];
//    else
//        tblmert=[arrymerctlist objectAtIndex:indPath.row];
//
//    if ([arryoutletlist count] ==1) {
//        if ([segue.identifier isEqualToString:@"showmerctdetl"]){
//            
//            TblSite* tblsite=[arryoutletlist objectAtIndex:indPath.row];
//            OutletDetailViewController *proDetails = segue.destinationViewController;
//            proDetails.nsiteid = [tblsite siteId];
//        }
//    }
//    else if([segue.identifier isEqualToString:@"showmerct"]){
//        MerchantListViewController *proDetails = segue.destinationViewController;
//        proDetails.arrydetlList=arryoutletlist;
//        
//    }
}
@end
