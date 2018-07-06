//
//  NetPaymentController.h
//  CouponWallet
//
//  Created by Inforios on 04/06/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewController.h"
#import "ChoosePaymentController.h"


@interface NetPaymentController : UIViewController<UIWebViewDelegate>
@property (nonatomic, retain) IBOutlet UIWebView *mywebview;

@property (nonatomic, retain) NSNumber *tnamount;
@property (nonatomic, retain) NSString *strMertId;
@property (nonatomic, retain) NSString *strpaymtkey;
- (IBAction)btnBack_Touch:(id)sender;


@end
