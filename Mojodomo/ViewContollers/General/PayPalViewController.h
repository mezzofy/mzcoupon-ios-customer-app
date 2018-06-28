
//
//  PayPalViewController.h
//  ProWallet
//
//  Created by Inforios Technologies on 04/03/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayPalViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) NSString *poId;
@property (strong, nonatomic) NSString * paymentDetailId;
@property (strong, nonatomic) NSString *topamount;
@property (strong, nonatomic) NSString *topremarks;
@property (strong, nonatomic) NSString *parentvc;
@property (strong, nonatomic) NSString *paytoken;
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
