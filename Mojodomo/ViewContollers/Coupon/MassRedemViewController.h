//
//  MassRedemViewController.h
//  ProWallet
//
//  Created by Inforios on 07/01/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MassRedemViewController : UITableViewController

@property (nonatomic, retain) NSString *Siteid;
@property (nonatomic, retain) NSString *MerchantId;
-(IBAction)btnBack:(id)sender;
-(IBAction)btnNext:(id)sender;

@end
