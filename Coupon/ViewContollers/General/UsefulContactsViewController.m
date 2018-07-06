//
//  UsefulContactsViewController.m
//  BaliCouponWallet
//
//  Created by Eric Pang on 24/6/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "UsefulContactsViewController.h"

@interface UsefulContactsViewController ()

@end

@implementation UsefulContactsViewController
@synthesize parentvc;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 0)
//        return 0.1f;
//    return 1;
//}

-(IBAction)callPhone1:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361222387"]];
}

-(IBAction)callPhone1a:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361100"]];
}

-(IBAction)callPhone1b:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361147"]];
}

-(IBAction)callPhone2:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361110"]];
}

-(IBAction)callPhone3:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361118"]];
}

-(IBAction)callPhone4:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361113"]];
}

-(IBAction)callPhone5:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361111"]];
}

-(IBAction)callPhone6:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361751000"]];
}

-(IBAction)callPhone7:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361761263"]];
}

-(IBAction)callPhone8:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+623613000911"]];
}

-(IBAction)callPhone9:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361247499"]];
}

-(IBAction)callPhone10:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361710505"]];
}

-(IBAction)callPhone11:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361223036"]];
}

-(IBAction)callPhone12:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361236225"]];
}

-(IBAction)callPhone13:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361227911"]];
}

-(IBAction)callPhone14:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361235041"]];
}

-(IBAction)callPhone15:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+62361701111"]];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
