//
//  FilterMerchantViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "FilterMerchantViewController.h"
#import "CustomCell.h"
#import "Common.h"

@interface FilterMerchantViewController (){
    NSMutableArray *arrMerchantList;
//    TblFilterList *pfilter;
     NSIndexPath *checkedindx;

}

@end

@implementation FilterMerchantViewController
@synthesize pmerchfilterid;
- (void)viewDidLoad {
    [super viewDidLoad];
//    [Common productsearch:@"F"];
//        NSLog(@"%@",pfilter);
//    NSLog(@"%@",pmerchfilterid);
//    if (![pmerchfilterid count]>0) {
//        pmerchfilterid = [NSMutableArray array];
//    }
//    pfilter=[[TblFilterList alloc]init];
//    
//    pfilter.merchants=[[NSMutableArray alloc]init];
//    MerchantModule *daoMercht = [[MerchantModule alloc]init];
//    arrMerchantList = [daoMercht getMerchant];
//    
//    TblMerchant *tblmercht = [[TblMerchant alloc]init];
//    [tblmercht setMerchantId:[NSNumber numberWithInt:0]];
//    [tblmercht setMerchantName:NSLocalizedString(@"ALLMERCHANTS", nil)];
//    [arrMerchantList insertObject:tblmercht atIndex:0];
   
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
    // Return the number of rows in the section.
    return [arrMerchantList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
//    // Configure the cell...
//    TblMerchant *tblmer = [arrMerchantList objectAtIndex:indexPath.row];
//    cell.lblCategoryName.text = [tblmer merchantName];
//    for (TblMerchant *merc in pmerchfilterid) {
//        if ([[tblmer merchantId]intValue] ==[[merc merchantId] intValue]){
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
//            checkedindx=indexPath;
//            break;
//        }
//        else
//            cell.accessoryType = UITableViewCellAccessoryNone;
//    }

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if([tableView cellForRowAtIndexPath:indexPath].accessoryType ==UITableViewCellAccessoryNone){
//        if (indexPath.row>0) {
//            
//            if(checkedindx){
//                
//                TblMerchant *strmer=[arrMerchantList objectAtIndex:checkedindx.row];
//                {
//                    if (indexPath.row>0 && [[strmer merchantId]intValue]==0){
//                        
//                        UITableViewCell* uncheckCell = [tableView
//                                                        cellForRowAtIndexPath:checkedindx];
//                        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
//                        
//                        [pmerchfilterid removeObjectAtIndex:0];
//                    }
//                    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                    TblMerchant *tblmert=[arrMerchantList objectAtIndex:indexPath.row];
//                    [pmerchfilterid addObject:tblmert];
//                }
//            }
//        }else{
//            [Common productsearch:@"P"];
//            if(checkedindx){
//                
//                TblMerchant *strmerct=[arrMerchantList objectAtIndex:checkedindx.row];
//                {
//                    if (indexPath.row==0 && ![[strmerct merchantId]intValue]==0){
//                        
//                        UITableViewCell* uncheckCell = [tableView
//                                                        cellForRowAtIndexPath:checkedindx];
//                        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
//                        
//                        [pmerchfilterid removeAllObjects];
//                    }
//                    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                    TblMerchant *tblmert=[arrMerchantList objectAtIndex:indexPath.row];
//                    [pmerchfilterid addObject:tblmert];
//                }
//            }
//        }
//    }   else if([tableView cellForRowAtIndexPath:indexPath].accessoryType ==UITableViewCellAccessoryCheckmark){
//        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//        TblMerchant *strmrt=[arrMerchantList objectAtIndex:indexPath.row];
//        for (TblMerchant *tblmert in pmerchfilterid) {
//            if ([[tblmert merchantId] intValue]== [[strmrt merchantId]intValue]) {
//                cell.accessoryType = UITableViewCellAccessoryNone;
//                [pmerchfilterid removeObject:tblmert];
//                break;
//            }
//        }
//        
//    }
//    
//    if (![pmerchfilterid count]>0) {
//        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        TblMerchant *tblmert=[arrMerchantList objectAtIndex:0];
//        [pmerchfilterid addObject:tblmert];
//    }
    [self.tableView reloadData];
}


- (IBAction)btnApply_Touch:(id)sender{
//      for( TblMerchant *strmerct in pmerchfilterid) {
//        [pfilter.merchants addObject:strmerct];
//    }
//    [Common merIdlist:pfilter.merchants];
//    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
