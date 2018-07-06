//
//  ProductListController.m
//  EB
//
//  Created by Kaliyarajalu on 01/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "ProductListController.h"

#import "UIImageView+WebCache.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "ProductViewCell.h"
#import "ProductDetailController.h"
#import "FilteringListViewController.h"
#import "Utils.h"
#import "Common.h"
#import "UIBarButtonItem+Badge.h"
#import "CustomCell.h"
#import "SpecialProductController.h"
#import "EventsViewController.h"
#import "DLManager.h"

//NEW
#import "ProductModule.h"
#import "TblProduct.h"
#import "TblCampaignImage.h"
#import "LoaderModule.h"
#import "CartModule.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
@interface ProductListController () {
    NSMutableArray *arrProductImageList;
    ProductModule *modprod;
    NSString *searchtext;
    NSMutableArray *arryeventlist;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;

}

@property (nonatomic, assign) NSInteger rowsCount;
@property (nonatomic, assign) NSInteger pagesize;


@end

@implementation ProductListController
@synthesize catfilterid,catfiltername;
@synthesize searchBar;
@synthesize searchResults;


- (void)viewDidLoad {
    [super viewDidLoad];
    if([Common hotdeals]==NULL)
        [Common hotdeals:@"N"];
    
    self.tabBarController.delegate=self;
    searchBar.delegate =self;
//    UIImageView *navigationImage=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x, 0, 100, 30)];
//    navigationImage.image=[UIImage imageNamed:@"navlogo.png"];
    
//    self.navigationItem.title =@"Deals";
//
//    navigationImage.contentMode = UIViewContentModeScaleAspectFit;
   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    [self refreshcontroller];
    
    catfilterid = [NSNumber numberWithInt:0];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandler:)name:@"CartList" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandler:)name:@"dispcartinfo" object:nil];
    
    _pagesize=1;
    [self LoadDataFromServer];
    
}
-(void)LoadDataFromServer{
    UIActivityView* actvityview = [Common getActivityViewerwithTitle:@"Loading..."];
    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
    
    [self loadProductList];
    [self loadbadgecount];
    [self loadCartList];
    [Common hideActivityViewer:actvityview];
    [self.tableView reloadData];
}

-(void)myNotificationListHandler:(NSNotification *)notice {
    
    NSString *strEditCate = [notice object];
    if ([strEditCate isEqualToString:@"List"]||[strEditCate isEqualToString:@"display"]) {
        [self loadCartList];
        NSLog(@"Product Added ");
    }
}

- (void)loadCartList {
    
    
    
//    self.title = [NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]];
    CartModule *modcart=[[CartModule alloc]init];
    if ([modcart getCartItemsCount]>0)
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)[modcart getCartItemsCount]]];
    else
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:nil];

    [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setTitle:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]]];

    
    
//    CartModule *daoCart = [[CartModule alloc]init];
//    tblComp=[[TblCompany alloc]init];
//    CompanyModule *daocom=[[CompanyModule alloc]init];
//    tblComp=[daocom getCompanyDetails];
//    arrCartList = [daoCart getCartList:[Common staffid]];
//    sumtot = 0;
//    for (TblCart *objres in arrCartList) {
//        sumtot += [[objres totalPrice] doubleValue];
//    }
//    // self.title = [NSString stringWithFormat:@"%@ %@",[tblComp currency],[NSNumber numberWithDouble:sumtot]];
//    // self.title = [Utils currencyFormat:[NSNumber numberWithDouble:sumtot] Currency:[tblComp currency]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"dispcartinfo" object:@"display"];
//    
//    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrCartList count]];
//    
//    if (![badgenumber isEqualToString:@"0"])
//        [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:badgenumber];
//    else
//        [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:nil];
//    
//    [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setTitle:[NSString stringWithFormat:@"%@ %@",[tblComp currency],[NSNumber numberWithDouble:sumtot]]];
//    
    
}
-(void)loadbadgecount{
    
    
//    NSUInteger Favcount=[modprod getFavCampaigncount:@""];
//
//    UIBarButtonItem *fav =[self.navigationItem.leftBarButtonItems objectAtIndex:0];
//        if(Favcount  > 0)
//            fav.badgeValue = [NSString stringWithFormat:@"%ld",(long)Favcount];
//        else
//            fav.badgeValue = @"";
    
//    EventModule *daoevent=[[EventModule alloc]init];
//    arryeventlist=[daoevent getEventCount];
//    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arryeventlist count]];
//    
//    UIBarButtonItem *event =[self.navigationItem.rightBarButtonItems objectAtIndex:0];
//    if([arryeventlist count] > 0)
//        event.badgeValue = badgenumber;
//    else
//        event.badgeValue = @"";
    
    
}

-(void)viewDidAppear:(BOOL)animated {

    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    if([[Common CampaignFilter]isEqualToString:@"YES"]){
        [Common CampaignFilter:@"NO"];
        _pagesize=1;
        [self LoadDataFromServer];
        [self.tableView reloadData];
    }
    
        
    
}
-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(nonnull UIViewController *)viewController
{
     NSLog(@"Selected INDEX OF TAB-BAR ==> %lu", (unsigned long)tabBarController.selectedIndex);
    if([[Common getCustomertype]isEqualToString:@"G"]&&(tabBarController.selectedIndex==1)){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Guest User" message:@"You must signin or Regsister to access all these" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"SignIn", nil];
        [alert show];
        alert.tag=11;
    }
   
    
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
//    if (section == 1)
//        return 3;
//    UIView * myHeader = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 3)];
//    [myHeader setBackgroundColor:[UIColor redColor]];
//    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if(section==0)
//        return [modprod getCampaignGroupcount];
//    if(section==1){
    if([[Common hotdeals]isEqualToString:@"S"]){
        if( [modprod getToptenCampaigncount:searchtext]>0)
            return [modprod getToptenCampaigncount:searchtext];
        
        else
            return 0;
    }else if([[Common hotdeals]isEqualToString:@"N"]){
        if([modprod getCampaigncount:searchtext]>0)
            return [modprod getCampaigncount:searchtext];
        else
         return 0;
        }
//    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *maincell = NULL;
    
//    if (indexPath.section == 0) {
//        CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSpl" forIndexPath:indexPath];
//
//        TblCampaign *tblcampgrp = [modprod getCampaignGroupbyOffset:indexPath.row];
//        [cell.imgSpecials sd_setImageWithURL:[NSURL URLWithString:[tblcampgrp campgrpImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//
//
//        [[cell contentView] setBackgroundColor:[UIColor clearColor]];
//        [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
//        [cell setBackgroundColor:[UIColor clearColor]];
//
//
//        maincell=cell;
//
//    }else if(indexPath.section == 1) {
    if(indexPath.section == 0) {
        _rowsCount=indexPath.row+3;
        ProductViewCell *cells = [tableView dequeueReusableCellWithIdentifier:@"productcell" forIndexPath:indexPath];
        TblProduct *tblprod=[[TblProduct alloc]init];
        if([[Common hotdeals]isEqualToString:@"S"])
         tblprod= [modprod getToptenCampaignbyOffset:searchtext Offset:indexPath.row];
        else
        tblprod = [modprod getCampaignbyOffset:searchtext Offset:indexPath.row];
        
       
        arrProductImageList=[modprod getCampaignImg:[tblprod campaignId]];
        
        if ([arrProductImageList count]>0) {
            TblCampaignImage *tblcamp=[arrProductImageList objectAtIndex:0];
            
            [cells.imgProduct sd_setImageWithURL:[NSURL URLWithString:[tblcamp campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
            
        }else{
            [cells.imgProduct  setImage:[UIImage imageNamed:@"noimg.jpg"]];
        }
//cat img
        [cells.imgCatg setHidden:YES];

        
        cells.lblProductName.text = tblprod.campaignName;
        [cells.lblProductName setAdjustsFontSizeToFitWidth:YES];
        
        if ([tblprod.brand isEqualToString:@"F"]) {
            cells.lblOriginalPrice.hidden=YES;
        }
        else{
            cells.lblOriginalPrice.hidden=NO;
            NSDictionary* attrs = @{ NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
            
            NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod orginalPrice]] attributes:attrs];
            
            cells.lblOriginalPrice.attributedText = attrText;
        }
//        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//        [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//        NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//        [formatter setGroupingSeparator:groupingSeparator];
//        [formatter setGroupingSize:3];
//        [formatter setAlwaysShowsDecimalSeparator:NO];
//        [formatter setUsesGroupingSeparator:YES];
//        NSString *formattedString = [formatter stringFromNumber:[tblprod sellingPrice]];
        if([tblprod.brand isEqualToString:@"F"])
            cells.lblPrice.text =[NSString stringWithFormat:@"Free Coupon"];
        else
            cells.lblPrice.text =[NSString stringWithFormat:@"%@ %@",@"INR",[tblprod sellingPrice]];
        
        //remark
        cells.lblFreeText1.text = [tblprod campaignNote1];
        cells.lblFreeText2.text = [tblprod campaignNote2];
        cells.lblFreeText3.text = [tblprod campaignNote3];
        
        //Distance
        NSString *sold = NSLocalizedString(@"sold",nil);
        NSString *left = NSLocalizedString(@"left",nil);
        NSString *due = NSLocalizedString(@"Expiryin",nil);
        NSString *day = NSLocalizedString(@"days", nil);
        NSString *hour = NSLocalizedString(@"Hours", nil);
        [cells.lblDistance setAdjustsFontSizeToFitWidth:YES];
        if ([[tblprod dailyLimitType]isEqualToString:@"A"]) {
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %d",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod issuedcoupon],left,([tblprod.totalRedeem intValue]-[tblprod.issuedcoupon intValue])];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@     %@ %@ | %@ %d",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod issuedcoupon],left,([tblprod.totalRedeem intValue]-[tblprod.issuedcoupon intValue])];
            }
        }else {
            
            if ([[tblprod expiryname]isEqualToString:@"D"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                           %@ %@",[tblprod outletDistance],due,[tblprod expirydue],day,sold,[tblprod issuedcoupon]];
            }else if ([[tblprod expiryname]isEqualToString:@"H"]) {
                cells.lblDistance.text = [NSString stringWithFormat:@"%@  %@ %@ %@                   %@ %@",[tblprod outletDistance],due,[tblprod expirydue],hour,sold,[tblprod issuedcoupon]];
            }
            
        }
        
        //Hotdeals
        if ([[Common hotdeals]isEqualToString:@"S"]) {
            cells.imgHotdeals.hidden = NO;
            cells.lblHotdeals.hidden = NO;
            cells.lblHotdeals.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
        }else {
            cells.imgHotdeals.hidden = YES;
            cells.lblHotdeals.hidden = YES;
        }
        
        
        //fav
        cells.btnFavourite.tag = indexPath.row;
        [cells.btnFavourite addTarget:self action:@selector(btnFavourite_Touch:) forControlEvents:UIControlEventTouchUpInside];

        if ([tblprod.favourite isEqualToString:@"Y"]) {
            [cells.btnFavourite setImage:[UIImage imageNamed:@"starz.png"] forState:UIControlStateNormal];
        } else {
            [cells.btnFavourite setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        }
        maincell=cells;
    }
    
    return maincell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        return 170;
//
//    } else
if (indexPath.section == 0) {
        return  360;
    } else
        return 0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *headerview;
//    if(section == 0) {
//        static NSString *cellIdentifier=@"Header1";
//        headerview=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if(headerview==nil)
//            [NSException raise:@"headerview==nil..." format:@"no cells with matching cell"];
//
//    }else
if(section == 0) {
        static NSString *cellIdentifier=@"Header2";
        ProductViewCell *header=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if ([[Common hotdeals]isEqualToString:@"N"])
                    header.ButtonHotdeals.backgroundColor = [UIColor orangeColor];
                else
                    header.ButtonHotdeals.backgroundColor = [UIColor grayColor];
        
        [header.ButtonHotdeals setImage:[UIImage imageNamed:@"Hotdealsbg.jpg"] forState:UIControlStateNormal];
        return header;
    }
    
    return headerview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if(section == 0) {
//        return 0.1f;
//    }else
        if(section == 0) {
        return 50.0f;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        [self performSegueWithIdentifier:@"splproduct" sender:indexPath];
//    }else
if (indexPath.section == 0) {
        if([[Common hotdeals]isEqualToString:@"S"]){
            if( [modprod getToptenCampaigncount:searchtext]>0)
                [self performSegueWithIdentifier:@"detail" sender:indexPath];
        }else{
            if( [modprod getCampaigncount:searchtext]>0)
                [self performSegueWithIdentifier:@"detail" sender:indexPath];
        }
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"productfilter"]) {
        FilteringListViewController *vc = segue.destinationViewController;
        vc.vcparent = self;
        
    }else if([segue.identifier isEqualToString:@"detail"]){
        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
        TblProduct *tblprod;
        if([[Common hotdeals]isEqualToString:@"S"])
            tblprod= [modprod getToptenCampaignbyOffset:searchtext Offset:indPath.row];
        
        else
            tblprod=[modprod getCampaignbyOffset:searchtext Offset:indPath.row];
        
        ProductDetailController *proDetails = segue.destinationViewController;
        proDetails.campid = [tblprod campaignId];
    }
    else if ([segue.identifier isEqualToString:@"splproduct"]) {
        
        NSIndexPath *indxPath = [self.tableView indexPathForSelectedRow];
        TblCampaign *tblcampgrp = [modprod getCampaignGroupbyOffset:indxPath.row];
        
        SpecialProductController *splProduct = segue.destinationViewController;
        splProduct.campgrpId = [tblcampgrp campgrpId];
    }

//    else if ([segue.identifier isEqualToString:@"showevent"]) {
//        EventsViewController *evt=[[EventsViewController alloc]init];
//        evt = segue.destinationViewController;
//        EventModule *daoevt = [[EventModule alloc]init];
//        [daoevt updateEventAssigned:@"U"];
//        [modloader loadEventList:[Common compid]offset:0 size:30];
//        //[self loadbadgecount];
//    }

}
- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar {
    searchtext=asearchBar.text;
    [self.tableView reloadData];
}
-(void)searchBar:(UISearchBar*)asearchBar textDidChange:(NSString*)text{
    if(text.length > 0)
    {
        searchtext=text;
        [self.tableView reloadData];
        
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [searchBar resignFirstResponder];
    
}

- (IBAction)btnFavourite_Touch:(id)sender {
    
    TblProduct *tblprod = [modprod getCampaignbyOffset:searchtext Offset:[sender tag]];
    LoaderModule *modloader=[[LoaderModule alloc]init];
    if([tblprod.favourite isEqualToString:@"Y"])
        [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"N" tblindex:@"campaignId" tblvalue:tblprod.campaignId];
     else
         [modloader updateFlagDataFromServer:@"tbl_campaign" flagname:@"favourite" flagvalue:@"Y" tblindex:@"campaignId" tblvalue:tblprod.campaignId];
  
    [self.tableView reloadData];
}

- (void)loadProductList {
    modprod=[[ProductModule alloc]init];
    [modprod loadCampaigngroupsAndDetailsfromserverLatitude:curlatitude Longitude:curlongitude];
    if([[Common hotdeals]isEqualToString:@"S"]){
        [modprod loadToptenProductListFromServer];
        [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
        [Common filterSite:[[NSMutableArray alloc]init]];
        [Common CampaignFilter:@"NO"];
    }
    else if(([Common filterSite].count>0)||([Common filterCampaignGroup].count>0)){
        [modprod loadProductListFromServerWithFilter:_pagesize Latitude:curlatitude Longitude:curlongitude];
    }
    else
        [modprod loadProductListFromServer:_pagesize Latitude:curlatitude Longitude:curlongitude];
    
}
#pragma mark - Product Pagination
-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    _pagesize=1;
    [self LoadDataFromServer];
    [refresh endRefreshing];
}
- (IBAction)Btn_hotdeals:(id)sender {
    _pagesize=1;
    if([[Common hotdeals]isEqualToString:@"S"]){
        [self LoadDataFromServer];
        [Common hotdeals:@"N"];
    }
    else{
        [Common filterSite:[[NSMutableArray alloc]init]];
        [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
        [Common hotdeals:@"S"];
        [self LoadDataFromServer];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alertView.tag==11&&buttonIndex==1){
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
        UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
        
        [self presentViewController:vc animated:NO completion:^{[[NSNotificationCenter defaultCenter] postNotificationName:@"GuestSignOut" object:@"GuestSignOut"];}];
        
    }
    else
        [self.tabBarController setSelectedIndex:0];
  }

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_rowsCount < [[Common dataResponse].totalsize integerValue]){
        if(_pagesize*20 < _rowsCount){
            _pagesize=_pagesize+1;
            if(([Common filterSite].count>0)||([Common filterCampaignGroup].count>0)){
                [modprod loadProductListFromServerWithFilter:_pagesize Latitude:curlatitude Longitude:curlongitude];
            }
            else
                [modprod loadProductListFromServer:_pagesize Latitude:curlatitude Longitude:curlongitude];
           
           
            [self.tableView reloadData];
        }
    }
}
@end
