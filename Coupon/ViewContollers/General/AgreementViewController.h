//
//  AgreementViewController.h
//  SuPerk
//
//  Created by Eric Pang on 13/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewTController.h"

@interface AgreementViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, retain) IBOutlet UIWebView *webViewAgreement;

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewTController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
- (IBAction)btnClickAgree:(id)sender;

@end
