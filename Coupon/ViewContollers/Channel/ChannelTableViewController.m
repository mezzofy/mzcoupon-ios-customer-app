//
//  ChannelTableViewController.m
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "ChannelTableViewController.h"
#import "ChannelTableViewCell.h"
#import "ChannelModule.h"
#import "TblChannelLocationData.h"
#import "UIImageView+WebCache.h"
#import "TblChannelLocationDataModel.h"
#import "ProductListController.h"
#import "CartModule.h"

@interface ChannelTableViewController (){
    ChannelModule *mod;
}
@end

@implementation ChannelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mod=[[ChannelModule alloc]init];
    self.tabBarController.delegate=self;
}
-(void)viewDidAppear:(BOOL)animated {
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    
    [mod getChannelListFromServer];
    [self loadCartList];
    [self.tableView reloadData];
    
    
    
}

- (void)loadCartList {
    CartModule *modcart=[[CartModule alloc]init];
    if ([modcart getCartItemsCount]>0)
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)[modcart getCartItemsCount]]];
    else
        [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setBadgeValue:nil];
    
    [[[[[self tabBarController] tabBar] items] objectAtIndex:2] setTitle:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[NSNumber numberWithDouble:[modcart getTotalPriceCartItems]]]];
    
    
    
  
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mod getChannelcount:@""];

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChannelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    TblChannelLocationData *objchannel=[mod getChannelbyOffset:@"" Offset:indexPath.row];
    
    [cell.img_ChannelHeader sd_setImageWithURL:[NSURL URLWithString:objchannel.headerImage] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
    cell.lbl_ChannelTitle.text=objchannel.channelCode;
    cell.lbl_ChannelDesc.text=objchannel.channelDesc;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"channeldetails" sender:self];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return  250;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"channeldetails"]){
        NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
        TblChannelLocationData *location=[mod getChannelbyOffset:@"" Offset:indexpath.row];
        ProductListController *vc=[segue destinationViewController];
        vc.channelId=location.channelCode;
    }

}


@end
