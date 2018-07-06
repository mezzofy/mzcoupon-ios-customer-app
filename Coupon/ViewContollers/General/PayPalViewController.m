//
//  PayPalViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/03/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "PayPalViewController.h"
#import "Utils.h"
#import "Common.h"
#import "CartModule.h"
#import "TblWalletTxnData.h"
#import "TblWalletTxnModel.h"
#import "WalletTopUpTransactionModule.h"
#import <MZCoupon/MZCoupon.h>

@interface PayPalViewController ()
{
    BOOL rootvc;
}
@end

@implementation PayPalViewController
@synthesize poId,paymentDetailId,parentvc,topamount,topremarks;
@synthesize paytoken;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    rootvc=FALSE;
  NSString*  urlString=[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"/paypalweb_process.do?poId=%@&paymentDetailId=%@",poId,paymentDetailId]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webview loadRequest:urlRequest];
    


}
-(void)viewWillAppear:(BOOL)animated{
    if(rootvc)
        [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request mainDocumentURL];
    NSLog(@"The Redirected URL is: %@", url);
    
    
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
    

    if (!([url.path rangeOfString:@"/paypalweb_success.do"].location == NSNotFound)){
        if([parentvc isEqualToString:@"TOPUP"]){
            
            WalletTxnData *objwallettxn=[[WalletTxnData alloc]init];
            [objwallettxn setCustomerId:[Common getCustomerId]];
            [objwallettxn setTransactionType:@"3"];
            [objwallettxn setPaymentResponse:@"0"];
            [objwallettxn setTransactionNotes:topremarks];
            [objwallettxn setTransactionAmount:topamount];
            [objwallettxn setTransactionPayRef:paytoken];
            WalletTxnDataModel *objwalletmod=[[WalletTxnDataModel alloc]init];
            [objwalletmod setWallettxn:objwallettxn];
            
            WalletTopUpTransactionModule *modwallettopup=[[WalletTopUpTransactionModule alloc]init];
            NSString *retval=[modwallettopup PostWalletTopUpTransationDataToServer:objwalletmod];
            if([retval isEqualToString:@"SUCCESS"]){
                 rootvc=TRUE;
                [self performSegueWithIdentifier:@"paymentthankyou" sender:self];
            }else{
                rootvc=TRUE;
                [self performSegueWithIdentifier:@"paymentfailure" sender:self];
            }
        }else{
        CartModule *modcart=[[CartModule alloc]init];
        bool res = [modcart deteleCartItemsAfterPayment];
        if(res){
        rootvc=TRUE;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CartList" object:nil];
        [self performSegueWithIdentifier:@"paymentthankyou" sender:self];
        }
        }
    } else if (!([url.path rangeOfString:@"/paypalweb_failure.do"].location == NSNotFound)){
        rootvc=TRUE;
        [self performSegueWithIdentifier:@"paymentfailure" sender:self];
    }
    
    return true;
}


@end
