//
//  HowToRedeemView.m
//  SuPerk
//
//  Created by Eric Pang on 1/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "HowToRedeemView.h"
#import "Utils.h"


@interface HowToRedeemView ()
{
    UIActivityIndicatorView *activeIndicator;

}
@end

@implementation HowToRedeemView
@synthesize webView;
@synthesize brandName;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    webView.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //Put the indicator on the center of the webview
    [actInd setCenter:self.view.center];
    
    //Assign it to the property
    activeIndicator=actInd;
    
     [self startWebViewLoad];
    
    //Add the indicator to the webView to make it visible
    [self.webView addSubview:activeIndicator];

}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}
-(void)startWebViewLoad{
    
    NSString *urlString = NULL;
//    urlString = [NSString stringWithFormat:@"%@/how-to-redeem", [Utils serverpath]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:urlRequest];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
