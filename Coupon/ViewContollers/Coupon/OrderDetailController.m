//
//  OrderDetailController.m
//  SuPerk
//
//  Created by Kaliyarajalu on 25/02/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "OrderDetailController.h"
#import "CustomItemCell.h"
#import "DeliveryCell.h"
#import "Common.h"
#import "CouponOrderModule.h"
#import "SiteModule.h"
#import "TblSite.h"
#import "CouponModule.h"
#import "TblCouponData.h"
#import "CustomerModule.h"


@interface OrderDetailController () {
    TblCustomerData *objcus;
    CouponOrderModule *modcoupon;
    TblOrderData *objorderdata;
}

@end

@implementation OrderDetailController
@synthesize CouponId;

- (void)viewDidLoad {
    [super viewDidLoad];
    modcoupon=[[CouponOrderModule alloc]init];
    objorderdata=[[TblOrderData alloc]init];
    objcus=[[TblCustomerData alloc]init];
    CustomerModule *modcustomer= [[CustomerModule alloc]init];
    objcus=[modcustomer getCustmerList];
    objorderdata=[modcoupon getCouponOrderData:CouponId];
    
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
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return (4);
    }  else if (section == 1) {
        return 2;
    }
    //    } else if(section <= [selectedgroups count]){
    //        CommonModule* modcmn = [[CommonModule alloc]init];
    //        return [[modcmn getOrderItemList:[selectedgroups objectAtIndex:(section - 1)][0] CouponId:sCouponId] count];
    //    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            CouponModule *couponmodule=[[CouponModule alloc]init];
            TblCouponData *objcoupon=[couponmodule getCouponDetailsWhereCouponId:objorderdata.couponId];
            prodcell.lblPreviewItem.text = [objcoupon couponName];
            
            cell = prodcell;
        } else if (indexPath.row == 1) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            
            SiteModule *modsite = [[SiteModule alloc]init];
            TblSite *objsite = [modsite getSite:objorderdata.siteId];
            if ([[objorderdata orderType] isEqualToString:@"P"] || [[objorderdata orderType] isEqualToString:@"B"] || [[objorderdata orderType] isEqualToString:@"O"]){
                prodcell.lblPreviewItem.text = [objsite siteName];
            }else if ([[objorderdata orderType] isEqualToString:@"C"] || [[objorderdata orderType] isEqualToString:@"D"]){
                prodcell.lblPreviewItem.text = [objorderdata customerAddress];
            }
            
            
            cell = prodcell;
        } else if (indexPath.row == 2) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            
            NSString *strType = @"";
            if ([[objorderdata orderType] isEqualToString:@"P"]) {
                strType =NSLocalizedString(@"PICKUP", nil);
            }
            else if ([[objorderdata orderType] isEqualToString:@"B"]) {
                strType =NSLocalizedString(@"BOOKING", nil);
            }
            else if ([[objorderdata orderType] isEqualToString:@"C"]) {
                strType =NSLocalizedString(@"OUTCALL", nil);
            }else if ([[objorderdata orderType] isEqualToString:@"D"]){
                strType =NSLocalizedString(@"DELIVERY", nil);
            }
//            if ([[objorderdata orderType] isEqualToString:@"O"]){
            else
                strType =NSLocalizedString(@"InStoreRedeemed", nil);
            
            
            prodcell.lblPreviewItem.text =[NSString stringWithFormat:NSLocalizedString(@"ORDERTYPE", nil),strType];
            
            cell = prodcell;
        } else if (indexPath.row == 3) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            
            if(objorderdata.orderDate.length>=10){
                NSString *newStr = [[objorderdata orderDate] substringWithRange:NSMakeRange(0, 10)];
                
                NSTimeInterval timest = [newStr  doubleValue];
                NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd-MM-yyyy HH:MM:SS"];
                NSString *orderdate = [formatter stringFromDate:dt];
                prodcell.lblPreviewItem.text =[NSString stringWithFormat:NSLocalizedString(@"TIME", nil),orderdate];
                
            }else
                prodcell.lblPreviewItem.text =[NSString stringWithFormat:NSLocalizedString(@"TIME", nil),@""];
            cell = prodcell;
        }
    }
    else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            DeliveryCell *contactcell = [tableView dequeueReusableCellWithIdentifier:@"Contact" forIndexPath:indexPath];
            
            contactcell.lblContact.tag = 1;
            
            if(objorderdata.contactNo )
                [contactcell.lblContact setText:[NSString stringWithFormat:NSLocalizedString(@"CONTACT", nil),objorderdata.contactNo]];
            
            else if(objcus.customerMobile)
                [contactcell.lblContact setText:[NSString stringWithFormat:NSLocalizedString(@"CONTACT", nil),objcus.customerMobile]];
            else
                [contactcell.lblContact setText:[NSString stringWithFormat:NSLocalizedString(@"CONTACT", nil),@""]];
            
            cell = contactcell;
            
            
        }
        
        else if (indexPath.row == 1) {
            
            DeliveryCell *contactcell = [tableView dequeueReusableCellWithIdentifier:@"Remarks" forIndexPath:indexPath];
            if([objorderdata orderRemark])
                [contactcell.lblRemarks setText:[NSString stringWithFormat:NSLocalizedString(@"REMARKS", nil),[objorderdata orderRemark]]];
            else
                [contactcell.lblRemarks setText:[NSString stringWithFormat:NSLocalizedString(@"REMARKS", nil),@""]];
            cell = contactcell;
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return NSLocalizedString(@"ORDERDETAILS", nil);
    }  else if (section == 1) {
        return NSLocalizedString(@"NOTES", nil);
    }
    return @"";
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger height = 0;
    if (indexPath.section == 0 && indexPath.row == 1) {
        SiteModule *modsite = [[SiteModule alloc]init];
        TblSite *objsite = [modsite getSite:[objorderdata siteId]];
        NSString* addrval;
        
        if ([[objorderdata orderType] isEqualToString:@"P"] || [[objorderdata orderType] isEqualToString:@"B"]){
            addrval = [NSString stringWithFormat:NSLocalizedString(@"SHOP", nil),[objsite siteName]];
        }else if ([[objorderdata orderType] isEqualToString:@"C"] || [[objorderdata orderType] isEqualToString:@"D"]){
            addrval = [NSString stringWithFormat:NSLocalizedString(@"SHOP", nil),[objorderdata customerAddress]];
        }else if ([[objorderdata orderType] isEqualToString:@"O"]){
            addrval = [NSString stringWithFormat:NSLocalizedString(@"SHOP", nil),[objsite siteName]];
        }
        
        NSString *trimmedString = [addrval stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
                                                      context:nil];
        height=textRect.size.height+15;
        return height;
        
        //    } else if (indexPath.section != 0 && indexPath.section <= [selectedgroups count]) {
        //
        //
        //        CommonModule* modcmn = [[CommonModule alloc]init];
        //        NSMutableArray* items = [modcmn getOrderItemList:[selectedgroups objectAtIndex:(indexPath.section - 1)][0] CouponId:sCouponId];
        //        NSMutableArray* arritem = [items objectAtIndex:indexPath.row];
        //        if (arritem != NULL) {
        //            NSString *trimmedString = [arritem[1] stringByTrimmingCharactersInSet:
        //                                       [NSCharacterSet whitespaceCharacterSet]];
        //            CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
        //            CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
        //                                                          options:NSStringDrawingUsesLineFragmentOrigin
        //                                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
        //                                                          context:nil];
        //            height=height+textRect.size.height+30;
        //        }
        //
        //        if (arritem != NULL) {
        //
        //            NSMutableArray *arrmod = [modcmn getOrderModifierById:arritem[0] CouponId:sCouponId];
        //
        //            for (NSMutableArray *modval in arrmod) {
        //                NSString *trimmedString = [modval[1] stringByTrimmingCharactersInSet:
        //                                           [NSCharacterSet whitespaceCharacterSet]];
        //                CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
        //                CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
        //                                                              options:NSStringDrawingUsesLineFragmentOrigin
        //                                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
        //                                                              context:nil];
        //                height=height+textRect.size.height+15;
        //            }
        //
        //
        //        }
        //        height+= 5;
        //        return height;
    } else if ((indexPath.section == 1) && (indexPath.row == 1)) {
        if([objorderdata orderRemark] ){
            NSString *trimmedString = [[NSString stringWithFormat:NSLocalizedString(@"REMARKS", nil),[objorderdata orderRemark]] stringByTrimmingCharactersInSet:
                                       [NSCharacterSet whitespaceCharacterSet]];
            CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
            CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
                                                          context:nil];
            height=textRect.size.height+15;
            return height;
        }
    }
    return 50;
}


- (IBAction)btnBack_Touch:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
