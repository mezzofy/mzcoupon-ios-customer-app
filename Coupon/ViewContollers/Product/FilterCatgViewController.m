//
//  FilterCatgViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 25/08/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "FilterCatgViewController.h"
#import "CustomCell.h"
#import "Common.h"
#import "CampaingroupDao.h"
#import <MZCoupon/MZCoupon.h>


@interface FilterCatgViewController (){
    NSMutableArray *arrfilterCampaignGroup;
    NSMutableArray *arrCampaignGroup;
    CampaingroupDao *daocampaign;
}

@end

@implementation FilterCatgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrfilterCampaignGroup=[[NSMutableArray alloc]init];
    arrCampaignGroup=[[NSMutableArray alloc]init];
    if([Common filterCampaignGroup].count>0){
        arrfilterCampaignGroup=[Common filterCampaignGroup];
    }
    daocampaign=[[CampaingroupDao alloc]init];
    arrCampaignGroup=[daocampaign getCampaignGroupList];
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
    if(arrCampaignGroup.count>0){
        return arrCampaignGroup.count+1;
    }else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(indexPath.row==0){
        cell.lblCategoryName.text = NSLocalizedString(@"ALLCATEGORIES", nil);
        cell.accessoryType = UITableViewCellAccessoryNone;
        if(arrfilterCampaignGroup.count==0)
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        CampaignData *objcamGroup=[arrCampaignGroup objectAtIndex:indexPath.row-1];
        cell.lblCategoryName.text = [objcamGroup campgrpName];
        cell.accessoryType = UITableViewCellAccessoryNone;
        for(CampaignData *objcam in arrfilterCampaignGroup)
            if([objcam.campgrpId isEqualToString:objcamGroup.campgrpId]){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            }
    }


      return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==0){
        arrfilterCampaignGroup=[[NSMutableArray alloc]init];
    }else{
        CampaignData *objcampaign=[arrCampaignGroup objectAtIndex:indexPath.row-1];
        BOOL iSdelete=FALSE;
        for(int i=0;i<arrfilterCampaignGroup.count;i++){
            CampaignData *objcampaignfilter=[arrfilterCampaignGroup objectAtIndex:i];
            if([objcampaignfilter.campgrpId isEqualToString:objcampaign.campgrpId]){
                [arrfilterCampaignGroup removeObjectAtIndex:i];
                iSdelete=TRUE;
                break;
            }
        }
        if(!iSdelete){
            [arrfilterCampaignGroup addObject:objcampaign];
        }
    }
    [self.tableView reloadData];
   
}

- (IBAction)btnApply_Touch:(id)sender{
    [Common CampaignFilter:@"YES"];
    [Common filterCampaignGroup:[[NSMutableArray alloc]init]];
    [Common filterCampaignGroup:arrfilterCampaignGroup];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnBack_Touch:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}


@end
