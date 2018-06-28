//
//  StaticWebViewFB.m
//  BaliCouponWallet
//
//  Created by Eric Pang on 30/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "StaticWebViewFB.h"
#import "Utils.h"

@interface StaticWebViewFB (){
    UIActivityIndicatorView *activeIndicator;
}
@end

@implementation StaticWebViewFB
@synthesize webViewFB;

- (void)viewDidLoad {
    [super viewDidLoad];
    webViewFB.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webViewFB addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/mojodomo"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [webViewFB loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
