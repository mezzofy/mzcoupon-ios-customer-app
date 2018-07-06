//
//  StaticWebViewTW.m
//  BaliCouponWallet
//
//  Created by Eric Pang on 30/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "StaticWebViewTW.h"
#import "Utils.h"

@interface StaticWebViewTW (){
    UIActivityIndicatorView *activeIndicator;
}
@end

@implementation StaticWebViewTW
@synthesize webViewTW;

- (void)viewDidLoad {
    [super viewDidLoad];
    webViewTW.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webViewTW addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
    NSURL *url = [NSURL URLWithString:@"https://www.twitter.com/balicoupon"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [webViewTW loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

