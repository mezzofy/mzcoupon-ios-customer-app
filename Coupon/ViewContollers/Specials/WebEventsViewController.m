//
//  WebEventsViewController.m
//  CouponWallet
//
//  Created by Inforios on 14/05/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "WebEventsViewController.h"

@interface WebEventsViewController (){
        UIActivityIndicatorView *activeIndicator;
}

@end

@implementation WebEventsViewController
@synthesize neventid,eventwebview;

- (void)viewDidLoad {
    [super viewDidLoad];
    eventwebview.delegate=self;
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [actInd setCenter:self.view.center];
    activeIndicator=actInd;
    [self startWebViewLoad];
    [self.eventwebview addSubview:activeIndicator];
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activeIndicator stopAnimating];
}
-(void)startWebViewLoad{
//    EventModule *daoevent = [[EventModule alloc]init];
//    TblEvent *tblevent = [daoevent getEvent:neventid];
    
//    NSString* payurl = [NSString stringWithFormat:@"%@",[tblevent eventUrl]];
//    
//    NSString* result = [payurl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //Removed new line from url
    
    NSURL* nsUrl = [NSURL URLWithString:@"http://www.mezzofy.com/test/events"];
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    [eventwebview loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnclose_Touch:(id)sender{
//    [self.navigationController popViewControllerAnimated:YES];
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
