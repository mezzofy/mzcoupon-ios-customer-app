//
//  HomeProductViewController.m
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "HomeProductViewController.h"
#import <EstimoteSDK/ESTRequestBeaconDetails.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <AudioToolbox/AudioToolbox.h>

#import "Common.h"
#import "Utils.h"
#import "UIImageView+WebCache.h"
#import "Dbhelp.h"
#import "PromoCouponViewController.h"
#import "PromoMerchantViewController.h"
#import "LuckyDrawViewController.h"
#import "InstantDrawViewController.h"
#import "ProductViewCell.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OS_9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.1)
@interface HomeProductViewController ()
{
    SystemSoundID 	scanSuccessSound;
    ZBarReaderViewController *reader;
    NSString *strcoupon;
    UIAlertView *mapAlert;
    CBCentralManager *_centralManager;
    NSString* fbaccesstoken;
    NSString *strPswd;
    NSString *emailId;
    NSString *firstname;
    CLLocationManager *manager;
    CLLocationCoordinate2D locatios;
}
@end

@implementation HomeProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    //Replace the methods below with your required method name.
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    [manager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (central.state == CBCentralManagerStatePoweredOn) {
        return;
    } else if(central.state == CBCentralManagerStatePoweredOff) {
        NSLog(@"Alert to Turn ON Bluetooth");
        return;
        
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        NSLog(@"Shake Trigger");
        if (![CLLocationManager locationServicesEnabled]) {
            
            UIAlertView *errorAlert = [[UIAlertView alloc]
                                       initWithTitle:nil message:@"Turn On Location Services to Allow Coupon to connect Accessories" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
            errorAlert.tag=2;
            [errorAlert show];
        }
        _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        [self startProximity];
    }
}

- (void)startProximity {
    
    [self.activityIndicator startAnimating];
    
    self.nearestBeaconManager = [[NearestBeaconManager alloc] initWithBeaconRegions];
    self.nearestBeaconManager.delegate = self;
    [self.nearestBeaconManager startNearestBeaconUpdates];
    
}

- (void)locationManager:(CLLocationManager *)Manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    if (![CLLocationManager locationServicesEnabled]) {
        
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle:nil message:@"Turn On Location Services to Allow Coupon to connect Accessories" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        errorAlert.tag=2;
        [errorAlert show];
    }else
        [manager stopUpdatingLocation];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==2){
        if (buttonIndex==0) {
            if (@available(iOS 9, *)) {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }else
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
        }
    }else{
        if (alertView.tag==1){
            if (buttonIndex==1) {
                if (@available(iOS 9, *)) {
                    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }else{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General&path=Bluetooth"]];
                }
            }
        }
        
        
    }
}
-(void)checkStatus:(CLLocation *)currentLocation
{
    if(currentLocation != Nil){
        
        [manager stopUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        //locatios.latitude=-8.742612;
        //locatios.longitude=115.166726;
        locatios.latitude = currentLocation.coordinate.latitude;
        locatios.longitude = currentLocation.coordinate.longitude;
        [self checkStatus:currentLocation];
        // [self loadmap];
        //[self zoomToFitMapAnnotations];
        
    }
}
//}




- (IBAction)btncode_Touch:(id)sender {
    [self performSegueWithIdentifier:@"manualcode" sender:self];
}

- (IBAction)btnscan_Touch:(id)sender {
    [self callScanner];
}

- (IBAction)btnWhatsnew_Touch:(id)sender {
    [self performSegueWithIdentifier:@"showevent" sender:self];
    
}

- (IBAction)show:(id)sender {
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag *promotag = [modpromo getPromoStringForCode:self.text_entercode.text];
    //    [self navigatePage:promotag];
}

- (void)viewWillAppear:(BOOL)animated {
    
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    [self.navigationController setNavigationBarHidden:YES];
    // [self detectBluetooth];
    
    //    UIViewController* vc = [self parentViewController];
    //    if([vc isKindOfClass:UITabBarController.class] && [Common PromoAction] != NULL){
    //        [self performSegueWithIdentifier:@"showlogin" sender:self];
    //    }else if([Common PromoAction] != NULL){
    //        [self.navigationController setNavigationBarHidden:YES animated:FALSE];
    //        [self performSegueWithIdentifier:@"showlogin" sender:self];
    //    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController* vc = [self parentViewController];
    
    if([segue.identifier isEqualToString:@"showcoupons"]){
        PromoCouponViewController* vc = segue.destinationViewController;
        vc.parent = self;
    }else     if([segue.identifier isEqualToString:@"showmerchant"]){
        PromoMerchantViewController* vc = segue.destinationViewController;
        vc.parent = self;
    }else     if([segue.identifier isEqualToString:@"showluckydraw"]){
        LuckyDrawViewController* vc = segue.destinationViewController;
        vc.parent = self;
    }else     if([segue.identifier isEqualToString:@"showinstantdraw"]){
        InstantDrawViewController* vc = segue.destinationViewController;
        vc.parent = self;
        //    }else     if([segue.identifier isEqualToString:@"showlogin"] && [vc isKindOfClass:UITabBarController.class] && [Common PromoAction] != NULL){
    }
    
}

//- (void)navigatePage:(DataPromoTag *)promotag {
//    if(promotag != NULL && promotag.promoid != NULL && [promotag.promoid isEqualToString:@""] == FALSE){
//        PromotionModule* modpromo = [[PromotionModule alloc]init];
//        [modpromo addPromoToHistory:promotag];
//        [self.tableviewPromo reloadData];
//
//        [Common setPromoTag:promotag];
//        if([promotag.type isEqualToString:@"C"])
//            //            if (couponAvailable) {
//            //                <#statements#>
//            //            }
//            [self performSegueWithIdentifier:@"showcoupons" sender:self];
//        else if([promotag.type isEqualToString:@"M"])
//            [self performSegueWithIdentifier:@"showmerchant" sender:self];
//        else if([promotag.type isEqualToString:@"L"])
//            [self performSegueWithIdentifier:@"showluckydraw" sender:self];
//        else if([promotag.type isEqualToString:@"I"])
//            [self performSegueWithIdentifier:@"showinstantdraw" sender:self];
//    }else{
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"PROMOCODE", nil) message:NSLocalizedString(@"PROMOCODENOTFOUND", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }

//}

-(void)gotoSelectedType:(NSString*)pcode{
    
    //
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag *promotag = [modpromo getPromoCode:pcode];
    //
    //    NSString* newcode = [pcode stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    //    NSError* error;
    //    NSData *dataList =[newcode dataUsingEncoding:NSUTF8StringEncoding];
    //    NSDictionary* jsontag = [NSJSONSerialization
    //                             JSONObjectWithData:dataList //1
    //                             options:kNilOptions
    //                             error:&error];
    //
    //    DataPromoTag* promotag1=[[DataPromoTag alloc]initWithDictionary:jsontag];
    //    if(promotag1 != NULL)
    //        [self navigatePage:promotag1];
}

-(void)gotoBeacon:(NSString*)pcode{
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag *promotag = [modpromo getPromoCode:pcode];
    //    if(promotag != NULL)
    //        [self navigatePage:promotag];
}


- (void)nearestBeaconManager:(NearestBeaconManager *)nearestBeaconManager didUpdateNearestBeaconID:(NSArray *)beacons {
    if (beacons) {
        [self.activityIndicator stopAnimating];
        [self.activityIndicator removeFromSuperview];
        
        // TblBeaconList *objbeacon=[[TblBeaconList alloc]init];
        NSMutableArray *device=[[NSMutableArray alloc]init];
        
        NSDictionary *dict;
        for(int i=0;i<beacons.count;i++){
            CLBeacon *nearestBeacon =[beacons objectAtIndex:i];
            NSString *str=[NSString stringWithFormat:@"%@",[nearestBeacon beaconID]] ;
            
            NSDictionary *dicdevice = [self builddevice:str];
            [device addObject:dicdevice];
            dict= @{@"devices": device};
            
        }
        
        NSString* pstrurl=[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v6/promotion_devices/"]];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
//        NSData *data =[Utils urlPostRequest:pstrurl body:jsonData];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:pstrurl]];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPMethod:@"POST"];
//        [request setHTTPBody:data];
        
//        NSString *requestReply = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
//        NSData* data1 = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UInt32 flag = 0;
        float aBufferLength = 1.0; // In seconds
        NSURL *soundFileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                      pathForResource:@"beep" ofType:@"wav"] isDirectory:NO];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundFileURL, &scanSuccessSound);
        OSStatus error1 = AudioServicesSetProperty(kAudioServicesPropertyIsUISound,
                                                   sizeof(UInt32), &scanSuccessSound, sizeof(UInt32), &flag);
        error1 = AudioSessionSetProperty(kAudioSessionProperty_PreferredHardwareIOBufferDuration,
                                         sizeof(aBufferLength), &aBufferLength);
        AudioServicesPlayAlertSound(scanSuccessSound);
//        if (requestReply != nil && data1 != NULL) {
//            [self performSelectorOnMainThread:@selector(fetchedDetl:) withObject:data1 waitUntilDone:YES];
//        } else {
//            NSLog(@"No beacons in range.");
//        }
    }
}
- (void)fetchedDetl:(NSData *)response {
    
    NSError *error;
    
    if(response == NULL)
        return;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    
    //    DataPromoCode* promocode=[[DataPromoCode alloc]initWithDictionary:json];
    //    if(promocode == NULL || [promocode.response.response_code isEqualToString:@"0"] == FALSE)
    //        return;
    //
    //    NSString* newcode = [[promocode.promotion promotion_tag] stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    //
    //    NSData *dataList =[newcode dataUsingEncoding:NSUTF8StringEncoding];
    //    NSDictionary* jsontag = [NSJSONSerialization
    //                             JSONObjectWithData:dataList //1
    //                             options:kNilOptions
    //                             error:&error];
    //
    //    DataPromoTag* promotag=[[DataPromoTag alloc]initWithDictionary:jsontag];
    //
    //    if(promotag != NULL)
    //        [self navigatePage:promotag];
    
}

//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
// NSString *str=[NSString stringWithFormat:@"%@",beaconID];
//[self gotoBeacon:str];


//        ESTRequestBeaconDetails *beaconDetailsRequest = [[ESTRequestBeaconDetails alloc] initWithProximityUUID:beaconID.proximityUUID major:beaconID.major minor:beaconID.minor];
//
//        [beaconDetailsRequest sendRequestWithCompletion:^(ESTBeaconVO *beaconVO, NSError *error) {
//            if (!error) {
//                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//                [self gotoBeacon:beaconVO.name];
//            } else {
//                NSLog(@"Couldn't fetch data from Estimote Cloud for beacon %@, will use default values instead. Double-check if the app ID and app token provided in the AppDelegate are correct, and if the beacon with such ID is assigned to your Estimote Account. The error was: %@", beaconID, error);
//            }
//        }];



- (NSDictionary *)builddevice:(NSString *)device {
    NSDictionary *jsondic;
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    NSArray *keys1 = [NSArray arrayWithObjects:@"deviceToken",nil];
    NSArray *objects1 = [NSArray arrayWithObjects:device,nil];
    
    jsondic = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];
    [array addObject:jsondic];
    
    return jsondic;
}


//-(void)bluetoothStatusChanged:(BOOL)OnOff{
//    if(OnOff)
//        NSLog(@"Bluetooth On");
//    else{
//
//        mapAlert = [[UIAlertView alloc]
//                                 initWithTitle:NSLocalizedString(@"TurnOnBluetoothtoDragCoupon",nil)
//                                 message:NSLocalizedString(@"TabSettingstoturnBluetoothOn",nil)
//                                 delegate:self
//                                 cancelButtonTitle:NSLocalizedString(@"CANCEL",nil)
//                                 otherButtonTitles:NSLocalizedString(@"Settings",nil), nil];
//
//        mapAlert.tag=1;
//        [mapAlert show];
//
//        NSLog(@"Bluetooth Off");
//    }
//}
//}
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    
    for(symbol in results)
        break;
    
    if ([symbol.data isEqualToString:@""]) {
        NSLog(@"No data");
    }
    else {
        AudioServicesPlayAlertSound(scanSuccessSound);
        NSLog(@"%@", symbol.data);
        strcoupon = symbol.data;
        [self gotoSelectedType:strcoupon];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)cameraBtn:(id)sender {
    
    if (reader.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        reader.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else {
        reader.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
    }
}

- (IBAction)cancelBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)callScanner {
    
    // Load up the beep sound
    UInt32 flag = 0;
    float aBufferLength = 1.0; // In seconds
    NSURL *soundFileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                  pathForResource:@"beep" ofType:@"wav"] isDirectory:NO];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundFileURL, &scanSuccessSound);
    OSStatus error = AudioServicesSetProperty(kAudioServicesPropertyIsUISound,
                                              sizeof(UInt32), &scanSuccessSound, sizeof(UInt32), &flag);
    error = AudioSessionSetProperty(kAudioSessionProperty_PreferredHardwareIOBufferDuration,
                                    sizeof(aBufferLength), &aBufferLength);
    
    if(reader)
    {
        [reader.readerView stop];
        for(UIView *subViews in reader.view.subviews)
            [subViews removeFromSuperview];
        [reader.view removeFromSuperview];
        reader.view = nil;
    }
    reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // Enable EAN 13
    [scanner setSymbology: ZBAR_EAN13
                   config: ZBAR_CFG_ENABLE
                       to: 1];
    // Enable UPC-A
    [scanner setSymbology: ZBAR_UPCA
                   config: ZBAR_CFG_ENABLE
                       to: 1];
    
    // Enable UPC-E
    [scanner setSymbology: ZBAR_UPCE
                   config: ZBAR_CFG_ENABLE
                       to: 1];
    // Enable Code 128
    [scanner setSymbology: ZBAR_CODE128
                   config: ZBAR_CFG_ENABLE
                       to: 1];
    
    // UIButton *infoButton = [[[[[reader.view.subviews objectAtIndex:2] subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    //infoButton.hidden = YES;
    // UIButton *infoButton1 = [[[[[reader.view.subviews objectAtIndex:2] subviews] objectAtIndex:0] subviews] objectAtIndex:2];
    // infoButton1.hidden = YES;
    
    
    // Set Button for Toolbar
    //        UIBarButtonItem *barLeft = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBtn:)];
    //        barLeft.tintColor = [UIColor orangeColor];
    
    UIBarButtonItem *barcenter = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *barRight = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"switch_camera.png"] style:UIBarButtonItemStylePlain target:self action:@selector(cameraBtn:)];
    barRight.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *barLeft1 = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtn:)];
    barLeft1.tintColor = [UIColor whiteColor];
    // Set Toolbar
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 50)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    toolbar.tintColor = [UIColor blackColor];
    toolbar.alpha = 0.7;
    toolbar.items = [NSArray arrayWithObjects:barLeft1,barcenter,barRight, nil];
    reader.cameraOverlayView = toolbar;
    reader.showsCameraControls=NO;
    reader.showsZBarControls=NO;
    reader.view.frame = self.view.bounds;
    [self.navigationController pushViewController:reader animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowCount = 0;
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    rowCount = [modpromo getPromoCount];
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag* objtag = [modpromo getPromoAt:[indexPath row]];
    //
    ProductViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"promocoupon"];
    //    if(cell == nil){
    cell=[[ProductViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"promocoupon"];
    //    }
    
    //    if([objtag.type isEqualToString:@"C"]){
    //        ProductModule *modProduct = [[ProductModule alloc]init];
    //        TblProduct* objproduct = [modProduct getProductsDetailByCode:[objtag code]];
    //        [cell.lblBrandName setText:@"Coupon Promotion"];
    //        [cell.lblProductName setText:[objproduct productName]];
    //        [cell.lblProductDesc setText:[objproduct productDesc]];
    //        NSMutableArray* prodimages = [modProduct getProductimagelist:[objproduct prodId]];
    //        if([prodimages count] >0){
    //            TblProductImage* prodimg = [prodimages objectAtIndex:0];
    //            [cell.imgProduct  sd_setImageWithURL:[NSURL URLWithString:[prodimg productImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
    //        }
    //
    //    }else if([objtag.type isEqualToString:@"M"]){
    //        MerchantModule *modmerchant = [[MerchantModule alloc]init];
    //        TblMerchant* objmerchant = [modmerchant getMerchantDetailByCode:[objtag code]];
    //
    //        [cell.lblBrandName setText:@"Merchant Promotion"];
    //        [cell.imgProduct  sd_setImageWithURL:[NSURL URLWithString:[objmerchant merchantLogo]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
    //        [cell.lblProductName setText:[objmerchant merchantName]];
    //        [cell.lblProductDesc setText:[objmerchant merchantDesc]];
    //
    //    }else if([objtag.type isEqualToString:@"I"]){
    //        PromotionModule* modpromo = [[PromotionModule alloc]init];
    //        DataDrawDetailResponse *res = [modpromo getInstantDrawDetails:[objtag code]];
    //        if(res != NULL){
    //            [cell.lblBrandName setText:@"Instant Draw Promotion"];
    //            [cell.lblProductName setText:[res.result name]];
    //            [cell.lblProductDesc setText:[res.result description]];
    //            [cell.imgProduct  sd_setImageWithURL:[NSURL URLWithString:[res.result imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
    //        }
    //
    //    }else if([objtag.type isEqualToString:@"L"]){
    //
    //        PromotionModule* modpromo = [[PromotionModule alloc]init];
    //        DataDrawDetailResponse *res = [modpromo getLuckyDrawDetails:[objtag code]];
    //        if(res != NULL){
    //            [cell.lblBrandName setText:@"Lucky Draw Promotion"];
    //            [cell.lblProductName setText:[res.result name]];
    //            [cell.lblProductDesc setText:[res.result description]];
    //            [cell.imgProduct  sd_setImageWithURL:[NSURL URLWithString:[res.result imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
    //        }
    //
    //    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag* objtag = [modpromo getPromoAt:[indexPath row]];
    //    
    //    [modpromo deletePromoToHistory:[objtag promoid]];
    //    NSLog(@"Deleted row.");
    //    [self.tableviewPromo reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    PromotionModule* modpromo = [[PromotionModule alloc]init];
    //    DataPromoTag* objtag = [modpromo getPromoAt:[indexPath row]];
    //    [self navigatePage:objtag];
}



@end
