//
//  SpecialViewController.m
//  EB
//
//  Created by Kaliyarajalu on 03/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "UIImageView+WebCache.h"

#import "SpecialViewController.h"
#import "CustomCell.h"
#import "Utils.h"
#import "Common.h"
#import "SpecialProductController.h"
#import "UIBarButtonItem+Badge.h"
#import "EventsViewController.h"
#import "CartModule.h"

@interface SpecialViewController () {
    NSMutableArray *arrSpecialList;
    NSMutableArray *arryeventlist;
}

@end

@implementation SpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrSpecialList = [[NSMutableArray alloc]init];
    
    [self loadSpecialList];
    [self displaycart:Nil];
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(displaycart:)
                                                 name:@"dispcartinfo" object:nil];

    // refresh control
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"PULLTOREFRESH", nil)
                                                                attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:title];
    
    [refresh setTintColor:[UIColor grayColor]];
    [refresh addTarget:self
                action:@selector(refreshView:)
                forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    [self loadbadgecount];
}
-(void)loadbadgecount{
//    EventModule *daoevent=[[EventModule alloc]init];
//    arryeventlist=[daoevent getEventCount];
    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arryeventlist count]];
    
    self.navigationItem.rightBarButtonItem.badgeValue = badgenumber;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshView:(UIRefreshControl *)refresh {
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Refreshing data..."
                                                                attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:title];
    
    // custom refresh logic would be placed here...
//    ProductModule *modprd = [[ProductModule alloc]init];
//    [modprd updatespecialStatus:@"U"];
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    [modloader loadSpecialList];
//    EventModule *daoevt = [[EventModule alloc]init];
//    [daoevt updateEventAssigned:@"U"];
//    [modloader loadEventList:[Common compid]offset:0 size:30];
    [self loadbadgecount];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    
    NSAttributedString *updtitle = [[NSAttributedString alloc] initWithString:lastUpdated
                                                                attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:updtitle];
    
    [refresh endRefreshing];
    
    // Reload table data
    [self loadSpecialList];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [arrSpecialList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSpl" forIndexPath:indexPath];
    
    // Configure the cell...
//    TblSpecial *tblSpl = [arrSpecialList objectAtIndex:indexPath.row];
//    
// 
//    
//    [cell.imgSpecials sd_setImageWithURL:[NSURL URLWithString:[tblSpl specialImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//
//    
//    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
//    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
//    [cell setBackgroundColor:[UIColor clearColor]];
//    [cell.lblCategoryName setText:[tblSpl specialName]];

    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"splproduct" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"splproduct"]) {
        
        NSIndexPath *indxPath = [self.tableView indexPathForSelectedRow];
//        TblSpecial *tblSpl = [arrSpecialList objectAtIndex:indxPath.row];
        
        SpecialProductController *splProduct = segue.destinationViewController;
//        splProduct.nSpecialId = [tblSpl specialId];
    }
    else if ([segue.identifier isEqualToString:@"showevent"]) {
        EventsViewController *evt=[[EventsViewController alloc]init];
       evt = segue.destinationViewController;
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        EventModule *daoevt = [[EventModule alloc]init];
//        [daoevt updateEventAssigned:@"U"];
//        [modloader loadEventList:[Common compid]offset:0 size:30];
        [self loadbadgecount];
    }
}
- (IBAction)btnRefresh_Touch:(id)sender {
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    
//    [modloader loadCategoryList];
////    [modloader loadAssignProduct];
//    [modloader loadSpecialList];
////    [modloader loadCoupons];
//    [modloader loadCompanyBranchList];
//    [modloader uploadOrderList];
//    [modloader loadEventList:[Common compid]offset:0 size:30];
//    
    // Reload table data
    [self loadSpecialList];
}

-(void)displaycart:(NSNotification *)notice {
    
    
    CartModule *modcart=[[CartModule alloc]init];
    if ([modcart getCartItemsCount]>0)
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)[modcart getCartItemsCount]]];
    else
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:nil];
    
    [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setTitle:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]]];

    
//    CompanyModule *daoComp = [[CompanyModule alloc]init];
//    TblCompany* tblComp = [daoComp getCompanyDetail:[Common compid]];
//    
//    CartModule *daoCart = [[CartModule alloc]init];
//    NSMutableArray* arrCartList = [daoCart getCartList:[Common staffid]];
//    double sumtot = 0;
//    for (TblCart *objres in arrCartList) {
//        sumtot += [[objres totalPrice] doubleValue];
//    }
//
//    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrCartList count]];
//    [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:badgenumber];
//    
//    [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setTitle:[NSString stringWithFormat:@"%@ %@",[tblComp currency],[NSNumber numberWithDouble:sumtot]]];

}

- (void)loadSpecialList {
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    arrSpecialList = [daoProduct getSpecialList];
    [self.tableView reloadData];

}
- (IBAction)btnevent_Touch:(id)sender{
    [self performSegueWithIdentifier:@"showevent" sender:self];
}
@end
