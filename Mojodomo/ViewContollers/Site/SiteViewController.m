//
//  SiteViewController.m
//  EB mPOS
//
//  Created by Inforios on 19/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "SiteViewController.h"
#import "SiteCell.h"
#import "MassRedemViewController.h"
#import "SiteModule.h"



@interface SiteViewController (){
    NSMutableArray *arrysitelist;
    NSIndexPath* checkedIndexPath;
    UIView* actvityview;
    SiteModule *modsite;
    
}

@end

@implementation SiteViewController

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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    modsite=[[SiteModule alloc]init];
    arrysitelist=[modsite getAllSiteFromTable];
    return arrysitelist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"sitecell";
    
    SiteCell *cell=(SiteCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TblSite *objsite=[arrysitelist objectAtIndex:indexPath.row];
    [cell.lblSitename setText:[objsite siteName]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(checkedIndexPath)
    {
        UITableViewCell* uncheckCell = [tableView
                                        cellForRowAtIndexPath:checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    checkedIndexPath = indexPath;
}

-(IBAction)btnSelect:(id)sender{
    if(checkedIndexPath){
        [self performSegueWithIdentifier:@"showcouplist" sender:self];
    }else{
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Select the Site"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        
        
        [alertController addAction:okAction];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showcouplist"]) {
        NSIndexPath *indexPath =[self.tableView indexPathForSelectedRow];
        TblSite *ress = [arrysitelist objectAtIndex:indexPath.row];
        MassRedemViewController *vcsit = segue.destinationViewController;
        vcsit.Siteid = ress.siteId;
        
        
    }
}

-(IBAction)btnCancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
