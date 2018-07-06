//
//  FilterViewController.m
//  EB
//
//  Created by Kaliyarajalu on 02/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "FilterViewController.h"
#import "CustomCell.h"
#import "UIImageView+WebCache.h"
#import "ProductModule.h"

@interface FilterViewController () {
    ProductModule *modproduct;
    NSIndexPath* checkedIndexPath;

}

@end

@implementation FilterViewController
@synthesize vcparent;

- (void)viewDidLoad {
    [super viewDidLoad];
    modproduct=[[ProductModule alloc]init];
   
//    [tblcat setCategoryId:[NSNumber numberWithInt:0]];
//    [tblcat setCategoryName:NSLocalizedString(@"ALLCATEGORIES", nil)];
//
//    NSInteger cnt = 0;
//    if ([arrCategoryList count]>0){
//        for(TblCategory* objcat in arrCategoryList){
//            cnt += objcat.productCount.intValue;
//        }
//
//    }
//    [tblcat setProductCount:[NSNumber numberWithInteger:cnt]];
//    [arrCategoryList insertObject:tblcat atIndex:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
     if([modproduct getCampaignGroupcount]>0)
         return [modproduct getCampaignGroupcount]+1;
     else
         return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    TblCampaign *objcampaign=[modproduct getCampaignGroupbyOffset:indexPath.row];

    cell.lblCategoryName.text = [objcampaign campgrpName];
//     cell.lblCategoryCount.text = [[tblcat productCount]stringValue];
  
    if (![[objcampaign campgrpImageurl] isEqualToString:@""]) {
        [cell.imgSpecials sd_setImageWithURL:[NSURL URLWithString:[objcampaign campgrpImageurl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
    }else{
    [cell.imgSpecials  setImage:[UIImage imageNamed:@"noimg.jpg"]];
    }
    
    if (indexPath.row==0) {
            [cell.imgSpecials  setImage:[UIImage imageNamed:@"logo-only.png"]];
    }
//    if (objcampaign.campgrpId isEqualToString:vcparent.catfilterid)  {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        checkedIndexPath = indexPath;
//    }
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    
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


- (IBAction)btnApply_Touch:(id)sender {
    
//    NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//    TblCategory *tblcat = [arrCategoryList objectAtIndex:indPath.row];
//    [vcparent setCatfilterid:[tblcat categoryId]];
//    [vcparent setCatfiltername:[tblcat categoryName]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
