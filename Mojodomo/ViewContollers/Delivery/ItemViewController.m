////
////  ItemViewController.m
////  EB
////
////  Created by Kaliyarajalu on 26/12/14.
////  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
////
//
//#import "ItemViewController.h"
//#import "OptionsViewController.h"
//#import "PreviewController.h"
//#import "CustomItemCell.h"
//
//
//@interface ItemViewController ()<UIGestureRecognizerDelegate> {
//    
//    NSMutableArray *arrItemList;
//    NSIndexPath* checkedIndexPath;
//    
//    NSMutableArray *arrGroupList;
//    NSNumber *nSelectedItemId;
//    
//    BOOL isflag;
//    NSNumber *nmaxMod;
//    
//}
//@end
//
//@implementation ItemViewController
//@synthesize nGroupProdId;
//@synthesize nCouponId;
//@synthesize nSiteId;
//@synthesize sOrderType;
//@synthesize sTime;
//@synthesize saddress;
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self loadGroupList];
//    
////    CommonModule *modcom = [[CommonModule alloc]init];
////    [modcom deleteSelectedItems];
////    [modcom deleteSelectedItemModifier];
//
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
//    bgView.frame = self.view.frame;
//    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.backgroundView = bgView;
//    self.tableView.backgroundView.layer.zPosition -= 1;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return ([arrGroupList count] + 1);
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    if (section == [arrGroupList count]) {
//        return 1;
//    }
//    return [[arrItemList objectAtIndex:section] count];
//}
//    
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
////    if (section == [arrGroupList count]) {
//        return @"";
////    } else {
////        ProductModule *modproduct = [[ProductModule alloc]init];
////        return [NSString stringWithFormat:@"%@",[modproduct getGroupName:[arrGroupList objectAtIndex:section]]];
////    }    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CustomItemCell *itemcell = NULL;
//    
////    if (indexPath.section == [arrGroupList count]) {
////        
////        itemcell = [tableView dequeueReusableCellWithIdentifier:@"selection" forIndexPath:indexPath];
////    } else {
////        
////        itemcell = [tableView dequeueReusableCellWithIdentifier:@"items" forIndexPath:indexPath];
////
////        ItemModule *daoItem = [[ItemModule alloc]init];
////        
////        TblItem *tblitem = [[arrItemList objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row];
////        
////        itemcell.lblItemName.text = [tblitem itemName];
////        
////        [itemcell.btnCheckMark setTag:indexPath.row];
////        [itemcell.btnCheckMark addTarget:self action:@selector(btnSelectItem_Touch:) forControlEvents:UIControlEventTouchUpInside];
////        
////        if ([self isRowSelectedOnTableView:tblitem])
////            [itemcell.btnCheckMark setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
////        else
////            [itemcell.btnCheckMark setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
////        
////         NSMutableArray *arrOptions = [daoItem getItemModifierById:[tblitem itemId]];
////        if ([arrOptions count]>0 && [self isRowSelectedOnTableView:tblitem]) {
////            itemcell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
////        } else {
////            itemcell.accessoryType = UITableViewCellAccessoryNone;
////        }
////    }
//    
//    return itemcell;
//}
//
////-(BOOL)isRowSelectedOnTableView:(TblItem*)pobjitem {
////    BOOL retval = FALSE;
////    CommonModule *modcomm = [[CommonModule alloc]init];
////    retval = [modcomm isSelectedGroupId:[pobjitem groupId] ItemId:[pobjitem itemId]];
////    return retval;
////}
//
//- (IBAction)btnSelectItem_Touch:(id)sender {
//    
//    CGPoint buttonPosition = [sender convertPoint:CGPointZero
//                                           toView:self.tableView];
//    NSIndexPath *indexpath = [self.tableView indexPathForRowAtPoint:buttonPosition];
//    
////    ProductModule *daoProduct = [[ProductModule alloc]init];
////    ItemModule *daoItem = [[ItemModule alloc]init];
////    CommonModule *modcomm = [[CommonModule alloc]init];
//
////    TblItem *tblitem = [[arrItemList objectAtIndex:indexpath.section]  objectAtIndex:indexpath.row];
//    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexpath];
////    if([self isRowSelectedOnTableView:tblitem]){
////        cell.accessoryType = UITableViewCellAccessoryNone;
////        [modcomm updateSelectedGroupId:[arrGroupList objectAtIndex:indexpath.section] ItemId:[tblitem itemId] Delete:TRUE]; // Remove Group and item
////        [modcomm deleteModifiersByItemId:[tblitem itemId]];
////        nSelectedItemId = nil;
////    } else {
////
////        NSInteger maxItem = [[daoProduct getGroupMaxItemGroupId:[arrGroupList objectAtIndex:indexpath.section]] intValue];
////        NSUInteger groupCount = [[modcomm getGroupItemList:[arrGroupList objectAtIndex:indexpath.section]] count];
////        if (groupCount >= maxItem) {
////            
////            NSString* s = [NSString  stringWithFormat:@"%@ %ld %@", NSLocalizedString(@"PRODUCTHASMAXITEMS1", nil), maxItem, NSLocalizedString(@"PRODUCTHASMAXITEMS2", nil)];
////            
////            UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"WARNING", nil) message:s delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////            [alertMsg show];
////        } else {
////            [modcomm updateSelectedGroupId:[arrGroupList objectAtIndex:indexpath.section] ItemId:[tblitem itemId] Delete:FALSE];
////            nSelectedItemId = [tblitem itemId];
////            nmaxMod = [tblitem maxModifier];
////            NSMutableArray *arrOptions = [daoItem getItemModifierById:[tblitem itemId]];
////            if ([arrOptions count]>0) {
////                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
////            } else {
////                cell.accessoryType = UITableViewCellAccessoryNone;
////            }
////            
////        }
////    }
//    
////    [self.tableView reloadData];
//
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
////    ItemModule *daoItem = [[ItemModule alloc]init];
////    ProductModule *daoProduct = [[ProductModule alloc]init];
////    TblItem *objitem = [[arrItemList objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row];
////    
////    CommonModule *modcomm = [[CommonModule alloc]init];
////    NSInteger maxItem = [[daoProduct getGroupMaxItemGroupId:[arrGroupList objectAtIndex:indexPath.section]] intValue];
////    NSUInteger groupCount = [[modcomm getGroupItemList:[arrGroupList objectAtIndex:indexPath.section]] count];
////    nmaxMod = [objitem maxModifier];
////    if (groupCount >= maxItem && [self isRowSelectedOnTableView:objitem] == FALSE) {
////        
////        NSString* s = [NSString  stringWithFormat:@"%@ %ld %@", NSLocalizedString(@"PRODUCTHASMAXITEMS1", nil), maxItem, NSLocalizedString(@"PRODUCTHASMAXITEMS2", nil)];
////        
////        UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"WARNING", nil) message:s delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////        [alertMsg show];
////    } else {
////        
////        NSMutableArray *arrOptions = [daoItem getItemModifierById:[objitem itemId]];
////        if ([arrOptions count]>0) {
////            [self performSegueWithIdentifier:@"option" sender:[objitem itemId]];
////        }
////        [modcomm updateSelectedGroupId:[arrGroupList objectAtIndex:indexPath.section] ItemId:[objitem itemId] Delete:FALSE];
////        [self.tableView reloadData];
////
////    }
//    
//}
////Product has %d max items
//- (IBAction)btnContinue_Touch:(id)sender {
//    
////     CommonModule *modcomm = [[CommonModule alloc]init];
////    if ([[modcomm getSelectedGroups] count]>0) {
////        [self performSegueWithIdentifier:@"preview" sender:self];
////    } else {
////        UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"ERROR", nil) message:NSLocalizedString(@"ITEMNOTSELECTED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////        [alertMsg show];
////    }
//}
//
//- (IBAction)btnBack_Touch:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
////    if(indexPath.section == [arrGroupList count]){
//        return 49;
////    }else {
//        
////        TblItem *tblitem = [[arrItemList objectAtIndex:indexPath.section]  objectAtIndex:indexPath.row];
////        NSString *trimmedString = [tblitem.itemName stringByTrimmingCharactersInSet:
////                                   [NSCharacterSet whitespaceCharacterSet]];
////        CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
////        
////        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
////                                                      options:NSStringDrawingUsesLineFragmentOrigin
////                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
////                                                      context:nil];
////        return textRect.size.height+30;
////        
////    }
//
//}
//
//- (void)loadGroupList {
//    
////    ProductModule *daoProduct = [[ProductModule alloc]init];
////    arrItemList = [[NSMutableArray alloc]init];
////    arrGroupList = [daoProduct getGroupListById:nGroupProdId];
////    int i;
////    for (i = 0; i< [arrGroupList count]; i++) {
////        ItemModule *daoItem = [[ItemModule alloc]init];
////        [arrItemList addObject:[daoItem getItemListByGroupId:[arrGroupList objectAtIndex:i]]];
////        
////    }
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"option"]) {         
//        OptionsViewController *opts = segue.destinationViewController;
//        opts.nitemid = sender;
//        opts.nSiteId = nSiteId;
//        opts.sOrderType = sOrderType;
//        opts.sTime = sTime;
//        opts.nprodid = nGroupProdId;
//        opts.sCouponId = nCouponId;
//        opts.nmodCount = nmaxMod;
//        opts.optaddress=saddress;
//        opts.pparent = self.pparent;
//    } else if ([segue.identifier isEqualToString:@"preview"]) {
//        
//        PreviewController *opts = segue.destinationViewController;
//        
//        opts.SelectedSiteId = nSiteId;
//        opts.OrderType = sOrderType;
//        opts.preaddress=saddress;
//         opts.pparent = self.pparent;
//    }
//}
//
//
////-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
////    
////    UITableViewRowAction *checkButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:([self isRowSelectedOnTableView:tableView atIndexPath:indexPath]) ? @"Uncheck" : @"Check" handler:^(UITableViewRowAction *action, NSIndexPath *indexcbPath)
////                                    {
////                                        NSLog(@"Action to perform with Check/Uncheck");
////                                        
////                                        TblItem *objitem= [arrItemList objectAtIndex:indexcbPath.row];
////                                        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
////                                        if([self isRowSelectedOnTableView:tableView atIndexPath:indexcbPath]){
////                                            [self.selectedCells removeObject:indexcbPath];
////                                            [self.selecedItems removeObject:[objitem itemId]];
////                                            cell.accessoryType = UITableViewCellAccessoryNone;
////                                            nSelectedItemId = nil;
////                                        } else {
////                                            int maxCount = (int)[selecedItems count];
////                                            if (maxCount >= maxItem) {
////                                                UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:@"Warning" message:[NSString stringWithFormat:@"Product has %d max items", maxItem] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////                                                [alertMsg show];
////                                            } else {
////                                               
////                                                [self.selectedCells addObject:indexcbPath];
////                                                [self.selecedItems addObject:[objitem itemId]];
////                                                nSelectedItemId = [objitem itemId];
////                                                cell.accessoryType = UITableViewCellAccessoryCheckmark;
////                                                
////                                            }
////                                        }
////                                        NSLog(@"%@", selecedItems);
////                                        
////                                        [self.tableView reloadData]; // Reload after checked or unchecked item
////                                        
////                                    }];
////    checkButton.backgroundColor = [UIColor darkGrayColor]; //arbitrary color
////    UITableViewRowAction *modbutton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Modifier" handler:^(UITableViewRowAction *action, NSIndexPath *indexmbPath)
////                                     {
////                                         NSLog(@"Action to perform with Modifier!");
////                                         ItemModule *daoItem = [[ItemModule alloc]init];
////                                         NSMutableArray *arrOptions = [daoItem getItemModifierById:nSelectedItemId];
////                                         
////                                         if (nSelectedItemId!=nil && [arrOptions count]>0) {
////                                             [self performSegueWithIdentifier:@"option" sender:nSelectedItemId];
////                                         } else {
////                                             UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Item not selected." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////                                             [alertMsg show];
////                                         }
////                                     }];
////    modbutton.backgroundColor = [UIColor lightGrayColor]; //arbitrary color
////    
////    return @[checkButton, modbutton];
////}
////
////- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
////    // you need to implement this method too or nothing will work:
////
////}
////- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    return YES; //tableview must be editable or nothing will work...
////}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == [arrGroupList count])
//        return 5.0;
//    else
//        return UITableViewAutomaticDimension;
//}
//
//
//@end
