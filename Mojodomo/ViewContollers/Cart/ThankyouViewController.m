//
//  ThankyouViewController.m
//  EB
//
//  Created by Kris on 13/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "ThankyouViewController.h"

#import "Common.h"

@interface ThankyouViewController ()

@end

@implementation ThankyouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(executpop:) withObject:nil afterDelay:2.0 ];
}


- (IBAction)btnClose_Touch:(id)sender {
    [self executpop:nil];
}

-(void)executpop:(NSData*)data {

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnFailClose_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:FALSE];
}


@end
