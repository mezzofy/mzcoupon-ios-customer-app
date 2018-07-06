//
//  PreviewController.m
//  EB
//
//  Created by Kaliyarajalu on 05/01/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "PreviewController.h"
#import "CustomItemCell.h"
#import "DeliveryCell.h"
#import "Common.h"
#import "RedemptionSuccess.h"
#import "SiteModule.h"
#import "CustomerModule.h"
#import "TblCustomerData.h"
#import "CouponModule.h"
#import "TblCouponData.h"
#import "CouponOrderModule.h"
#import <MZCoupon/MZCoupon.h>


@interface PreviewController () {
    NSString *Contact, *Remarks;
    
    TblCouponData *objcoupon;

}
@end

@implementation PreviewController
@synthesize SelectedProdId;
@synthesize SelectedSiteId;
@synthesize OrderType;
@synthesize preaddress,CouponId;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CommonModule* modcmn = [[CommonModule alloc]init];
//    selectedgroups = [modcmn getSelectedGroups];
//    CustomerModule *daostaff=[[CustomerModule alloc]init];
//    objcus=[daostaff getCustmerList];
    
    
    CouponModule *modcoup=[[CouponModule alloc]init];
    objcoupon=[modcoup getCouponDetailsWhereCouponId:CouponId];

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
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return 3;
    else if (section == 1)
        return 4;
 
    return 0;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0)
        return NSLocalizedString(@"ORDERDETAILS", nil);
      else if (section == 1)
        return NSLocalizedString(@"NOTES", nil);
    
    return @"";
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
  
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            prodcell.lblPreviewItem.text = objcoupon.couponName;
            
            cell = prodcell;
        } else if (indexPath.row == 1) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            
            
            if (SelectedSiteId.length>1) {
                SiteModule *daoSite = [[SiteModule alloc]init];
                TblSite *objsite = [daoSite getSite:SelectedSiteId];
                prodcell.lblPreviewItem.text = [objsite siteName];
            }else
                prodcell.lblPreviewItem.text = preaddress;
            
            
            
            cell = prodcell;
        } else if (indexPath.row == 2) {
            
            CustomItemCell *prodcell = [tableView dequeueReusableCellWithIdentifier:@"previewcell" forIndexPath:indexPath];
            
            NSString *strType = NULL;
            if ([OrderType isEqualToString:@"P"]) {
                strType =NSLocalizedString(@"PICKUP", nil);
            }
            else if ([OrderType isEqualToString:@"B"]) {
                strType =NSLocalizedString(@"BOOKING", nil);
            }
            else if ([OrderType isEqualToString:@"C"]) {
                strType =NSLocalizedString(@"OUTCALL", nil);
            }else if ([OrderType isEqualToString:@"D"]){
                strType =NSLocalizedString(@"DELIVERY", nil);
            }
            prodcell.lblPreviewItem.text =[NSString stringWithFormat:NSLocalizedString(@"ORDERTYPE", nil),strType];
            
            cell = prodcell;
        }
    }
    else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            DeliveryCell *contactcell = [tableView dequeueReusableCellWithIdentifier:@"Contact" forIndexPath:indexPath];
            
            [contactcell.txtContact setDelegate:self];
            
            contactcell.txtContact.tag = 1;
            
            if(Contact != nil) {
                contactcell.txtContact.text = Contact;
            }
            else {
                Contact=
                 contactcell.txtContact.text = Contact;
            }
            
            [contactcell.txtContact addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchDown];
            
            cell = contactcell;
        }
        
        else if (indexPath.row == 1) {
            
            DeliveryCell *contactcell = [tableView dequeueReusableCellWithIdentifier:@"Remarks" forIndexPath:indexPath];
            
            [contactcell.txtRemarks setDelegate:self];
            
            contactcell.txtRemarks.tag = 2;
            
            if(Remarks == nil) {
                contactcell.txtRemarks.text = NSLocalizedString(@"REMARKSX", nil);
                contactcell.txtRemarks.textColor = [UIColor lightGrayColor];
            }else{
                contactcell.txtRemarks.text = Remarks;
            }
            
            
//                        [contactcell.txtRemarks addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchDown];
            
            cell = contactcell;
        }
        
        else if (indexPath.row == 2) {
            
            DeliveryCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"Empty" forIndexPath:indexPath];
            
            cell = emptycell;
        }
        
        else if (indexPath.row == 3) {
            
            DeliveryCell *contactcell = [tableView dequeueReusableCellWithIdentifier:@"Confirm" forIndexPath:indexPath];
            
            [contactcell.btnConfirm addTarget:self action:@selector(btnConfirm_Touch:) forControlEvents:UIControlEventTouchUpInside];
            
            cell = contactcell;
        }
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger height = 0;
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        NSString* addrval;
        if(SelectedSiteId.length>1){
            SiteModule *daoSite = [[SiteModule alloc]init];
            TblSite *objsite = [daoSite getSite:SelectedSiteId];
            addrval = [objsite siteName];
        }else
            addrval = preaddress;
        
        NSString *trimmedString = [addrval stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        CGSize maximumLabelSize = CGSizeMake(350, 9999); // this width will be as per your requirement
        CGRect textRect = [trimmedString boundingRectWithSize:maximumLabelSize
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
                                                      context:nil];
        height=textRect.size.height+15;
        return height;

    }else if (indexPath.section == 1 && indexPath.row == 2) {
        return 17;
    }
    else if (indexPath.section == 1 && indexPath.row == 1){
        return 100;
    }
    return 40;
}


- (IBAction)btnConfirm_Touch:(id)sender {
    if(Remarks == NULL)
        Remarks = @"";
    
    if(Contact == NULL)
        Contact = @"";
  
    OrderData *objorderdata=[[OrderData alloc]init];
    [objorderdata setSiteId:SelectedSiteId];
    [objorderdata setCouponId:CouponId];
    [objorderdata setOrderType:OrderType];
    [objorderdata setContactNo:Contact];
    [objorderdata setOrderRemark:Remarks];
    [objorderdata setCustomerAddress:preaddress];
    [objorderdata setCustomerId:[Common getCustomerId]];
    
    OrderDataModel *objordermodel=[[OrderDataModel alloc]init];
    [objordermodel setOrder:objorderdata];
    
    CouponOrderModule *modcouponorder=[[CouponOrderModule alloc]init];
   
    NSString *retval=[modcouponorder OrderCouponToServer:objordermodel];
    if(![retval isEqualToString:@"SUCCESS"]){
         [self performSegueWithIdentifier:@"notdoneitem" sender:self];
        
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"redemptiondone"]) {
        RedemptionSuccess *success = segue.destinationViewController;
        success.pparent = self.pparent;
        }
}

//TextField
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if(textField.tag == 1)
        Contact = [textField text];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    Remarks=[textView text];
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = NSLocalizedString(@"REMARKSX", nil);
        [textView resignFirstResponder];
    }
}
- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnClose_Touch:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"PREVIEWEXIT", nil)
                                          message:NSLocalizedString(@"AREYOUSURETOEXITFROMPREVIEWSCREEN", nil)
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if (([txt isKindOfClass:[UITextField class]] || [txt isKindOfClass:[UITextView class]]) && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//
//    if (buttonIndex == 1) {
//
//        NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v6/release_stock/%@?couponId=%@",nSelectedProdId, sCouponId] param:nil];
//        if (data) {
//            NSError *error;
//            NSDictionary* resdict = [NSJSONSerialization
//                                     JSONObjectWithData:data options:kNilOptions error:&error];
//            if ([resdict objectForKey:@"response"]) {
//                NSDictionary *arritemres = [resdict objectForKey:@"response"];
//                NSString* response_code = [arritemres valueForKey:@"response_code"];
//                
//                if ([response_code isEqualToString:@"0"]){
//                    NSDictionary *res=[resdict objectForKey:@"stock"];
//            if ([res valueForKey:@"stockQty"] && [[res valueForKey:@"stockQty"] intValue] > 0) {
//                
//                CommonModule *modcomm = [[CommonModule alloc]init];
//                [modcomm deleteSelectedItems];
//                [modcomm deleteSelectedItemModifier];
//                [self.navigationController popToRootViewControllerAnimated:YES];
//                
//            }
//        }
//        
//    }
//}
//    }
//}
@end
