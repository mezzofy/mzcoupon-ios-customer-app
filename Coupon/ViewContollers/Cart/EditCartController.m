//
//  EditCartController.m
//  EB
//
//  Created by Kaliyarajalu on 05/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "EditCartController.h"
#import "UIImageView+WebCache.h"

#import "SiteListTableViewController.h"
#import "SiteMapController.h"
#import "TermsConditionView.h"
#import "ProductViewCell.h"
#import "Utils.h"
#import "PagedImageScrollView.h"
#import "TodaysMenuController.h"
#import "CartModule.h"
#import "SiteModule.h"
#import "ProductModule.h"



@interface EditCartController () {
    CartModule *modcart;
    NSMutableArray *arrSiteList;
    NSString *Quatity;
    NSNumber *_txnQty;
    double _txntotal;
    TblProduct *objprod;
    NSMutableArray *arrProductImageList;

}

@end

@implementation EditCartController
@synthesize pcartid;
@synthesize txtQty,stepper;

- (void)viewDidLoad {
    [super viewDidLoad];
    modcart=[[CartModule alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    objprod=[modcart getCartdetailsCartId:[pcartid integerValue]];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    _txnQty = [f numberFromString:objprod.productQty];
   
    
    SiteModule *daoSite = [[SiteModule alloc]init];
    arrSiteList = [daoSite getSiteFromTable:objprod.campaignId];
    
    
    
    self.title = [objprod campaignName];
    
   
    [stepper setValue:[_txnQty intValue]];
    [txtQty setDelegate:self];
    txtQty.text = [_txnQty stringValue];
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
    return 11;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1f;
    }
    return 1.0;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
        objprod=[modcart getCartdetailsCartId:[pcartid integerValue]];
    
   
        if (indexPath.row == 0) {
            ProductViewCell *cellgeneral = [tableView dequeueReusableCellWithIdentifier:@"cellimg" forIndexPath:indexPath];
            
            ProductModule *modproduct = [[ProductModule alloc]init];
            arrProductImageList=[modproduct getCampaignImg:objprod.campaignId];
            
            if ([arrProductImageList count]>0) {
                PagedImageScrollView *pageScrollView = [[PagedImageScrollView alloc] initWithFrame:CGRectMake(0, 0, cellgeneral.frame.size.width, cellgeneral.frame.size.height)];
                
                [pageScrollView setScrollViewUrlContents:arrProductImageList];
                [cellgeneral addSubview:pageScrollView];
                
            }else{
                [cellgeneral.imgProduct setImage:[UIImage imageNamed:@"noimg.jpg"]];
            }
            
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
            NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
            [formatter setGroupingSeparator:groupingSeparator];
            [formatter setGroupingSize:3];
            [formatter setAlwaysShowsDecimalSeparator:NO];
            [formatter setUsesGroupingSeparator:YES];
            NSString *formattedString = [objprod sellingPrice];
            cellgeneral.lblPrice.text = [NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],formattedString];
            
            NSDictionary* attrs = @{
                                    NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                    };
            
            NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod orginalPrice]] attributes:attrs];
            
            cellgeneral.lblOriginalPrice.attributedText = attrText;
            cell = cellgeneral;
        } else if (indexPath.row == 1) {
            ProductViewCell *cellproduct = [tableView dequeueReusableCellWithIdentifier:@"cellmer" forIndexPath:indexPath];
            cellproduct.lblProductName.text = [objprod campaignName];
            cell = cellproduct;
        } else if (indexPath.row == 2) {
            ProductViewCell *cellprice = [tableView dequeueReusableCellWithIdentifier:@"cellprice" forIndexPath:indexPath];
            
            NSMutableAttributedString *originalPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"ORIGINAL", nil),[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod orginalPrice]]]];
            NSMutableAttributedString *nowPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"NOW", nil),[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod sellingPrice]]]];
            
            [originalPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [originalPrice length])];
            
            [originalPrice addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [originalPrice length])];
            
//            if ([[objprod orginalPrice] isEqualToNumber:[NSNumber numberWithDouble:0]]) {
                cellprice.lblPrice.attributedText = nowPrice;
//            }else{
            
                NSMutableAttributedString *price = [originalPrice mutableCopy];
                [price appendAttributedString:nowPrice];
                
                [cellprice.lblPrice setAttributedText:price];

//            }
            
            cell = cellprice;
        } else if (indexPath.row == 3) {
            ProductViewCell *celltop = [tableView dequeueReusableCellWithIdentifier:@"celltop" forIndexPath:indexPath];
            cell = celltop;
        } else if (indexPath.row == 4) {
            ProductViewCell *cellproddesctitle = [tableView dequeueReusableCellWithIdentifier:@"cellproddesctitle" forIndexPath:indexPath];
            cell = cellproddesctitle;
        } else if (indexPath.row == 5) {
            ProductViewCell *cellproddesc = [tableView dequeueReusableCellWithIdentifier:@"cellproddesc" forIndexPath:indexPath];
            cellproddesc.lblProductDesc.text = [objprod campaignDesc];
            cell = cellproddesc;
        } else if (indexPath.row == 6) {
            ProductViewCell *celltc = [tableView dequeueReusableCellWithIdentifier:@"celltc" forIndexPath:indexPath];
            celltc.txttermcond.text = [objprod campaignTc];
            cell = celltc;
       } else if (indexPath.row == 7) {
           ProductViewCell *cellmenu = [tableView dequeueReusableCellWithIdentifier:@"cellmenu" forIndexPath:indexPath];
//           ProductModule *daoItem = [[ProductModule alloc]init];
//           NSMutableArray *arryitem=[daoItem getGroupListById:[tblProd prodId]];
//           if ([arryitem count]>0) {
//               [cellmenu.contentView setHidden:false];
//           }
//           else{
               [cellmenu.contentView setHidden:true];
//           }

           cell = cellmenu;

        } else if (indexPath.row == 8) {
            ProductViewCell *cellspacer = [tableView dequeueReusableCellWithIdentifier:@"cellspacer" forIndexPath:indexPath];
            cell = cellspacer;
        } else if (indexPath.row == 9) {
            ProductViewCell *cellnotes = [tableView dequeueReusableCellWithIdentifier:@"cellnotes" forIndexPath:indexPath];
            [cellnotes.btnSupport addTarget:self action:@selector(btncallPhone:) forControlEvents:UIControlEventTouchUpInside];
            [cellnotes.btnShare addTarget:self action:@selector(btnShare:) forControlEvents:UIControlEventTouchUpInside];
            cell = cellnotes;
        } else if (indexPath.row == 10) {
            ProductViewCell *cellbottom = [tableView dequeueReusableCellWithIdentifier:@"cellbottom" forIndexPath:indexPath];
            cell = cellbottom;
        }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ((indexPath.section == 0) && (indexPath.row == 0)) {
        return 290.0;
    }else     if ((indexPath.section == 0) && (indexPath.row == 1)) {
        NSString *trimmedString = [[objprod campaignName] stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]}
                                                      context:nil];
        
        return textRect.size.height+10;
        }else     if ((indexPath.section == 0) && (indexPath.row == 5)) {
        NSString *trimmedString = [objprod.campaignDesc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                      context:nil];
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 6)) {
        NSString *trimmedString = [objprod.campaignTc stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(290, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                      context:nil];
        return textRect.size.height+10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 2)) {
        return 30;
    }else     if ((indexPath.section == 0) && (indexPath.row == 3)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 7)) {
//        ProductModule *daoItem = [[ProductModule alloc]init];
//        NSMutableArray *arryitem=[daoItem getGroupListById:[objprod prodId]];
//        if ([arryitem count]>0) {
//            return 35;
//        } else {
//            return 0;
//        }
        return 30;
    }else     if ((indexPath.section == 0) && (indexPath.row == 8)) {
        return 10;
    }else     if ((indexPath.section == 0) && (indexPath.row == 9)) {
        return 60;
    }else     if ((indexPath.section == 0) && (indexPath.row == 10)) {
        return 10;
    }
    return 30;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField tag] == 1) {
        _txnQty = [NSNumber numberWithInt:[[textField text] intValue]];
    }
}

-(IBAction)stepperChanged:(UIStepper*)sender {
    int value = (int)[sender value];
    
    _txnQty = [NSNumber numberWithInt:value];
    [self updateHeaderTotal];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"map"]) {
        
        SiteMapController *siteMap = segue.destinationViewController;
        siteMap.objsite = sender;
    }
    else if ([segue.identifier isEqualToString:@"sitelist"]) {
        SiteListTableViewController *vcsitelist = segue.destinationViewController;
        vcsitelist.arrSiteList = arrSiteList;
    }
    else if ([segue.identifier isEqualToString:@"read"]) {
        TermsConditionView *terms = segue.destinationViewController;
        terms.reviewUrl = [objprod reviewUrl];
    }
//    else if ([segue.identifier isEqualToString:@"trmenu"]) {
//        TodaysMenuController *menu = segue.destinationViewController;
//        menu.nGroupProdId = [tblProd prodId];
//    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    _txnQty = [NSNumber numberWithInt:[[textField text] intValue]];
    txtQty.text = [_txnQty stringValue];
    _txntotal = [self getCartItemTotal:_txnQty];
    [self.tableView reloadData];
    [textField resignFirstResponder];
    
    return YES;
}

- (void)updateHeaderTotal {
    txtQty.text = [_txnQty stringValue];
    [txtQty setDelegate:self];
    [txtQty addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchDown];
    txtQty.tag = 1;
    _txntotal = [self getCartItemTotal:_txnQty];
    
    
}


- (IBAction)btnUpdate_Touch:(id)sender {
    

    [objprod setProductQty:[NSString stringWithFormat:@"%@",_txnQty]];
    [objprod setTotalPrice:[NSString stringWithFormat:@"%.2f",[self getCartItemTotal:_txnQty]]];
    BOOL retval = [modcart updateCartItemsData:objprod];
    
    if (retval) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dispcartinfo" object:@"display"];
    
}



- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btncallPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", [Common getMerchantHotline]]]];
}
- (IBAction)btnShare:(id)sender {
//    tblProdimg=[arrProductImageList objectAtIndex:0];
//    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[tblProdimg productImage]]]];
//    NSString *merchtname= [tblMerch merchantName];
//    NSString *prodname= [NSString stringWithFormat:@"%@ X %@",[objprod productName],_txnQty.stringValue];
//
//    NSString *price= [NSString stringWithFormat:@"%@ %@",[tblComp currency],[objprod sellingPrice]];
//    
//    NSURL *shareUrl = [NSURL URLWithString:@"http://www.wal-net.com/download"];
//    NSArray *itemsToShare = @[img,merchtname,prodname,price,shareUrl];
//    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
//    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll]; //or whichever you don't need
//    [self presentViewController:activityVC animated:YES completion:nil];
    
}

-(double)getCartItemTotal:(NSNumber*)pqty{
    double retval = 0;
    
    double itemprice =[[objprod sellingPrice] doubleValue];
    
    retval = [pqty intValue] * itemprice;
    
    return retval;
}

@end
