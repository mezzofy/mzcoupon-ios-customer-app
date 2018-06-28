//
//  PaymentConfirmView.m
//  RgMerchant
//
//  Created by Inforios on 29/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "PaymentConfirmView.h"
#import "Utils.h"
#import "Common.h"

@interface PaymentConfirmView (){
//     GetResponse *respn;
}

@end

@implementation PaymentConfirmView
@synthesize parentvc;
@synthesize lblTopupCustomer;
@synthesize lblTopupRef;
@synthesize lblToupuAmount;
@synthesize txnamount;



- (void)viewDidLoad {
    [super viewDidLoad];
//    respn=[[GetResponse alloc]init];
    lblTopupCustomer.text = [self txnCustomerName];
    lblTopupRef.text = [self txnRef];
    lblToupuAmount.text = [self txnmobile];
   
}
- (IBAction)btnConfirmTopup:(id)sender {
    NSString* transno = [[NSUUID UUID] UUIDString];
    transno = [transno stringByReplacingOccurrencesOfString:@"-" withString:@""];
    [self buildTxnJson:transno Payment:@"" PayResponse:@"0"];
//    [Common objectrespn:respn];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dismisstransfer" object:@"Transfer"];
    
}

- (IBAction)btnCancelToupup:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
//    NSLog(@"%@",[self txnCustomerId]);
//    // Txn cart detail
//    CartModule *daocart=[[CartModule alloc]init];
//    NSMutableArray *txncart = [daocart getCartList:[tblstf staffId]];
//    NSMutableArray *dicpayment = [self buildtxncart:txncart];
//    
//    
//    NSDictionary *dict = @{@"transactionId":@"0", @"transactionNo":txnno,@"transactionTotal":txnamount, @"staffId":[tblstf staffId], @"companyId":[tblstf companyId],@"transactionDate":[Utils getCurrentDate:@"dd-MM-yyyy"], @"hashCode":@"0", @"payReceipt":payreceipt, @"createdOn":[Utils getCurrentDate:@"dd-MM-yyyy HH:mm:ss"],@"status":@"A",@"transdtls" :dicpayment,@"payResponse":payrespnse,@"couponType":@"C",@"transferId":[self txnCustomerId], @"transferRemark":@"transfer"};
//   
//    
//    NSLog(@"%@",dict);
//    
//    NSString* pstrurl=[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v4/transactionv4"]];
//    
//    NSError *error;
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
