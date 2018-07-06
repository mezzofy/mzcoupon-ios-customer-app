//
//  FilterLocationViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "FilterLocationViewController.h"
#import "CustomCell.h"
#import "Common.h"
#import "SiteModule.h"

@interface FilterLocationViewController (){
    NSMutableArray *arrfilterSite;
    NSMutableArray *arrSite;
    SiteModule *modsite;
}

@end

@implementation FilterLocationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    arrfilterSite=[[NSMutableArray alloc]init];
    arrSite=[[NSMutableArray alloc]init];
    if([Common filterSite].count>0){
        arrfilterSite=[Common filterSite];
    }
    modsite=[[SiteModule alloc]init];
    arrSite=[modsite getAllSiteFromTableForFilter];

  
}

- (void)viewDidAppear:(BOOL)animated {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
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
    if(arrSite.count>0){
        return arrSite.count+1;
    }else
        return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(indexPath.row==0){
        cell.lblCategoryName.text = NSLocalizedString(@"ALLLOCATIONS", nil);
        cell.accessoryType = UITableViewCellAccessoryNone;
        if(arrfilterSite.count==0)
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        SiteData *objsite=[arrSite objectAtIndex:indexPath.row-1];
        cell.lblCategoryName.text = [objsite siteName];
        cell.accessoryType = UITableViewCellAccessoryNone;
        for(SiteData *objsite1 in arrfilterSite)
            if([objsite1.siteId isEqualToString:objsite.siteId]){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            }
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==0){
        arrfilterSite=[[NSMutableArray alloc]init];
    }else{
        SiteData *objsite=[arrSite objectAtIndex:indexPath.row-1];
        BOOL iSdelete=FALSE;
        for(int i=0;i<arrfilterSite.count;i++){
            SiteData *objsitefilter=[arrfilterSite objectAtIndex:i];
            if([objsitefilter.siteId isEqualToString:objsite.siteId]){
                [arrfilterSite removeObjectAtIndex:i];
                iSdelete=TRUE;
                break;
            }
        }
        if(!iSdelete){
            [arrfilterSite addObject:objsite];
        }
    }
    [self.tableView reloadData];
    
}

- (IBAction)btnApply_Touch:(id)sender{
    [Common CampaignFilter:@"YES"];
    [Common filterSite:[[NSMutableArray alloc]init]];
    [Common filterSite:arrfilterSite];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnBack_Touch:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
