//
//  RedeemFailureController.m
//  SuPerk
//
//  Created by Kaliyarajalu on 03/03/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "RedeemFailureController.h"

@interface RedeemFailureController ()

@end

@implementation RedeemFailureController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnClose_Touch:(id)sender {
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

@end
