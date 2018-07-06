//
//  AboutUs.m
//  SuPerk
//
//  Created by Eric Pang on 13/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "AboutUs.h"
#import "Utils.h"

@interface AboutUs (){
    UIActivityIndicatorView *activeIndicator;
}
@end

@implementation AboutUs
@synthesize webViewAbout;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    webViewAbout.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.webViewAbout addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}

-(void)startWebViewLoad{
//    NSString *urlString = [NSString stringWithFormat:@"%@/about", [Utils serverpath]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
//    [webViewAbout loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
