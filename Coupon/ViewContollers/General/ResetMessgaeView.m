//
//  ResetMessgaeView.m
//  cashier
//
//  Created by Kaliyarajalu on 03/02/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "ResetMessgaeView.h"
#import "HomeViewController.h"

@interface ResetMessgaeView ()

@end

@implementation ResetMessgaeView

- (void)viewDidLoad {
    [super viewDidLoad];
     
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view.
    
    [self performSelector:@selector(btnClose_Touch:) withObject:nil afterDelay:3.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
  [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)btnClose_Touch:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:FALSE];
}
@end
