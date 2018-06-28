//
//  StaticWebView.m
//  SuPerk
//
//  Created by Eric Pang on 1/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "StaticWebView1.h"
#import "Utils.h"

@interface StaticWebView1 (){
     UIActivityIndicatorView *activeIndicator;
}
@end

@implementation StaticWebView1
@synthesize webView1;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    webView1.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webView1 addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
//    NSString *urlString = [NSString stringWithFormat:@"%@/terms", [Utils serverpath]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
//    [webView1 loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
