//
//  PaymentSuccessController.m
//  EB
//
//  Created by Kaliyarajalu on 17/02/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "PaymentSuccessController.h"


@interface PaymentSuccessController ()

@end

@implementation PaymentSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"thanks %@", tpayresponse);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)btnClose_Touch:(id)sender {
    [self.navigationController setNavigationBarHidden:NO];
    
//    vcparent.payresponse = tpayresponse;
    
    [self.navigationController popViewControllerAnimated:false];
}
@end
