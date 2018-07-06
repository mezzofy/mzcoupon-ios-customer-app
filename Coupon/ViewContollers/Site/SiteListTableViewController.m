//
//  SiteListTableViewController.m
//  EB
//
//  Created by Kris on 6/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "SiteListTableViewController.h"
#import "SiteTableViewCell.h"
#import "SiteMapController.h"
#import "TblSite.h"


@interface SiteListTableViewController ()

@end

@implementation SiteListTableViewController
@synthesize arrSiteList;

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrSiteList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SiteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sitecell" forIndexPath:indexPath];
    
    TblSite* objsite =  [arrSiteList objectAtIndex:indexPath.row];
        
    cell.lblSiteName.text = [ objsite siteName];
    cell.lblSiteAddress.text = [objsite siteAddress];
    cell.lblSiteContact.text = [objsite siteContact];
    cell.btnMap.tag=indexPath.row;
    [cell.btnMap addTarget:self action:@selector(btnMap_Touch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TblSite* objsite =  [arrSiteList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"sitemap" sender:objsite ];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([segue.identifier isEqualToString:@"sitemap"]) {
        SiteMapController *siteMap = segue.destinationViewController;
        siteMap.objsite = sender;

    }
}

- (IBAction)btnMap_Touch:(id)sender {
    TblSite* objsite =  [arrSiteList objectAtIndex:[sender tag]];
    [self performSegueWithIdentifier:@"sitemap" sender:objsite];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
