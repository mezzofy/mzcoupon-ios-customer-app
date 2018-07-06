//
//  TermsConditionView.h
//  EB
//
//  Created by Kaliyarajalu on 04/12/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsConditionView : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) NSString *reviewUrl;
@property (nonatomic, retain) IBOutlet UIWebView *mywebview;

@end
