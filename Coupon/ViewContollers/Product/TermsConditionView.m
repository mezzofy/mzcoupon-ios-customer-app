//
//  TermsConditionView.m
//  EB
//
//  Created by Kaliyarajalu on 04/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import "TermsConditionView.h"

@interface TermsConditionView ()
{
        UIActivityIndicatorView *activeIndicator;
}
@end

@implementation TermsConditionView
@synthesize reviewUrl;

@synthesize mywebview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mywebview.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
     activeIndicator=actInd;
    [self startWebViewLoad];
    [self.mywebview addSubview:activeIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}
-(void)startWebViewLoad{

    
    NSString* payurl = [NSString stringWithFormat:@"%@",reviewUrl];
    
    NSString* result = [payurl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //Removed new line from url
    
    NSURL* nsUrl = [NSURL URLWithString:result];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [mywebview loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
