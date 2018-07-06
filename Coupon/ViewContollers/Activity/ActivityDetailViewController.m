//
//  ActivityDetailViewController.m
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityCell.h"
#import "ActivityDtlCell.h"
#import "Common.h"
#import <MessageUI/MessageUI.h>
#import "TblProductOrderDtl.h"
#import "ProductOrderModule.h"


@interface ActivityDetailViewController () {
    ProductOrderModule *modproorder;
}

@end

@implementation ActivityDetailViewController
@synthesize poId;
- (void)viewDidLoad {
    [super viewDidLoad];
    modproorder = [[ProductOrderModule alloc]init];

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

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [modproorder getProductOrderdetailcountbyproductorderId:poId]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* retval;
    if(indexPath.row < [modproorder getProductOrderdetailcountbyproductorderId:poId]){
        ActivityDtlCell *cell=(ActivityDtlCell *)[tableView dequeueReusableCellWithIdentifier:@"activitydtlcell" forIndexPath:indexPath];
    
        TblProductOrderDtl *objproddtl=[modproorder getProductOrderdetailbyproductorderId:poId Offset:indexPath.row];
        [cell.lblQty setText:[NSString stringWithFormat:@"X %2d ", [objproddtl campaignQty].intValue]];
    
        [cell.lblProdname setText:[objproddtl campaignName]];
        
        cell.lblMerchtname.text= [objproddtl campaignName];
        
//        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//        [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//        NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//        [formatter setGroupingSeparator:groupingSeparator];
//        [formatter setGroupingSize:3];
//        [formatter setAlwaysShowsDecimalSeparator:NO];
//        [formatter setUsesGroupingSeparator:YES];
//        NSString *formattedString = [formatter stringFromNumber:];
        [cell.lblTxnPrice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objproddtl campaignTotal]]];
        retval = cell;
    }else{
        ActivityCell *cell=(ActivityCell *)[tableView dequeueReusableCellWithIdentifier:@"activitysum" forIndexPath:indexPath];
        TblProductOrder *objproductorder=[modproorder getProductOrderbyproductId:poId];
        [cell.lblTxnId setText:[objproductorder poId]];
        [cell.lblTxnNo setText:[objproductorder poNo]];
        
//        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//        [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//        NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//        [formatter setGroupingSeparator:groupingSeparator];
//        [formatter setGroupingSize:3];
//        [formatter setAlwaysShowsDecimalSeparator:NO];
//        [formatter setUsesGroupingSeparator:YES];
//        NSString *formattedString = [formatter stringFromNumber:[objtxn transactionTotal]];
         [cell.lblTxnPrice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],objproductorder.poTotal]];
        [cell.lblTxnDateTime setText:[objproductorder updatedOn]];
        
        if([objproductorder.payResponse isEqualToString:@"0"])
            [cell.lblTxnStatus setText:NSLocalizedString(@"SUCCESS", nil)];
        else
            [cell.lblTxnStatus setText:NSLocalizedString(@"FAILURE", nil)];
        retval = cell;
    }

    return retval;
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

////Transactions send via email on request
- (IBAction)btnSendEmail_Touch:(id)sender {

    TblProductOrder *objproductorder=[modproorder getProductOrderbyproductId:poId];
    NSMutableString *arrmessage = [[NSMutableString alloc]init];
    
    [arrmessage appendString:[NSString stringWithFormat:@"<html><table style=width:100%% bgcolor=#ebebeb><tr><td height=150 align=center><img src=https://s3-ap-southeast-1.amazonaws.com/stgpromzgetso/logo/thumnail.png style=width:200px;></td></tr></table><br/></html>"]];
    
    [arrmessage appendString:[NSString stringWithFormat:NSLocalizedString(@"INVOICENO", nil),[objproductorder poId],[objproductorder updatedOn]]];
    
    [arrmessage appendString:@"<html><hr>\n</html>"]; // Line
    

    
    
    for (int i =0; i<[modproorder getProductOrderdetailcountbyproductorderId:poId]; i++) {
        TblProductOrderDtl *objproddtl=[modproorder getProductOrderdetailbyproductorderId:poId Offset:i];
  

        [arrmessage appendString:[NSString stringWithFormat:@"<html><table style=width:100%%><tr><td>%@</td></tr></table></html>",[Common getMerchantName]]];

        [arrmessage appendString:[NSString stringWithFormat:@"<html><table style=width:100%%><tr><td>%@ x %@</td><td align=right>%@</td></tr></table></html>",[objproddtl campaignName], [objproddtl campaignQty],[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objproddtl campaignTotal]]]];
    }
    [arrmessage appendString:@"<html><hr>\n</html>"]; // Line
    [arrmessage appendString:[NSString stringWithFormat:NSLocalizedString(@"TOTAL", nil),[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objproductorder poTotal]]]];
    
    // Footer
    [arrmessage appendString:@"<html><table style=width:100%% bgcolor=#ebebeb><tr><td align=center>&#169 Coupon</td></tr></table></html>"];
    
    //    NSLog(@"%@", arrmessage);
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:[NSString stringWithFormat:NSLocalizedString(@"INVOICENUMBER", nil),[objproductorder poId]]];
    [mc setMessageBody:[NSString stringWithFormat:@"<html>%@</html>",arrmessage] isHTML:YES];
    [mc setToRecipients:[NSArray arrayWithObject:[Common getCustomerEmailID]]];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            [self showAlert:NSLocalizedString(@"MAILCANCELLED", nil)];
            break;
        case MFMailComposeResultSaved:
            [self showAlert:NSLocalizedString(@"MAILSAVED", nil)];
            break;
        case MFMailComposeResultSent:
            [self showAlert:NSLocalizedString(@"MAILSENT", nil)];
            break;
        case MFMailComposeResultFailed:
            [self showAlert:[NSString stringWithFormat:NSLocalizedString(@"MAILSENTFAILURE", nil),[error localizedDescription]]];
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)showAlert:(NSString *)pmessgae {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:pmessgae
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


@end
