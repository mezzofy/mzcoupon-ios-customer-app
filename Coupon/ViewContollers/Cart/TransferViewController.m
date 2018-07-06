//
//  TransferViewController.m
//  WalnetCouponWallet
//
//  Created by Inforios on 20/11/15.
//  Copyright © 2015 Thoughts Igniter. All rights reserved.
//

#import "TransferViewController.h"
#import "Common.h"
#import "Utils.h"
#import "PaymentConfirmView.h"
#import "ChoosePaymentController.h"

@interface TransferViewController (){
        NSString *stremail;
        NSString *returnemail;
        NSString *staffid;
        NSString *stafname;
        NSString *stafmobile;

  
}

@end

@implementation TransferViewController
@synthesize txtEmail,tnamount,logstatus,arrycartitem,logtopup;

- (void)viewDidLoad {
    [super viewDidLoad];
//    respn=[[GetResponse alloc]init];
    txtEmail.delegate=self;

//    NSLog(@"%@",tblpaydtl);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack_Touch:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnSumbit_Touch:(id)sender{
    [txtEmail resignFirstResponder];
    stremail=txtEmail.text;
 
    
    if (stremail ==nil || [stremail isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Invalid"
                                              message:@"Enter the fields"
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
        
        
       
        
    }else{
       
//        NSData *dataList = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v5/getcustomer/%@",stremail] param:nil];
//        if(dataList)
//            [self performSelector:@selector(fetchedDetail:) withObject:dataList];
    }

}
//- (void)fetchedDetail:(NSData *)response {
//
//    NSError* error;
//    NSDictionary* resdict = [NSJSONSerialization
//                          JSONObjectWithData:response
//                          options:kNilOptions
//                          error:&error];
//      NSLog(@"return: %@",resdict);
//    if([[resdict objectForKey:@"staffId"] intValue] > 0) {
//        returnemail=[resdict objectForKey:@"email"];
//        staffid=[resdict objectForKey:@"staffId"];
//        stafname=[resdict objectForKey:@"staffName"];
//        stafmobile=[resdict objectForKey:@"mobile"];
//        if ([logstatus isEqualToString:@"A"] || [logstatus isEqualToString:@"S"]) {
//
//               [self performSegueWithIdentifier:@"showskip" sender:self];
//        }
//
//     }else{
//        UIAlertView *alertError =[[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Enter the valid email or mobile number" delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
//        [alertError show];
//    }
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == txtEmail) {
         [txtEmail resignFirstResponder];
    }
    return YES;
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.tag==1) {
        stremail = textField.text;
    }
    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"showskip"]) {
      
        
        UINavigationController *tabar=segue.destinationViewController;
        
        ChoosePaymentController *vc=[tabar.viewControllers objectAtIndex:0];
//        ChoosePaymentController *vc = segue.destinationViewController;

        
    }

}
-(void)viewWillAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandler:)
                                                 name:@"dism" object:nil];
//    respn=[Common pobjresponse];
//    if (respn.svrtransid != Nil) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:@"dismisstransfer" object:@"Transfer"];
       // if (staffid== nil) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"dismisstransfer" object:@"Transfer"];
        //}
//    }
    
   
}
- (IBAction)btnskip_Touch:(id)sender{
//            staffid=[NSString stringWithFormat:@"%@",[Common staffid]];
//    
//           [self performSegueWithIdentifier:@"showskip" sender:self];
}


-(void)myNotificationListHandler:(NSNotification *)notice {
    
    NSString *strEditCate = [notice object];
    if ([strEditCate isEqualToString:@"Trans"]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
      //  [[NSNotificationCenter defaultCenter] postNotificationName:@"dismisstransfer" object:@"Transfer"];

    }
}

- (NSMutableArray *)buildtxncart:(NSMutableArray *)txncart {
    NSDictionary *jsondic;
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    // Dummy
    NSArray *keysd = [NSArray arrayWithObjects:@"transdtlId", @"prodId", @"prodQty", @"prodPrice",@"prodTotal",@"prodName",nil];
    NSArray *objectsd = [NSArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", nil];
    jsondic = [NSDictionary dictionaryWithObjects:objectsd forKeys:keysd];
    [array addObject:jsondic];
    
    // Build using the txn prod
//    for(TblCart *dtl in txncart) {
//        
//        NSArray *keys1 = [NSArray arrayWithObjects:@"transdtlId", @"prodId", @"prodQty", @"prodPrice",@"prodTotal",@"prodName",nil];
//        NSArray *objects1 = [NSArray arrayWithObjects:@"0",[dtl prodId], [dtl productQty],[dtl productPrice], [dtl totalPrice], [dtl productName],nil];
//        
//        jsondic = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];
//        [array addObject:jsondic];
//    }
    return array;
}

- (void)buildTxnJson: (NSString*)txnno Payment:(NSString*)payreceipt PayResponse:(NSString*)payrespnse{
//    StaffModule *daostaff=[[StaffModule alloc]init];
//    TblStaff *tblstf=[daostaff getStaffList];
    
    // Txn cart detail
//    CartModule *daocart=[[CartModule alloc]init];
//    NSMutableArray *txncart = [daocart getCartList:[tblstf staffId]];
//    NSMutableArray *dicpayment = [self buildtxncart:txncart];
//    
    
//    NSDictionary *dict = @{@"transactionId":@"0", @"transactionNo":txnno,@"transactionTotal":tnamount, @"staffId":[tblstf staffId], @"companyId":[tblstf companyId],@"transactionDate":[Utils getCurrentDate:@"dd-MM-yyyy"], @"hashCode":@"0", @"payReceipt":payreceipt, @"createdOn":[Utils getCurrentDate:@"dd-MM-yyyy HH:mm:ss"],@"status":@"A",@"transdtls" :dicpayment,@"payResponse":payrespnse,@"couponType":@"C"};
//    
//    
//    NSLog(@"%@",dict);
    
    NSString* pstrurl=[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v4/transactionv4"]];
    
    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
//     NSData *data =[Utils urlPostRequest:pstrurl body:jsonData];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:pstrurl]];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:data];
//    
//    NSURLResponse *requestResponse;
//    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
//    
//    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
//    NSLog(@"requestReply: %@", requestReply);
//    if (requestHandler !=nil) {
//        
//        NSDictionary* resdict = [NSJSONSerialization
//                                 JSONObjectWithData:requestHandler //1
//                                 options:kNilOptions
//                                 error:&error];
//        
//        NSLog(@"return: %@",resdict);
//        
//        [respn setSvrtransid:[resdict valueForKey:@"transactionId"]];
//        [respn setPaystatus:@"approved"];
//        NSLog(@"transactionId: %@",respn.svrtransid);
//        
//    }
    
}

@end
