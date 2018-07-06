//
//  VIEW.h
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TopupViewController : UIViewController <UITextFieldDelegate>


- (IBAction)btnClickTopup:(id)sender;

@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UITextField *txtTopupAmount;
@property (weak, nonatomic) IBOutlet UITextField *txtRemarks;

- (IBAction)btnBack_Touch:(id)sender;
@end
