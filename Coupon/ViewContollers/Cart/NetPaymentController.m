//
//  NetPaymentController.m
//  CouponWallet
//
//  Created by Inforios on 04/06/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "NetPaymentController.h"
#import "Common.h"



@interface NetPaymentController (){
     UIView* actvityview;
//    GetResponse *respn;
}

@end

@implementation NetPaymentController
@synthesize mywebview,strMertId,strpaymtkey;

@synthesize tnamount;

- (void)viewDidLoad {
    [super viewDidLoad];
//     respn=[[GetResponse alloc]init];
//    NSString *uuidString= [[NSUUID UUID] UUIDString];
//    uuidString = [uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
//
//    NSMutableCharacterSet* encset = [[NSCharacterSet alphanumericCharacterSet] mutableCopy];
//    [encset addCharactersInString:@"-_.~"];
//    
//    NSString *returl = [@"http://www.mezzofy.com"  stringByAddingPercentEncodingWithAllowedCharacters:encset];
//    NSString* email = [[[Common currentUser] customer_email]  stringByAddingPercentEncodingWithAllowedCharacters:encset];
//    
//    
//    NSString *reqval = [NSString stringWithFormat:@"order_number=%@&merchant_id=%@&key=%@&amount=%@&currency_code=SGD&email=%@&transaction_type=Sale&return_url=%@",uuidString,strMertId,strpaymtkey,tnamount, email,returl];
//    
//    NSData *postdata = [reqval dataUsingEncoding:NSUTF8StringEncoding];
//     NSData *data =[Utils urlPostRequest:reqval body:postdata];
//    NSLog(@"%@",reqval);
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://test.reddotpayment.com/merchant/cgi-bin"]];
//    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
//    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:data];
//    [request setHTTPMethod:@"POST"];
//    
//    
   
//    [mywebview.scrollView setZoomScale:2.0f animated:NO];
    
//    [mywebview loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSURL *url = [webView.request mainDocumentURL];
    NSLog(@"The Redirected URL is: %@", url);
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request mainDocumentURL];
            NSLog(@"The Redirected URL is: %@", url);
            // Return YES if you want to load the page, and NO if you don't.
    
            NSLog(@"scheme: %@", [url scheme]);
            NSLog(@"host: %@", [url host]);
            NSLog(@"port: %@", [url port]);
            NSLog(@"path: %@", [url path]);
            NSLog(@"path components: %@", [url pathComponents]);
            NSLog(@"parameterString: %@", [url parameterString]);
            NSLog(@"query: %@", [url query]);
            NSLog(@"fragment: %@", [url fragment]);
    
    NSLog(@"body: %@", [request HTTPBody]);
    
    NSString *requestbody = [[NSString alloc] initWithBytes:[request.HTTPBody bytes] length:[request.HTTPBody length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestbody: %@", requestbody);
   
    if([url.host isEqualToString:@"www.mezzofy.com"] && [url.path isEqualToString:@"/"]){
        NSLog(@"%@",[self getURLParams:[url query]]);
        NSLog(@"%@",[self getURLParams:[url parameterString]]);
        
        NSString *str = [url query];
        NSArray *urlComponents = [str componentsSeparatedByString:@"&"];
        
        NSMutableDictionary *arrdict = [[NSMutableDictionary alloc]init];
        for (NSString *keyValuePair in urlComponents) {
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents objectAtIndex:0];
            NSString *value = [pairComponents objectAtIndex:1];
            
            [arrdict setObject:value forKey:key];
        }
//        [respn setPayresponse:[self getURLParams:[url query]]];
//        actvityview = [Common getActivityViewer];
//        [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
//        
//        [self processcart];
//        
//        if(actvityview)
//            [Common hideActivityViewer:actvityview];
//        
//        [Common objectrespn:respn];
//       
//        [self.navigationController popToRootViewControllerAnimated:false];
//        
//    }
//    else if([url.host isEqualToString:@"test.reddotpayment.com"] && [url.path  isEqualToString:@"/merchant/cgi-bin"]){
//        NSLog(@"%@",[self getURLParams:[url query]]);
//    
////        [respn setPayresponse:[self getURLParams:[url query]]];
////        [Common objectrespn:respn];
////        [self.navigationController popToRootViewControllerAnimated:false];
    }
    return YES;
}
-(NSMutableDictionary *)getURLParams:(NSString*)urlquery{
    
    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
    NSArray *urlComponents = [urlquery componentsSeparatedByString:@"&"];
    
    for (NSString *keyValuePair in urlComponents)
    {
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        NSString *key = [pairComponents objectAtIndex:0];
        NSString *value = [pairComponents objectAtIndex:1];
        
        [queryStringDictionary setObject:value forKey:key];
    }
    return queryStringDictionary;
}
- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)processcart{
//    NSString* txnno =  [respn.payresponse objectForKey:@"order_number"];
//    NSString* payreceipt = [respn.payresponse objectForKey:@"confirmation_code"];
//    if (payreceipt==nil) {
//        payreceipt=@"";
//    }
//    NSString* pay= [respn.payresponse objectForKey:@"result"];
//    NSString *payrespn;
//    if ([pay isEqualToString:@"Paid"])
//        payrespn=@"0";
//    else
//        payrespn= [respn.payresponse objectForKey:@"error_code"];
//    [self buildTxnJson:txnno Payment:payreceipt PayResponse:payrespn];
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
//    
//    // Txn cart detail
//    CartModule *daocart=[[CartModule alloc]init];
//    NSMutableArray *txncart = [daocart getCartList:[tblstf staffId]];
//    NSMutableArray *dicpayment = [self buildtxncart:txncart];
//    
//    
//    NSDictionary *dict = @{@"transactionId":@"0", @"transactionNo":txnno,@"transactionTotal":tnamount, @"staffId":[tblstf staffId], @"companyId":[tblstf companyId],@"transactionDate":[Utils getCurrentDate:@"dd-MM-yyyy"], @"hashCode":@"0", @"payReceipt":payreceipt, @"createdOn":[Utils getCurrentDate:@"dd-MM-yyyy HH:mm:ss"],@"status":@"A",@"transdtls" :dicpayment,@"payResponse":payrespnse,@"couponType":@"C"};
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
//        respn.svrtransid = [resdict valueForKey:@"transactionId"];
//        NSLog(@"transactionId: %@",respn.svrtransid);
//        
//    }
    
}

@end
