//
//  MessageViewController.m
//  ProWallet
//
//  Created by Kris on 11/2/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "MessageViewController.h"
#import "Common.h"
#import "CustomerModule.h"
#import "Dbhelp.h"


@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if([Common.PromoTag.type isEqualToString:@"C"] || [Common.PromoTag.type isEqualToString:@"M"]){
//        [self processCoupon];
//    }else     if([Common.PromoTag.type isEqualToString:@"L"]){
//        [self joinLuckyDraw];
//    }else     if([Common.PromoTag.type isEqualToString:@"I"]){
//        [self joinInstantDraw];
//    }
//    else{
//        [self.lblMessage setText:[Common PromoAction]];
//    }
//    [Common PromoAction:NULL];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnclose_click:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)processCoupon{
    NSNumber* _txnQty = [NSNumber numberWithInt:1];
    
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    TblProduct *objproduct = [daoProduct getProductsDetail:[NSNumber numberWithInt:[Common.PromoAction intValue]]];
//    CustomerModule *daouser = [[CustomerModule alloc]init];
//    TblCustomer *tblcus =[daouser getCustmerList];
//    if (!tblcus) {
//       UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//    }else{
//    if ([tblcus.customer_type isEqualToString:@"G"]) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//        
//    }else if ([[objproduct couponType]isEqualToString:@"F"] && ![tblcus.customer_type isEqualToString:@"G"]) {
//        CartModule *daoCart = [[CartModule alloc]init];
//        [objproduct setProductQty:_txnQty];
//        [objproduct setTotalPrice:[daoCart getCartItemTotal:objproduct Qty:_txnQty]];
//        [objproduct setStatus:@"F"];
//        BOOL retval = [daoCart addCart:objproduct StaffId:[Common staffid]];
//        [daoCart sendCartToServer];
//        if (retval){
//            [self.lblMessage setText:NSLocalizedString(@"DOWNLOADEDCOUPONMSG", nil)];
//        }
//        
//    }
//    else if ([[objproduct couponType]isEqualToString:@"C"] && ![tblcus.customer_type isEqualToString:@"G"]){
//        CartModule *daoCart = [[CartModule alloc]init];
//        [objproduct setProductQty:_txnQty];
//        [objproduct setTotalPrice:[daoCart getCartItemTotal:objproduct Qty:_txnQty]];
//        [objproduct setStatus:@"A"];
//        BOOL retval = [daoCart addCart:objproduct StaffId:[Common staffid]];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"dispcartinfo" object:@"display"];
//        
//        if (retval) {
//            [self.lblMessage setText:NSLocalizedString(@"ADDEDTOCARTMSG", nil)];
//        }
//    }
//    }
}

-(void)joinLuckyDraw{
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataLuckyDrawResponse *drawresult = [modpromo joinLuckyDraw:[Common.PromoTag promoid] Member:[Common.currentUser customer_email]];
//    
//    if(drawresult == NULL) return;
//    CustomerModule *daouser = [[CustomerModule alloc]init];
//    TblCustomer *tblcus =[daouser getCustmerList];
//    
//    if (!tblcus) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//    }else{
//        
//        if ([tblcus.customer_type isEqualToString:@"G"]) {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//            alert.tag=1;
//            [alert show];
//            
//    }else if(drawresult==nil && ![tblcus.customer_type isEqualToString:@"G"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        // alert.tag=1;
//        [alert show];
//        
//    }else if([drawresult.response.response_code isEqualToString:@"P0101"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            //alert.tag=1;
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0102"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Youalreadyparticipate",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0103"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Promocodewrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0104"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Prmotiondatemismatch",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0105"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0106"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponnotavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//        }else if ([drawresult.response.response_code isEqualToString:@"P0107"]){
//            [Common PromoAction:nil];
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"MerchantCodeWrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//            [alert show];
//
//    }else{
//        [self.lblMessage setText:[NSString stringWithFormat:@"Submited for Lucky Draw. Registered No: %@",[drawresult.result sno]]];
//    }
//}

}


- (void)joinInstantDraw {
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataInstantDrawResponse *drawresult = [modpromo joinInstantDraw:[Common.PromoTag promoid] Member:[Common.currentUser customer_email]];
//    
//    if(drawresult == NULL) return;
//    CustomerModule *daouser = [[CustomerModule alloc]init];
//    TblCustomer *tblcus =[daouser getCustmerList];
//
//    if (!tblcus) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//    }else{
//        
//        if ([tblcus.customer_type isEqualToString:@"G"]) {
//           UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//            alert.tag=1;
//            [alert show];
//            
//
//        }else if(drawresult==nil && ![tblcus.customer_type isEqualToString:@"G"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        // alert.tag=1;
//        [alert show];
//        
//    }else if([drawresult.response.response_code isEqualToString:@"P0101"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//       // alert.tag=1;
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0102"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Youalreadyparticipate",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0103"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Promocodewrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0104"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Prmotiondatemismatch",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0105"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0106"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponnotavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([drawresult.response.response_code isEqualToString:@"P0107"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"MerchantCodeWrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//
//    }else{
//        [self.lblMessage setText:[NSString stringWithFormat:@"Submited for Instant Draw. Details: %@",[drawresult result]]];
//    }
//    }
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (alertView.tag==1){
//        if (buttonIndex==1) {
//            //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"www.mojo-domo.com/today"]];
//        Dbhelp* db = [[Dbhelp alloc]init];
//        [db removeDB];
//        CustomerModule *modcus = [[CustomerModule alloc]init];
//        StaffModule *modusr = [[StaffModule alloc]init];
//        [modusr clearLoginUser];
//        [modcus clearLoginCustomer];
//        [Common autoLogin:Nil];
//        [Common typedesign:@"guest"];
//        [self performSegueWithIdentifier:@"gohomeinstant" sender:self];
//        }
//    }else{
//            [self dismissViewControllerAnimated:YES completion:NULL];
//    }
//}
@end
