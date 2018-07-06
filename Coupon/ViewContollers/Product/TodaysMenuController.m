//
//  TodaysMenuController.m
//  SuPerk
//
//  Created by Kaliyarajalu on 09/03/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "TodaysMenuController.h"
#import "CustomItemCell.h"


@interface TodaysMenuController () {
    
    NSMutableArray *arrItemList;
    NSMutableArray *arrGroupList;

}

@end

@implementation TodaysMenuController
@synthesize nGroupProdId;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadGroupList];

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return [arrGroupList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[arrItemList objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
//    if (section == [arrGroupList count]) {
        return @"";
//    } else {
//        ProductModule *modproduct = [[ProductModule alloc]init];
//        return [NSString stringWithFormat:@"%@",[modproduct getGroupName:[arrGroupList objectAtIndex:section]]];
//    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomItemCell *itemcell = NULL;
    
    itemcell = [tableView dequeueReusableCellWithIdentifier:@"items" forIndexPath:indexPath];
    
//    TblItem *tblitem = [[arrItemList objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row];
//        
//    itemcell.lblItemName.text = [tblitem itemName];
    
    return itemcell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    TblItem *tblitem = [[arrItemList objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row];
//    
//    NSString *trimmedString = [tblitem.itemName stringByTrimmingCharactersInSet:
//                               [NSCharacterSet whitespaceCharacterSet]];
//    CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
//    CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
//                                                  options:NSStringDrawingUsesLineFragmentOrigin
//                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 15.0f]}
//                                                  context:nil];
//    return textRect.size.height+20;
    return 0;
    

}

- (void)loadGroupList {
    
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    arrItemList = [[NSMutableArray alloc]init];
//    arrGroupList = [daoProduct getGroupListById:nGroupProdId];
//    int i;
//    for (i = 0; i< [arrGroupList count]; i++) {
//        ItemModule *daoItem = [[ItemModule alloc]init];
//        [arrItemList addObject:[daoItem getItemListByGroupId:[arrGroupList objectAtIndex:i]]];
//        
//    }
}
- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
