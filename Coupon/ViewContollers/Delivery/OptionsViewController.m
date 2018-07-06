//
//  OptionsViewController.m
//  EB
//
//  Created by Kaliyarajalu on 26/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "OptionsViewController.h"
#import "CustomItemCell.h"
#import "PreviewController.h"

@interface OptionsViewController () {
    
    NSMutableArray *arrOptions;
    NSIndexPath* checkedIndexPath;
    NSNumber *selectedModId;
    
    NSMutableArray *arrCheckStatus;
}

@end

@implementation OptionsViewController
@synthesize nprodid;
@synthesize nitemid;
@synthesize nSiteId;
@synthesize sOrderType;
@synthesize sTime;
@synthesize sCouponId;
@synthesize nmodCount;
@synthesize optaddress;

@synthesize selecedModifier;
@synthesize selectedCells;


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    ItemModule *daoItem = [[ItemModule alloc]init];
//    arrOptions = [daoItem getItemModifierById:nitemid];
//    
//    selecedModifier = [[NSMutableArray alloc]init];
//    NSLog(@"%@", nmodCount);
//    
//    CommonModule *modcomm = [[CommonModule alloc]init];
//    selecedModifier = [modcomm getModifierList:nitemid];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if (section == 0) {
         return [arrOptions count];
    } else {
         return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = NULL;
    
    // Configure the cell...
    
//    if (indexPath.section == 0) {
//        
//       CustomItemCell *optcell = [tableView dequeueReusableCellWithIdentifier:@"Options" forIndexPath:indexPath];
//        
//       TblModifier *tblmod = [arrOptions objectAtIndex:indexPath.row];
//       
//       optcell.lblOptions.text = [tblmod modifierName];
//        
//       optcell.accessoryType = ([self isRowSelectedOnTableView:tableView atIndexPath:[tblmod modifierId]]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
//        cell = optcell;
//        
//    }
//    else if (indexPath.section == 1) {
//        CustomItemCell *concell = [tableView dequeueReusableCellWithIdentifier:@"Continue" forIndexPath:indexPath];        
//        cell = concell;
//    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.section == 0) {
//        
//        TblModifier *tblmod = [arrOptions objectAtIndex:indexPath.row];
//        
//        NSString *trimmedString = [tblmod.modifierName stringByTrimmingCharactersInSet:
//                                   [NSCharacterSet whitespaceCharacterSet]];
//        CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
//        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
//                                                      options:NSStringDrawingUsesLineFragmentOrigin
//                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
//                                                      context:nil];
//        return textRect.size.height+30;
//        
//    }else{
        return 50;
//    }
}
- (IBAction)btnConfirm_Touch:(id)sender {
//    CommonModule *modcomm = [[CommonModule alloc]init];
//    
//    [modcomm deleteModifiersByItemId:nitemid];
//    for (int i=0; i<[selecedModifier count]; i++) {
//        [modcomm updateSelectedModiferId:[selecedModifier objectAtIndex:i] ItemId:nitemid];
//    }
//    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)isRowSelectedOnTableView:(UITableView *)tableView atIndexPath:(NSNumber *)indexPath
{
    return ([selecedModifier containsObject:indexPath]) ? YES : NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TblModifier *objmodifier = [arrOptions objectAtIndex:indexPath.row];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    if([self isRowSelectedOnTableView:tableView atIndexPath:[objmodifier modifierId]]){
//        [self.selecedModifier removeObject:[objmodifier modifierId]];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    } else {
//        NSUInteger modCount = [selecedModifier count];
//        if (modCount >= [nmodCount intValue]) {
//            
//             NSString* s = [NSString  stringWithFormat:@"%@ %ld %@", NSLocalizedString(@"ITEMHASMAXMODIFIERS1", nil), (unsigned long)[nmodCount intValue], NSLocalizedString(@"ITEMHASMAXMODIFIERS2", nil)];
//            
//            UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"WARNING", nil) message:s delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alertMsg show];
//        }
//        else {
//            [self.selecedModifier addObject:[objmodifier modifierId]];
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
//            
//        }
//    }
    
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1)
        return 5.0;
    else
        return UITableViewAutomaticDimension;
}

@end
