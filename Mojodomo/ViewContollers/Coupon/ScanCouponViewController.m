//
//  ScanCouponViewController.m
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "ScanCouponViewController.h"
#import "Barcode.h"
#import "PinViewController.h"
#import "RedemptionSuccess.h"
#import "CouponModule.h"
#import "TblCouponData.h"
#import "MassRedeemModule.h"
#import "TblMassCouponModel.h"
#import <MZCoupon/MZCoupon.h>

@interface ScanCouponViewController (){
    NSTimer *waittimer;
}

@end

@implementation ScanCouponViewController
@synthesize imageQr,lblcoupname,lblcoupNo,flag;
@synthesize imgBrandName,objcoupon,siteid;

- (void)viewDidLoad {
    [super viewDidLoad];
    Barcode *barcode = [[Barcode alloc] init];
    
    if([flag isEqualToString:@"Customer"]){
        [barcode setupQRCode:[Common getCustomerId]];
        imageQr.image = barcode.qRBarcode;
        lblcoupname.text=[Common getCustomerUsername];
        lblcoupNo.text=[Common getCustomerEmailID];
    }else{
    
    if ([objcoupon couponId] == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ERROR", nil)
                                                        message:NSLocalizedString(@"EMPTYCOUPONID", nil)
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
         [barcode setupQRCode:[objcoupon couponId]];
         imageQr.image = barcode.qRBarcode;
    }
    if ([[objcoupon delflag] isEqualToString: @"Mass Coupon"]) {
        lblcoupname.text=NSLocalizedString(@"MassCoupon", nil);
    }else
        lblcoupname.text=[objcoupon couponName];
    
        lblcoupNo.text=[objcoupon couponId];

    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    NSString *outputDateString = [formatter stringFromDate:[NSDate date]];
    [self.lbldate setText:outputDateString];
    
//    ProductModule *daoProduct = [[ProductModule alloc]init];
//    tblProd = [daoProduct getProductsDetail:[pcoupon prodId]];
////    if ([[tblProd brandName] isEqualToString:@"TR"]) {
////        imgBrandName.image = [UIImage imageNamed:@"TR.png"];
////        
////    } else {
////        imgBrandName.image = [UIImage imageNamed:@"TX.png"];
////    
////    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    waittimer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(checkCouponStatus:) userInfo:nil repeats:YES];
    
}

-(void)checkCouponStatus:(NSTimer *)timer{
    if([[objcoupon delflag] isEqualToString: @"Mass Coupon"]){
        MassRedeemModule *modmass=[[MassRedeemModule alloc]init];
        MZCouponMassRedeemResponse *objmassredeem=[modmass getMassRedeemStatusFromServer:objcoupon.couponId SiteId:siteid];
        if([objmassredeem.masscoupon.massStatus isEqualToString:@"R"]){
            [waittimer invalidate];
            [self performSegueWithIdentifier:@"scanredeemdone" sender:self];
        }

    }else{
        CouponModule *modcoupon=[[CouponModule alloc]init];
        TblCouponData *objcoupondata=[modcoupon getCouponDetailsFromServer:objcoupon.couponId];
        if([objcoupondata.couponStatus isEqualToString:@"R"]){
            [waittimer invalidate];
            [self performSegueWithIdentifier:@"scanredeemdone" sender:self];
        }
    }
}
//- (void)redeemSuccessful {
//    
//    NSMutableDictionary* pparam = [[NSMutableDictionary alloc]init];
//    [pparam  setValue:[pcoupon couponId] forKey:@"couponId"];
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v6/redeem_stock/%@",[pcoupon prodId]] param:pparam];
//    if (data) {
//        NSError *error;
//        NSDictionary* resdict = [NSJSONSerialization
//                                 JSONObjectWithData:data options:kNilOptions error:&error];
//        if ([resdict objectForKey:@"response"]) {
//            NSDictionary *arritemres = [resdict objectForKey:@"response"];
//            NSString* response_code = [arritemres valueForKey:@"response_code"];
//            
//            if ([response_code isEqualToString:@"0"]){
//             //   NSDictionary *resdic=[resdict objectForKey:@"stock"];
//        //if ([resdic valueForKey:@"stockQty"] && [[resdic valueForKey:@"stockQty"] intValue] >= 0) {
//            
//        }
//    }
//    
//}
//}

- (void)viewWillDisappear:(BOOL)animated {
    [waittimer invalidate];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"redeemscan"]) {
        PinViewController *pinvc = segue.destinationViewController;
        pinvc.objcoupon=objcoupon;
        pinvc.siteid=siteid;
        pinvc.pparent = self.pparent;
        
    }else if ([segue.identifier isEqualToString:@"scanredeemdone"]) {
        RedemptionSuccess *success = segue.destinationViewController;
        success.strType =self.strType;
        success.flag=self.flag;
        success.pparent = self.pparent;
    }
}
- (IBAction)btnreedem_Touch:(id)sender{

     [self performSegueWithIdentifier:@"redeemscan" sender:self];
}
@end
