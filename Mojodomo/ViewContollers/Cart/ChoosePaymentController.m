//
//  ChoosePaymentController.m
//  CouponWallet
//
//  Created by Inforios on 04/06/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "ChoosePaymentController.h"
#import "CartViewCell.h"
#import "Common.h"
#import "NetPaymentController.h"
#import "CupsViewController.h"
#import "UIImageView+WebCache.h"
#import "TransferViewController.h"
#import "PaymentConfirmView.h"
#import "NSString+MD5.h"
#import "PayPalViewController.h"
#import "PaymentModule.h"
#import "TblProductOrderModel.h"
#import "CouponPaymentModule.h"
#import "CartModule.h"


@interface ChoosePaymentController (){
    PaymentModule *modpayment;
    NSString *poID;
    NSString *PaymentDetailId;
    NSString *paytoken;
}
@end

@implementation ChoosePaymentController
@synthesize btncontinue,parenttopup,strtopmessage,strtopamount;



- (void)viewDidLoad {
    [super viewDidLoad];
    modpayment=[[PaymentModule alloc]init];
    [modpayment loadPaymentListfromserver:1];
    self.title = NSLocalizedString(@"PAYMENT", nil);

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
- (void)viewWillAppear:(BOOL)animated {
    
    btncontinue.enabled = FALSE;
    [super viewWillAppear:animated];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [modpayment getAvaliablePaymentMethodcount];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CartViewCell *cellgeneral= [tableView dequeueReusableCellWithIdentifier:@"cellpayment" forIndexPath:indexPath];
    TblPaymentDtl *objpayment=[modpayment getPaymentMethodDetailOffset:indexPath.row];
    
        cellgeneral.lblMerchtName.text=[objpayment paymentName];
        [cellgeneral.imgProduct sd_setImageWithURL:[NSURL URLWithString:[objpayment paymentLogourl]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];


    return cellgeneral;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if ([segue.identifier isEqualToString:@"shownet"]) {
//        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//        TblPayment *tblpaymt= [paymentlist objectAtIndex:indPath.row];
//        NetPaymentController *vc = segue.destinationViewController;
//        vc.tnamount =txnamout;
//        vc.strpaymtkey=[tblpaymt paymentKey];
//        vc.strMertId=[tblpaymt paymentMerchantId];
//    }
//    else if ([segue.identifier isEqualToString:@"showcup"]) {
//        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//        TblPayment *tblpaymt= [paymentlist objectAtIndex:indPath.row];
//        CupsViewController *vc = segue.destinationViewController;
//        vc.tnamount =txnamout;
//        vc.strpaymtkey=[tblpaymt paymentKey];
//        vc.strMertId=[tblpaymt paymentMerchantId];
//    }
//    
//    else if ([segue.identifier isEqualToString:@"confirmpay"]) {
//        
//        PaymentConfirmView *vc = segue.destinationViewController;
//        NSLog(@"%@:",txnstaffId);
//        if ([Common staffid] ==[NSNumber numberWithInt:[txnstaffId intValue]]) {
//            vc.txnCustomerName =objstaff.staffName;
//            vc.txnCustomerId =[objstaff.staffId stringValue];
//            vc.txnamount=txnamout;
//            vc.txnmobile=objstaff.mobile;
//            vc.txnRef =objstaff.email;
//        }else{
//            vc.txnCustomerName =txnCustomerName;
//            vc.txnCustomerId =txnstaffId;
//            vc.txnRef =txnRef;
//            vc.txnamount=txnamout;
//            vc.txnmobile=txnmobile;
//            //    vc.parentvc = self;
//        }
//        //vc.txnmsg=strmsg;
//        
//    }else
    if ([segue.identifier isEqualToString:@"showdetails"]) {
        if([parenttopup isEqualToString:@"TOPUP"]){
            PayPalViewController *vc = segue.destinationViewController;
            vc.poId=poID;
            vc.paymentDetailId=PaymentDetailId;
            vc.topamount=strtopamount;
            vc.topremarks=strtopmessage;
            vc.parentvc=parenttopup;
            vc.paytoken=paytoken;
        }else{
        PayPalViewController *vc = segue.destinationViewController;
        vc.poId=poID;
        vc.paymentDetailId=PaymentDetailId;
        }
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    btncontinue.enabled = TRUE;
}

- (IBAction)btnback_Touch:(id)sender{
    [self.navigationController popViewControllerAnimated:false];
    
}

- (IBAction)btnProceed_Touch:(id)sender{
    NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
    TblPaymentDtl *objpayment=[modpayment getPaymentMethodDetailOffset:indPath.row];

     if ([[objpayment paymentType] isEqualToString:@"Paypal"]) {
         PaymentDetailId=[objpayment paymentDetailId];
         [self paymentTypePaypal];        
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *tfooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
    tfooterView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(tableView.frame.size.width/2-120, 0, 240, 50)];
    label3.backgroundColor = [UIColor clearColor];
    label3.font = [UIFont systemFontOfSize:12];
    label3.numberOfLines = 2;
    label3.textAlignment = NSTextAlignmentCenter;
    label3.text = NSLocalizedString(@"NOCARD", nil);
    label3.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
  
    [tfooterView addSubview:label3];

    tableView.tableFooterView = tfooterView;
    
    return tfooterView;
}




-(void)paymentTypePaypal{
    CartModule *modcart=[[CartModule alloc]init];
    NSString* transno = [[NSUUID UUID] UUIDString];
    CouponPaymentModule *modcoup=[[CouponPaymentModule alloc]init];
    if([parenttopup isEqualToString:@"TOPUP"]){
        ProductOrderData *tblprod=[[ProductOrderData alloc]init];
        [tblprod setCustomerId:[Common getCustomerId]];
        [tblprod setPoNo:transno];
        [tblprod setPoStatus:@"A"];
        [tblprod setPayResponse:@"0"];
        [tblprod setCouponType:@"T"];
        [tblprod setPoTotal:strtopamount];
        ProductOrderListDataModel *objprodOdrList=[[ProductOrderListDataModel alloc]init];
        [objprodOdrList setPo:tblprod];
        ProductOrderData *retval =[modcoup downloadChargeCouponFromServer:objprodOdrList];
        if(retval.poId.length>0 ){
            poID=[retval poId];
            if(retval.payToken.length>0)
                paytoken=[retval payToken];
            else
                paytoken=@"0";
            [self performSegueWithIdentifier:@"showdetails" sender:self];
        }
    }else{
    ProductOrderData *tblprod=[[ProductOrderData alloc]init];
    [tblprod setCustomerId:[Common getCustomerId]];
    [tblprod setPoNo:transno];
    [tblprod setPoStatus:@"A"];
    [tblprod setPayResponse:@"0"];
    [tblprod setCouponType:@"C"];
    
    NSMutableArray *arrmod=[[NSMutableArray alloc]init];
    for(int i=0;i<[modcart getCartItemsCount];i++){
        TblProduct *objcart=[modcart getCartdetailsFromTabels:i];
        
        ProductOrderDtlData *tblproddtl=[[ProductOrderDtlData alloc]init];
        [tblproddtl setCampaignId:[objcart campaignId]];
        [tblproddtl setCampaignQty:[NSString stringWithFormat:@"%@",objcart.productQty]];
        
        ProductOrderDataModel *tblproOdrmd=[[ProductOrderDataModel alloc]init];
        [tblproOdrmd setPodetail:tblproddtl];
        [arrmod addObject:tblproOdrmd];
    }

        ProductOrderListDataModel *objprodOdrList=[[ProductOrderListDataModel alloc]init];
        [objprodOdrList setPo:tblprod];
        [objprodOdrList setPodetails:arrmod];
    
        ProductOrderData *retval =[modcoup downloadChargeCouponFromServer:objprodOdrList];
    if(retval.poId.length>0 ){
        poID=[retval poId];
        [self performSegueWithIdentifier:@"showdetails" sender:self];
    }
    }
}
@end
