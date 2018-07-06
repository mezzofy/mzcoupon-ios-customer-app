//
//  TransferViewController.h
//  WalnetCouponWallet
//
//  Created by Inforios on 20/11/15.
//  Copyright © 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TransferViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, retain)IBOutlet UITextField *txtEmail;

- (IBAction)btnBack_Touch:(id)sender;
- (IBAction)btnSumbit_Touch:(id)sender;
@property (nonatomic, retain) NSNumber *tnamount;
@property (nonatomic, retain) NSString *logstatus;
@property (nonatomic, retain) NSString *logtopup;
//@property (nonatomic, retain) TblPayment *tblpaydtl;

@property (nonatomic, retain) NSMutableArray *arrycartitem;
- (IBAction)btnskip_Touch:(id)sender;

@end
