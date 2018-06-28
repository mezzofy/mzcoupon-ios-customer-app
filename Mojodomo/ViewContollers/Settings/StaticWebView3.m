//
//  StaticWebView3.m
//  BaliCouponWallet
//
//  Created by Eric Pang on 30/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "StaticWebView3.h"
#import "Utils.h"

@interface StaticWebView3 (){
    UIActivityIndicatorView *activeIndicator;
}

@end

@implementation StaticWebView3
@synthesize webView3;

- (void)viewDidLoad {
    [super viewDidLoad];
    webView3.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webView3 addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
    NSURL *url = [NSURL URLWithString:@"https://goo.gl/maps/AaG3Y"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [webView3 loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
