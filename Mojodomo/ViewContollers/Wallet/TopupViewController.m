//
//  VIEW.m
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "TopupViewController.h"
#import "Utils.h"
#import "Common.h"
#import "ChoosePaymentController.h"



@interface TopupViewController (){
  
    NSString *stramount;
    NSString *strmessage;
  
}

@end

@implementation TopupViewController
@synthesize txtTopupAmount,txtRemarks;
@synthesize segmentedControl;


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [txtTopupAmount setDelegate:self];
    [txtRemarks setDelegate:self];
   
    stramount = @"100";
    [txtTopupAmount setText:stramount];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"specialbgx.jpg"]]];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    if (textField == txtRemarks) {
        strmessage=txtRemarks.text;
        [txtRemarks resignFirstResponder];
    }
    
    
    return YES;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationListHandler:)
                                                 name:@"dismisstopup" object:nil];
}
-(void)myNotificationListHandler:(NSNotification *)notice {
    
    NSString *strEditCate = [notice object];
    if ([strEditCate isEqualToString:@"topuptrans"]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == txtTopupAmount)
    {
       stramount=txtTopupAmount.text;
      [segmentedControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
    }
    if (textField == txtRemarks) {
        strmessage=txtRemarks.text;
    }
    
}
- (IBAction)btnClickTopup:(id)sender {
        [self performSegueWithIdentifier:@"topupshow" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"topupshow"]) {
        
        ChoosePaymentController *vc = segue.destinationViewController;
        vc.strtopamount=[NSString stringWithFormat:@"%f",[stramount doubleValue]];
        vc.strtopmessage=strmessage;
        vc.parenttopup=@"TOPUP";

       
    }
}


-(IBAction)indexChanged:(UISegmentedControl *)sender{
  
        switch (self.segmentedControl.selectedSegmentIndex)
        {
            case 0:
                stramount = @"100";
                [txtTopupAmount setText:stramount];
                break;
            case 1:
                stramount = @"200";
                [txtTopupAmount setText:stramount];
                break;
            case 2:
                stramount = @"500";
                [txtTopupAmount setText:stramount];
                break;
            case 3:
                stramount = @"1000";
                [txtTopupAmount setText:stramount];
                break;
            default:
                break; 
        } 
}

@end

