//
//  StaticWebView2.m
//  SuPerk
//
//  Created by Eric Pang on 1/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "StaticWebView2.h"
#import "Utils.h"

@interface StaticWebView2 (){
     UIActivityIndicatorView *activeIndicator;
}
@end

@implementation StaticWebView2
@synthesize webView2;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    webView2.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webView2 addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
//    NSString *urlString = [NSString stringWithFormat:@"%@/privacy", [Utils serverpath]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
//    [webView2 loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
