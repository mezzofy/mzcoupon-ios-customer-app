//
//  RegisterViewController.m
//  CouponWallet
//
//  Created by Eric Pang on 17/4/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "RegisterViewController.h"
#import "Utils.h"
#import "FMDatabase.h"
#import "Common.h"
#import "AgreementxViewController.h"
#import "HomeViewController.h"
#import "RegsisterTableViewCell.h"
#import "RegsisterModule.h"
#import "TblCustomerModel.h"
#import "CountryTableViewController.h"


#define IS_IPHONE_4_AND_OLDER_IOS8 (([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) < 568.0f)

@interface RegisterViewController (){
    
    RegsisterModule *modreg;
    NSMutableArray *arrcountry;
    NSString *countrycode;
}

@end

@implementation RegisterViewController
@synthesize txtEmail,txtPassword,txtRePassword,txtCustName,txtMobileNo,txtCountry;


- (void)viewDidLoad {
    [super viewDidLoad];
    modreg=[[RegsisterModule alloc]init];
    arrcountry=[[NSMutableArray alloc]init];
    arrcountry=[modreg getCountryListFromServer];
    txtEmail.delegate=self;
    txtMobileNo.delegate=self;
    txtPassword.delegate=self;
    txtRePassword.delegate=self;
    txtCustName.delegate=self;
    txtCountry.delegate=self;
    txtCountry.tag=1;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSString *countryname =[Common Countryname];
    countrycode=[Common countrycode];
    if([countrycode isEqualToString:@""]||countrycode.length>0)
        txtCountry.text = countryname;
    
    [self.navigationController setNavigationBarHidden:NO];
}
- (IBAction)btnContinue_Touch:(id)sender {
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";   // Email Validation
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([txtEmail.text isEqualToString:@""] || [txtCustName.text isEqualToString:@""] ||[txtMobileNo.text isEqualToString:@""]||[txtCountry.text isEqualToString:@""] || [txtPassword.text isEqualToString:@""] || [txtRePassword.text isEqualToString:@""]) {
         [self AlertMessage:NSLocalizedString(@"INVALID", nil) Message:NSLocalizedString(@"PLEASEDONOTLEAVEANYFIELDEMPTY", nil) ];
        
    }else if ([txtPassword.text length] < 8 || [txtPassword.text length] > 20||[txtRePassword.text length] < 8 || [txtRePassword.text length] > 20) {
         [self AlertMessage:NSLocalizedString(@"PASSWORDINVALID", nil) Message:NSLocalizedString(@"PASSWORDMUSTBEATLEAST8-20CHARACTERSLONG", nil) ];
       
        
    }else if ((![txtPassword.text isEqualToString:txtRePassword.text])) {
         [self AlertMessage:NSLocalizedString(@"PASSWORD", nil) Message:NSLocalizedString(@"PASSWORDMISMATCHED", nil) ];
       
    }else if ((![emailTest evaluateWithObject:txtEmail.text]) == true){
         [self AlertMessage:NSLocalizedString(@"EMAILISINVALID", nil) Message:NSLocalizedString(@"PLEASECHECKYOUREMAILADDRESSISVALID", nil) ];
      
        
    }else if (!countrycode && countrycode.length==0){
         [self AlertMessage:@" Invalid " Message:@"Select Country" ];
    }else{
        NSString *retval;
        
        CustomerData *objcustdata=[[CustomerData alloc]init];
        [objcustdata setCountryCode:countrycode];
        [objcustdata setCustomerMobile:txtMobileNo.text];
        [objcustdata setCustomerEmail:txtEmail.text];
        [objcustdata setCustomerFirstName:txtCustName.text];
        [objcustdata setCustomerPassword:txtPassword.text];
        [objcustdata setUserType:@"C"];
        CustomerDataModel *objcustomer=[[CustomerDataModel alloc]init];
        [objcustomer setCustomer:objcustdata];
        retval=[modreg postRegsisterDatatoServer:objcustomer];
        if(![retval isEqualToString:@"SUCCESS"]){
            [self AlertMessage:@"Error" Message:retval ];
        }else
            [self performSegueWithIdentifier:@"vcloader" sender:self];
    }
    
    
}

-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [self performSegueWithIdentifier:@"changevalue" sender:self];
}
-(void)AlertMessage:(NSString *)tittle Message:(NSString *)pmessage{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:tittle
                                          message:pmessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", nil)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   
                               }];
    [alertController addAction:okAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

//-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
//    [self performSegueWithIdentifier:@"changevalue" sender:self];
//}

- (void)clearFields {
    txtCountry.text=@"";
    txtEmail.text =@"";
    txtPassword.text =@"";
    txtRePassword.text=@"";
    txtCustName.text=@"";
    txtMobileNo.text=@"";
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"vcAgreement"]) {
        
        AgreementxViewController *regthanksview = segue.destinationViewController;
        regthanksview.parentvc = self;
        
    }else if ([segue.identifier isEqualToString:@"showcountry"]){
        CountryTableViewController *vc=segue.destinationViewController;
        vc.arrcountry = arrcountry;
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField.tag == 1){
        [self performSegueWithIdentifier:@"showcountry" sender:nil];
        return NO;
    }
    else
        return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == txtCustName) {
        [self performSegueWithIdentifier:@"showcountry" sender:self];
        [txtEmail becomeFirstResponder];
    }
    else if (textField == txtEmail) {
        
        [txtMobileNo becomeFirstResponder];
    }
    else if (textField == txtMobileNo) {
        
        [txtPassword becomeFirstResponder];
    }
    else if (textField == txtPassword) {
        
        [txtRePassword becomeFirstResponder];
    }
    else if (textField == txtRePassword) {
        
        [txtRePassword resignFirstResponder];
    }
    
    return YES;
    
}
- (void)animateTextView:(BOOL)up moveDistance:(float)height View:(UIView *)view
{
    const int movementDistance =height;
    const float movementDuration = 0.3f;
    int movement= movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == txtCustName)
    {
        
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:YES moveDistance:0 View:self.view];
    }
    else if (textField == txtEmail)
    {
        
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:YES moveDistance:50 View:self.view];
    }
    else if (textField == txtMobileNo)
    {
        
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:YES moveDistance:110 View:self.view];
    }
    else if (textField == txtPassword)
    {
        
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:YES moveDistance:150 View:self.view];
    }
    else if (textField == txtRePassword)
    {
        
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:YES moveDistance:200 View:self.view];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == txtCustName)
    {
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:NO moveDistance:0 View:self.view];
    }
    else if (textField == txtEmail)
    {
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:NO moveDistance:50 View:self.view];
    }
    else if (textField == txtMobileNo)
    {
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:NO moveDistance:110 View:self.view];
    }
    else if (textField == txtPassword)
    {
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:NO moveDistance:150 View:self.view];
    }
    
    else if (textField == txtRePassword)
    {
//        if (IS_IPHONE_4_AND_OLDER_IOS8)
            [self animateTextView:NO moveDistance:200 View:self.view];
    }
    
}



- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if(textField == txtCountry)
        return NO;
    return YES;
}
- (IBAction)btnBack_Touch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
