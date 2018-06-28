//
//  HowToRedeemView.h
//  SuPerk
//
//  Created by Eric Pang on 1/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToRedeemView : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, assign) NSString *brandName;

@end
