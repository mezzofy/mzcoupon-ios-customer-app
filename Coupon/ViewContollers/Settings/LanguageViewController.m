//
//  LanguageViewController.m
//  MzCouponWallet
//
//  Created by Eric Pang on 19/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "LanguageViewController.h"
#import "BundleEx.h"

@interface LanguageViewController ()
@end
@implementation LanguageViewController
@synthesize language;
@synthesize region;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn_English:(id)sender {
    [self setLanguage:@"Base" Region:@""];
}

- (IBAction)btn_Simpilfied:(id)sender {
    [self setLanguage:@"zh-Hans" Region:@""];
}

- (IBAction)btn_Traditional:(id)sender {
    [self setLanguage:@"zh-Hant" Region:@""];
}

- (void) setLanguage:(NSString *)planguage Region:(NSString*)pregion {
    
    NSString* languageDescription = [NSString stringWithFormat:@"%@",planguage];

    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects: languageDescription, nil]
                                              forKey: @"AppleLanguages"];
    
    [NSBundle setLanguage:planguage];
    
    UIViewController* pv = [self.parentViewController presentingViewController];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:FALSE completion:^{
        [pv dismissViewControllerAnimated:FALSE completion:nil];
    }];
}

@end
