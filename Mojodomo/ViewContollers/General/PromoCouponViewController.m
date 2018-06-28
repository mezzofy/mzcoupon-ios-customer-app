//
//  CuoponsViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "PromoCouponViewController.h"
#import "UIImageView+WebCache.h"
#import "PromoCommonTableCell.h"
#import "Common.h"
#import "CustomerModule.h"
#import "Dbhelp.h"
#import "AppDelegate.h"

@interface PromoCouponViewController (){
    UIActivityIndicatorView *activeIndicator;
    UIView* actvityView;
}
@end

@implementation PromoCouponViewController
@synthesize parent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    activeIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    
//    actvityView = [Common getActivityViewer];
//    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class] withObject:actvityView];
//    
//    
//    modProduct = [[ProductModule alloc]init];
//    objproduct = [[TblProduct alloc]init];
//    modmerchant = [[MerchantModule alloc]init];
//    
    [self performSelectorOnMainThread:@selector(loader:) withObject:self waitUntilDone:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.tbl_promocoupon reloadData];
//    if(actvityView){
//        [Common hideActivityViewer:actvityView];
//        
//        [Common hideActivityViewer:activeIndicator];
//    }
//    
}
-(void)loader:(NSObject *)pself{

    
//    objproduct = [modProduct getProductsDetailByCode:[Common.PromoTag code]];
//    objmerchant= [modmerchant getMerchantDetail:[objproduct merchantId]];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"specialbgx.jpg"]]];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
//        if (indexPath.row == 0) {
//            PromoCommonTableCell* cells = [tableView dequeueReusableCellWithIdentifier:@"imgcell" forIndexPath:indexPath];
//            
//            if(objproduct != NULL){
//                NSMutableArray* prodimages = [modProduct getProductimagelist:[objproduct prodId]];
//                
//                if([prodimages count] >0){
//                    TblProductImage* prodimg = [prodimages objectAtIndex:0];
//                    [cells.imgCoupon  sd_setImageWithURL:[NSURL URLWithString:[prodimg productImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
//                }
//            }
//            cell = cells;
//            
//        }else if (indexPath.row == 1) {
//            PromoCommonTableCell* cellname = [tableView  dequeueReusableCellWithIdentifier:@"namecell" forIndexPath:indexPath];
//            
//            [cellname.lblMerchantName setText:[objmerchant merchantName]];
//            [cellname.lblCouponName setText:[objproduct productCode]];
//            cell = cellname;
//            
//        }else if (indexPath.row == 2) {
//            PromoCommonTableCell* celldesc = [tableView dequeueReusableCellWithIdentifier:@"desccell" forIndexPath:indexPath];
//            
//            [celldesc.lblCouponDetail setText:[objproduct productDesc]];
//            cell = celldesc;
//            
//        }
//    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth= screenRect.size.width;

//    if (indexPath.row==0) {
//        
//        return 400.0f;
//        
//    } else if (indexPath.row==1) {
//        
//        return 100;
//        
//    } else if (indexPath.row==2) {
//       
//        
//        NSString *trimmedString2 = [[objproduct productDesc] stringByTrimmingCharactersInSet:
//                                    [NSCharacterSet whitespaceCharacterSet]];
//        CGSize maximumLabelSize2 = CGSizeMake(screenWidth-40, 9999);
//        CGRect textRect = [trimmedString2 boundingRectWithSize:maximumLabelSize2
//                                                       options:NSStringDrawingUsesLineFragmentOrigin
//                                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
//                                                       context:nil];
//        return textRect.size.height+20;
//        
//    } else
        return 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCoupon_click:(id)sender {
//    CartModule *modcart = [[CartModule alloc]init];
//    NSNumber* _txnQty = [NSNumber numberWithInt:1];
//
//    
//    CustomerModule *daouser = [[CustomerModule alloc]init];
//    TblCustomer *tblcus =[daouser getCustmerList];
//    
//    DataReaponseModel* retval = [modcart getcartdetl:[objproduct prodId] qty:_txnQty];
//    if (!tblcus) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//    }else{
//        
//    if ([tblcus.customer_type isEqualToString:@"G"]) {
//       UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//        
//    }else if(retval==nil && ![tblcus.customer_type isEqualToString:@"G"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        //alert.tag=1;
//        [alert show];
//        
//    }else if([[retval response_code]isEqualToString:@"P0101"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        // alert.tag=1;
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0102"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Youalreadyparticipate",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0103"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Promocodewrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0104"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Prmotiondatemismatch",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0105"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0106"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Couponnotavailable",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }else if ([[retval response_code]isEqualToString:@"P0107"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"MerchantCodeWrong",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else{
//        [Common PromoAction:[objproduct.prodId stringValue]];
//    }
//    
//    if( [Common PromoAction] != NULL){
//        [self dismissViewControllerAnimated:FALSE completion:nil];
//    }
//    }
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (alertView.tag==1){
//        if (buttonIndex==1) {
//        //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"www.getso.today/today"]];
//        Dbhelp* db = [[Dbhelp alloc]init];
//        [db removeDB];
//        CustomerModule *modcus = [[CustomerModule alloc]init];
//        StaffModule *modusr = [[StaffModule alloc]init];
//        [modusr clearLoginUser];
//        [modcus clearLoginCustomer];
//        [Common autoLogin:Nil];
//        [Common typedesign:@"guest"];
//         [self performSegueWithIdentifier:@"gohomecoupon" sender:self];
//    }
//    }
//}

- (IBAction)btn_close:(id)sender {
//    [Common PromoAction:nil];
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

//-(UIView*)getActivityViewer{
//    UIView* activityview;
//    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    UIWindow *window = delegate.window;
//    activityview = [[UIView alloc] initWithFrame: CGRectMake(0, 0, window.bounds.size.width, window.bounds.size.height)];
//    return activityview;
//}
//-(void)showActivityViewer:(UIView*)activityView
//{
//    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    UIWindow *window = delegate.window;
//    activityView.backgroundColor = [UIColor blackColor];
//    activityView.alpha = 0.5;
//    
//    UIActivityIndicatorView *activityWheel = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(window.bounds.size.width / 2 - 12, window.bounds.size.height / 2 - 12, 24, 24)];
//    activityWheel.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//    activityWheel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
//                                      UIViewAutoresizingFlexibleRightMargin |
//                                      UIViewAutoresizingFlexibleTopMargin |
//                                      UIViewAutoresizingFlexibleBottomMargin);
//    [activityView addSubview:activityWheel];
//    [window addSubview: activityView];
//    
//    [[[activityView subviews] objectAtIndex:0] startAnimating];
//}

//-(void)hideActivityViewer:(UIView*)activityView
//{
//    [[[activityView subviews] objectAtIndex:0] stopAnimating];
//    [activityView removeFromSuperview];
//    activityView = nil;
//}



@end
