//
//  MassRedemViewController.m
//  ProWallet
//
//  Created by Inforios on 07/01/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "MassRedemViewController.h"
#import "CouponCell.h"
#import "UIImageView+WebCache.h"
#import "ScanCouponViewController.h"
#import "CouponModule.h"
#import "TblProduct.h"
#import "ProductModule.h"
#import "TblCampaignImage.h"
#import "TblMasscouponData.h"
#import "TblMasscouponDetailData.h"
#import "TblMassCouponModel.h"
#import "TblMassCouponDetailModel.h"
#import "MassRedeemModule.h"



@interface MassRedemViewController (){
    NSMutableArray *arrcouponList;
    UIImageView *bgView;
    NSString *repons;
    NSString *responseCouponId;
    CouponModule *modcoupon;
    NSMutableArray *arrcampaign;
    TblCouponData *objcoupon;
}

@end

@implementation MassRedemViewController
@synthesize Siteid,MerchantId;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrcampaign = [[NSMutableArray alloc]init];
    objcoupon=[[TblCouponData alloc]init];
    modcoupon=[[CouponModule alloc]init];
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    arrcampaign=[modcoupon getMyCouponBySite:Siteid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    for (UIView* view in bgView.subviews){
        [view removeFromSuperview];
    }
    
    if (arrcampaign.count > 0) {
        return arrcampaign.count;
    }
    else {
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-coupon.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"DIGITALCOUPONS", nil);
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        
        [bgView addSubview:messageLabel];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Redemcell";
    
    CouponCell *cell =(CouponCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TblProduct *objcampaign =[arrcampaign objectAtIndex:indexPath.row];
    NSMutableArray *productimg=[[NSMutableArray alloc]init];
    ProductModule *modprod=[[ProductModule alloc]init];
    productimg=[modprod getCampaignImg:[objcampaign campaignId]];
    
    if ([productimg count]>0) {
        TblCampaignImage *tblcamp=[productimg objectAtIndex:0];
        
        [cell.prodimg sd_setImageWithURL:[NSURL URLWithString:[tblcamp campaignImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
        
    }else{
        [cell.prodimg  setImage:[UIImage imageNamed:@"noimg.jpg"]];
    }
    
    [cell.lblcouponName setText:[objcampaign campaignName]];
    [cell.lblCouponCount setText:[objcampaign size]];
    cell.lblmerchantname.text= [objcampaign campaignDesc];

    [cell.stepperValue setMinimumValue:0];
    [cell.stepperValue setMaximumValue:[objcampaign.size integerValue]];
    [cell.stepperValue addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventValueChanged];
    cell.stepperValue.tag=indexPath.row;
    if(objcampaign.productQty)
    cell.lblcouponno.text = [NSString stringWithFormat:NSLocalizedString(@"qty",nil),[objcampaign productQty]];
    else
    cell.lblcouponno.text = [NSString stringWithFormat:NSLocalizedString(@"qty",nil),@"0"];
    
    
    return cell;
}
- (IBAction)stepperTapped:(UIStepper *)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    int val=(int)[sender value];
    TblProduct *objcampaign =[arrcampaign objectAtIndex:indexPath.row];
    objcampaign.productQty=[NSString stringWithFormat:@"%d",val];
    [self.tableView reloadData];
}
-(IBAction)btnBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)btnNext:(id)sender{
    
    NSMutableArray *tempmassdtl=[[NSMutableArray alloc]init];
    for(TblProduct *objproduct in arrcampaign){
        if([objproduct.productQty integerValue]>0){
            TblMassCouponDetailModel *objmassdtlmodel=[[TblMassCouponDetailModel alloc]init];
            TblMasscouponDetailData *objmassdtl=[[TblMasscouponDetailData alloc]init];
            [objmassdtl setQty:objproduct.productQty];
            [objmassdtl setCampaignId:objproduct.campaignId];
            [objmassdtlmodel setMasscoupondetail:objmassdtl];
            [tempmassdtl addObject:objmassdtlmodel];
        }
    }
    if(tempmassdtl.count==0){
        UIAlertController *alertController1 = [UIAlertController
                                               alertControllerWithTitle:@"Can't Redeem"
                                               message:@"Pls check all campaign count is zero"
                                               preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){}];
        [alertController1 addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController1 animated:YES completion:nil];
        });
    }else{
    TblMasscouponData *objmassdata=[[TblMasscouponData alloc]init];
    [objmassdata setSiteId:Siteid];
    [objmassdata setCustomerId:[Common getCustomerId]];
    
    TblMassCouponModel *objmasscouponmodel=[[TblMassCouponModel alloc]init];
    [objmasscouponmodel setMasscoupon:objmassdata];
    [objmasscouponmodel setMasscoupondtls:tempmassdtl];
    
    MassRedeemModule *modmass=[[MassRedeemModule alloc]init];
    MZCouponMassRedeemResponse *objmasscouponres = [modmass MassRedeemToServer:objmasscouponmodel];
        if(objmasscouponres.masscoupon){
            [objcoupon setDelflag:@"Mass Coupon"];
            [objcoupon setCouponId:objmasscouponres.masscoupon.referenceNo];
   
                [self performSegueWithIdentifier:@"showmasscan" sender:self];
        }
        else{
            
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Can't Redeem"
                                                  message:@"Error in server"
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
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showmasscan"]) {
        
;
      
        ScanCouponViewController *scan = segue.destinationViewController;
        scan.objcoupon=objcoupon;
        scan.flag = @"MassRedeem";
        scan.siteid = Siteid;
        scan.pparent = self;
    }
}
@end
