//
//  ActivityDetailViewController.h
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ActivityDetailViewController : UITableViewController<MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) NSString *poId;

- (IBAction)btnSendEmail_Touch:(id)sender;

@end
