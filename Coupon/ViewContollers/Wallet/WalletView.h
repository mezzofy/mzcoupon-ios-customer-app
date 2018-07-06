//
//  WalletView.h
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WalletView : UIViewController

@property (nonatomic, retain) UIViewController *parentvc;

@property (weak, nonatomic) IBOutlet UILabel *lblWelcomeEmpName;
@property (weak, nonatomic) IBOutlet UILabel *lblamount;
@property (weak, nonatomic) IBOutlet UILabel *lbldate;
@property (weak, nonatomic) IBOutlet UILabel *lblpending;
@property (strong, nonatomic) IBOutlet UILabel *lblwalletlog;
@property (strong, nonatomic) IBOutlet UILabel *lblcoupon;
@property (strong, nonatomic) IBOutlet UILabel *lblLucky;
@property (strong, nonatomic) IBOutlet UILabel *lblnotifications;
@property (strong, nonatomic) IBOutlet UILabel *lbltransactions;
@property (strong, nonatomic) IBOutlet UIImageView *img_Card;

- (IBAction)btnClickGetBalance:(id)sender;

@end
