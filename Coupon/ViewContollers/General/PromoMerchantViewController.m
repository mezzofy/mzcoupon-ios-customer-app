//
//  LDmerchantViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "PromoMerchantViewController.h"
#import "Common.h"
#import "UIImageView+WebCache.h"
#import "ProductViewCell.h"
#import "CustomerModule.h"
#import "Dbhelp.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface PromoMerchantViewController (){
    NSArray* lstcoupons;
    NSMutableArray *merchant,*arrprod;
    NSNumber* totalcount;
    CLLocationManager *locationManager;
    double curlatitude;
    double curlongitude;
    NSNumber *latitude;
    NSNumber *longitude;
}

@end

@implementation PromoMerchantViewController
@synthesize parent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Location current
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    if(IS_OS_8_OR_LATER)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
    
    curlatitude=locationManager.location.coordinate.latitude;
    curlongitude=locationManager.location.coordinate.longitude;
    
    latitude=[NSNumber numberWithDouble:curlatitude];
    longitude=[NSNumber numberWithDouble:curlongitude];
    
    merchant = [[NSMutableArray alloc]init];
//     daoProduct = [[ProductModule alloc]init];
//    MerchantModule *modmerchant = [[MerchantModule alloc]init];
//    objmerchant = [modmerchant getMerchantDetailByCode:[Common.PromoTag code]];
//    if(objmerchant != NULL){
//        [self.imgMerchant  sd_setImageWithURL:[NSURL URLWithString:[objmerchant merchantLogo]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
//        [self.lblMerchantName setText:[objmerchant merchantName]];
//        
//        int offset=0;
//        int size=20;
//
//        // Dummy
//        NSArray *keysd = [NSArray arrayWithObjects:@"merchantId",nil];
//        NSArray *objectsd = [NSArray arrayWithObjects:@"0", nil];
//        NSDictionary* jsondic = [NSDictionary dictionaryWithObjects:objectsd forKeys:keysd];
//        [merchant addObject:jsondic];
//        
//        
//        NSArray *keys1 = [NSArray arrayWithObjects:@"merchantId",nil];
//        NSArray *objects1 = [NSArray arrayWithObjects:[objmerchant merchantId] ,nil];
//        
//        jsondic = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];
//        [merchant addObject:jsondic];
//        
//        
//        LoaderModule *modloader=[[LoaderModule alloc]init];
//        JsonProductList* objprod =  [modloader getFilteredProductListByMerchants:merchant Categories:NULL Locations:NULL Company:NULL Offset:[NSNumber numberWithInt:offset] Size:[NSNumber numberWithInt:size]];
//        if(objprod != NULL){
//            NSLog(@"%@",[objprod toDictionary]);
//            if ([[objprod totalCount]intValue]!=0){
//               // [modloader pageLoadProductListfilter:objprod.products];
//                [modloader pageLoadProductListfilter:objprod.placeproducts latitude:latitude longitude:longitude];
//                lstcoupons = objprod.products;
//                [self.tableviewCoupons reloadData];
//            }else{
//                    int poffset=0;
//                    int psize=1000;
//                    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
//                    NSString *str =[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v6/merchant_products/%@",[objmerchant merchantId]]];
//                    [reqparam setValue:[NSNumber numberWithInteger:poffset] forKey:@"offset"];
//                    [reqparam setValue:[NSNumber numberWithInteger:psize] forKey:@"size"];
//                    NSData *data = [Utils urlGetRequest:str param:reqparam];
//                    if(data)
//                    [self performSelector:@selector(fetchedPromoProduct:) withObject:data];
//                
//            }
//        }
    
//    }
    
}

- (void)fetchedPromoProduct:(NSData *)responseprod {
//    NSError* error;
//    NSDictionary* json = [NSJSONSerialization
//                          JSONObjectWithData:responseprod
//                          options:kNilOptions
//                          error:&error];
//    
//    
//    NSDictionary *arritemres = [json objectForKey:@"response"];
//    NSString* response_code = [arritemres valueForKey:@"response_code"];
//    
//    if ([response_code isEqualToString:@"0"]){
//        ProductModule *daoprod = [[ProductModule alloc]init];
//               NSMutableArray *arrlist=[json objectForKey:@"merchantproducts"];
//        for(int i=1;i<[arrlist count];i++){
//       NSDictionary *resprod = [arrlist objectAtIndex:i];
//            objproduct=[[TblProduct alloc]init];
//            
//            [objproduct setProdId:[resprod valueForKey:@"prodId"]];
//            [objproduct setProductCode:[resprod valueForKey:@"productCode"]];
//            [objproduct setMerchantId:[resprod valueForKey:@"merchantId"]];
//            [objproduct setProductName:[resprod valueForKey:@"productName"]];
//            [objproduct setProductDesc:[resprod valueForKey:@"productDesc"]];
//            [objproduct setCouponType:[resprod valueForKey:@"couponType"]];
//            [objproduct setCategoryId:[resprod valueForKey:@"categoryId"]];
//            [objproduct setSellingPrice:[resprod valueForKey:@"sellingPrice"]];
//            [objproduct setOriginalPrice:[resprod valueForKey:@"orginalPrice"]];
//            [objproduct setTermCondit:[resprod valueForKey:@"termCondit"]];
//            [objproduct setNote1:[resprod valueForKey:@"note1"]];
//            [objproduct setNote2:[resprod valueForKey:@"note2"]];
//            [objproduct setNote3:[resprod valueForKey:@"note3"]];
//            [objproduct setStatus:[resprod valueForKey:@"status"]];
//            [objproduct setProductUuid:[resprod valueForKey:@"productUuid"]];
//            [objproduct setPickup:[resprod valueForKey:@"pickup"]];
//            [objproduct setDelivery:[resprod valueForKey:@"delivery"]];
//            [objproduct setHashCode:[resprod valueForKey:@"hashCode"]];
//            [objproduct setOutCall:[resprod valueForKey:@"outCall"]];
//            [objproduct setBooking:[resprod valueForKey:@"booking"]];
//            [objproduct setReviewUrl:[resprod valueForKey:@"reviewUrl"]];
//            [objproduct setVideoUrl:[resprod valueForKey:@"videoUrl"]];
//            [objproduct setServiceType:[resprod valueForKey:@"serviceType"]];
//            
//            if ([resprod valueForKey:@"siteList"]) {
//                [objproduct setSiteList:[resprod valueForKey:@"siteList"]];
//            }
//            if ([resprod valueForKey:@"itemList"]) {
//                [objproduct setItemList:[resprod valueForKey:@"itemList"]];
//            }
//            if ([json valueForKey:@"timeList"]) {
//                [objproduct setTimeList:[json valueForKey:@"timeList"]];
//            }
//            if ([resprod valueForKey:@"groupList"]) {
//                [objproduct setGroupList:[resprod valueForKey:@"groupList"]];
//            }
//            if ([resprod valueForKey:@"prodImageList"]) {
//                [objproduct setProdImageList:[resprod valueForKey:@"prodImageList"]];
//            }
//            //}
//        
//        
//
//        //objproduct = [daoprod converJsonToObject:responseprod];
//       // NSLog(@"%@",objprod);
//        TblProduct *objres = [daoprod getProductsDetail:[objproduct prodId]];
//        
//        if(objres !=nil && ![objres.hashCode isEqualToString:[objproduct hashCode]]){
//
//            [daoprod updateProduct:objproduct];
//        } else {
//            if (objres == nil) {
//                [daoprod addProduct:objproduct];
//            }
//            
//        }
//    
//
//   
//    NSArray *arrImageList = [objproduct prodImageList];
//    
//    if ([arrImageList count] > 0) {
//        
//        [daoProduct deleteProductImages:[objproduct prodId]];
//        
//        int i;
//        for (i =1; i<[arrImageList count]; i++) {
//            
//            NSNumber *prodid = [[arrImageList objectAtIndex:(arrImageList.count - i)] valueForKey:@"prodId"];
//            NSString *productimage = [[arrImageList objectAtIndex:(arrImageList.count - i)] valueForKey:@"productImage"];
//            NSString *productimgname = [[arrImageList objectAtIndex:(arrImageList.count - i)] valueForKey:@"productImageName"];
//            
//            NSNumber *seqno = [[arrImageList objectAtIndex:(arrImageList.count - i)] valueForKey:@"sequenceNo"];
//            
//            TblProductImage *tblimage = [[TblProductImage alloc]init];
//            
//            [tblimage setProdId:prodid];
//            [tblimage setProductImage:productimage];
//            [tblimage setProductImageName:productimgname];
//            [tblimage setSequenceNo:seqno];
//            
//            TblProductImage *objres = [daoProduct getProductImg:[tblimage productImage]];
//            if (objres) {
//                [daoProduct updateProductImage:tblimage];
//            } else {
//                [daoProduct addProductImage:tblimage];
//                }
//            
//            }
//        
//        }
//    
//    }
//}
//    arrprod=[[NSMutableArray alloc]init];
//    arrprod=[daoProduct getPromoProductList:[objmerchant merchantId]];
//    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btn_close:(id)sender {
//    [Common PromoAction:nil];
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    
    return arrprod.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"promocoupon"];
//    if(cell == nil){
        cell=[[ProductViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"promocoupon"];
//    }
    
//    JsonProductId* objjson = [lstcoupons objectAtIndex:[indexPath row]+1];
    
   
    
//    TblProduct *tblprod = [arrprod objectAtIndex:[indexPath row]];
//    NSMutableArray* imglist = [daoProduct getProductimagelist:[tblprod prodId]];
//    
//    if ([imglist count]>0) {
//        TblProductImage *tblimg=[imglist objectAtIndex:0];
//        [cell.imgProduct sd_setImageWithURL:[NSURL URLWithString:[tblimg productImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//        
//    }else{
//        [cell.imgProduct  setImage:[UIImage imageNamed:@"noimg.jpg"]];
//    }
//    if (![[tblprod catgimage] isEqual:@""]) {
//        [cell.imgCatg sd_setImageWithURL:[NSURL URLWithString:[tblprod catgimage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//        
//    }else{
//        [cell.imgCatg  setImage:[UIImage imageNamed:@"Point Of Interest.png"]];
//    }
//    
//    cell.lblProductName.text = [tblprod productName];
//    cell.lblProductDesc.text = [tblprod productDesc];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    CartModule *modcart = [[CartModule alloc]init];
//    NSNumber* _txnQty = [NSNumber numberWithInt:1];
//    
//    CustomerModule *daouser = [[CustomerModule alloc]init];
//    TblCustomer *tblcus =[daouser getCustmerList];
//    
//    JsonProductId* objjson = [arrprod objectAtIndex:[indexPath row]];
//    ProductModule *daoProduct1 = [[ProductModule alloc]init];
//    TblProduct *objproduct1 = [daoProduct1 getProductsDetail:[objjson prodId]];
//
//    DataReaponseModel* retval = [modcart getcartdetl:[objproduct1 prodId] qty:_txnQty];
//    if (!tblcus) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//        alert.tag=1;
//        [alert show];
//    }else{
//        if ([tblcus.customer_type isEqualToString:@"G"]) {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Pleasesignuptocontinue",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL", nil) otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
//            alert.tag=1;
//            [alert show];
//            
//        }else if(retval==nil){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        alert.tag=1;
//        [alert show];
//        
//    }else if([[retval response_code]isEqualToString:@"P0101"]){
//        [Common PromoAction:nil];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"OutofStock", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        alert.tag=1;
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
//    }else{
//        [Common PromoAction:[objproduct1.prodId stringValue]];
//        
//    }
//
//    if( [Common PromoAction] != NULL){
//        [self dismissViewControllerAnimated:FALSE completion:nil];
//    }
//}
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (alertView.tag==1){
//        if (buttonIndex==1) {
//            //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"www.mezzofy.com.today/today"]];
//            Dbhelp* db = [[Dbhelp alloc]init];
//            [db removeDB];
//            CustomerModule *modcus = [[CustomerModule alloc]init];
//            StaffModule *modusr = [[StaffModule alloc]init];
//            [modusr clearLoginUser];
//            [modcus clearLoginCustomer];
//            [Common autoLogin:Nil];
//            [Common typedesign:@"guest"];
//            [self performSegueWithIdentifier:@"gohomecoupon" sender:self];
//        }
//    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}
@end
