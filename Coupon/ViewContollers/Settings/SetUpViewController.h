//
//  SetUpViewController.h
//  MZCoupon
//
//  Created by Vasanth Inforios on 04/05/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetUpViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txt_MerchantID;
@property (weak, nonatomic) IBOutlet UITextField *txt_OauthKey;
@property (weak, nonatomic) IBOutlet UITextField *txt_OauthSecret;
- (IBAction)btn_Save:(id)sender;

@end
