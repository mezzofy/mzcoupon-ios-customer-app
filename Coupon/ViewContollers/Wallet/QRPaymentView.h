//
//  VIEW.h
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRPaymentView : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblEmpName;
@property (weak, nonatomic) IBOutlet UIImageView *qrImg;
@property (weak, nonatomic) IBOutlet UIProgressView *loading;
@property (weak, nonatomic) IBOutlet UILabel *lblValidSec;

@end
