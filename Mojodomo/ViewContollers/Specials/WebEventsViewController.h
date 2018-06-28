//
//  WebEventsViewController.h
//  CouponWallet
//
//  Created by Inforios on 14/05/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebEventsViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) NSNumber *neventid;
@property (nonatomic, retain) IBOutlet UIWebView *eventwebview;
- (IBAction)btnclose_Touch:(id)sender;

@end
