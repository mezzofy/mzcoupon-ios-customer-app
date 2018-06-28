//
//  MerchantViewController.m
//  ProWallet
//
//  Created by Inforios on 05/01/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "MerchantViewController.h"
#import "SiteCell.h"
#import "SiteViewController.h"

@interface MerchantViewController (){
    NSMutableArray *arrymerctlist;
    NSIndexPath* checkedIndexPath;
}

@end

@implementation MerchantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadmerctList];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}

- (void)loadmerctList {
//    MerchantModule *daomert=[[MerchantModule alloc]init];
//    arrymerctlist=[daomert getCouponMerchantSiteList];
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
    
    return [arrymerctlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"sitecell";
    
    SiteCell *cell=(SiteCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//
//    TblMerchant *objmrt=[arrymerctlist objectAtIndex:indexPath.row];
//    [cell.lblSitename setText:[objmrt merchantName]];
    
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
        [self performSegueWithIdentifier:@"showsitelist" sender:self];
    }else{
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Select the Merchant"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){
                                       
                                   }];
        [alertController addAction:okAction];
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showsitelist"]) {
        NSIndexPath *indexPath =[self.tableView indexPathForSelectedRow];
//        MerchantModule *daosite=[[MerchantModule alloc]init];
//        TblMerchant *res = [arrymerctlist objectAtIndex:indexPath.row];
//        TblMerchant *objsite=[daosite getMerchantDetail:[res merchantId]];
//        SiteViewController *vcsite = segue.destinationViewController;
//        vcsite.nMerchtid = objsite.merchantId;
         
    }
}

-(IBAction)btnCancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
