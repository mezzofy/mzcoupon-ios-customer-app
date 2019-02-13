//
//  SetUpViewController.m
//  MZCoupon
//
//  Created by Vasanth Inforios on 04/05/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "SetUpViewController.h"
#import "Common.h"

@interface SetUpViewController (){
    NSString *txtMerchant,*txtOAuthKey,*txtOAuthSecret;
}

@end

@implementation SetUpViewController
@synthesize txt_MerchantID,txt_OauthKey,txt_OauthSecret;
- (void)viewDidLoad {
    [super viewDidLoad];
    txt_MerchantID.delegate=self;
    txt_OauthSecret.delegate=self;
    txt_OauthKey.delegate=self;
    
    if([[Common getUserSetting]isEqualToString:@"YES"]){
        txt_MerchantID.text=[Common getMerchantID];
        txt_OauthSecret.text=[Common getOauthSecret];
        txt_OauthKey.text=[Common getOAuthKey];
        
    }else{
        txt_MerchantID.text=[Common merchantid];
        txt_OauthSecret.text=@"x";
        txt_OauthKey.text=@"NPNN10";
    }
    
    txtMerchant =txt_MerchantID.text;
    txtOAuthKey =txt_OauthKey.text;
    txtOAuthSecret =txt_OauthSecret.text;
    txt_MerchantID.tag=1;
    txt_OauthKey.tag=2;
    txt_OauthSecret.tag=3;
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 400, 100)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"DONE", nil) style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    
    [txt_MerchantID addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    txt_MerchantID.inputAccessoryView = numberToolbar;
    
    [txt_OauthKey addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    txt_OauthKey.inputAccessoryView = numberToolbar;
    
    [txt_OauthSecret addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    txt_OauthSecret.inputAccessoryView = numberToolbar;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField.tag==1){
        txtMerchant=textField.text;
        [txt_OauthKey becomeFirstResponder];
    }else if(textField.tag==2){
        txtOAuthKey=textField.text;
        [txt_OauthSecret becomeFirstResponder];
    }else if(textField.tag==3){
        txtOAuthSecret=textField.text;
        [textField resignFirstResponder];
    }
    return YES;
}
-(void)doneWithNumberPad {
    [self.view endEditing:YES];
    
}
-(void)textFieldDidChange:(UITextField *)textField  {
    if(textField.tag==1){
        txtMerchant=textField.text;
    }else if(textField.tag==2){
        txtOAuthKey=textField.text;
    }else if(textField.tag==3){
        txtOAuthSecret=textField.text;
    }
}

-(void)AlertMessage:(NSString *)tittle  Message:(NSString *)Message {
    UIAlertController *alertController1 = [UIAlertController
                                           alertControllerWithTitle:tittle
                                           message:Message
                                           preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", nil)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){}];
    [alertController1 addAction:okAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController1 animated:YES completion:nil];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)btn_back:(id)sender {
     if(txtMerchant.length>0 && txtOAuthSecret.length>0 && txtOAuthKey.length>0){
         [Common setMerchantID:txtMerchant setOAuthKey:txtOAuthKey setOAuthSecret:txtOAuthSecret setUserSetting:@"YES"];
         [MZCouponConfig SetupMerchantID:txtMerchant Server:FALSE AccessToken:txtOAuthKey AccessKey:txtOAuthSecret];
         [self.navigationController popViewControllerAnimated:YES];
     }else{
         UIAlertController *alertController1 = [UIAlertController
                                                alertControllerWithTitle:@"Error"
                                                message:@"Changed Configuration to default"
                                                preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *okAction = [UIAlertAction
                                    actionWithTitle:NSLocalizedString(@"OK", nil)
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action){
                                       
                                        [Common setMerchantID:[Common merchantid] setOAuthKey:@"NPNN10" setOAuthSecret:@"x" setUserSetting:@"NO"];
                                        [MZCouponConfig SetupMerchantID:@"DMHA" Server:FALSE AccessToken:@"NPNN10" AccessKey:@"x"];
                                         [self.navigationController popViewControllerAnimated:YES];
                                    }];
         [alertController1 addAction:okAction];
         dispatch_async(dispatch_get_main_queue(), ^{
             [self presentViewController:alertController1 animated:YES completion:nil];
         });
         
     }
    
}


- (IBAction)btn_Save:(id)sender {
    if(txtMerchant.length>0 && txtOAuthSecret.length>0 && txtOAuthKey.length>0){
        [Common setMerchantID:txtMerchant setOAuthKey:txtOAuthKey setOAuthSecret:txtOAuthSecret setUserSetting:@"YES"];
        [MZCouponConfig SetupMerchantID:txtMerchant Server:FALSE AccessToken:txtOAuthKey AccessKey:txtOAuthSecret];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else
        [self AlertMessage:@"Error" Message:@"Check Feilds" ];
    
}
- (IBAction)btn_default:(id)sender {
    [Common setMerchantID:@""  setOAuthKey:@"" setOAuthSecret:@"" setUserSetting:@""];
    txt_MerchantID.text=[Common merchantid];
    txt_OauthSecret.text=@"x";
    txt_OauthKey.text=@"NPNN10";
    [Common setMerchantID:txtMerchant setOAuthKey:txtOAuthKey setOAuthSecret:txtOAuthSecret setUserSetting:@"NO"];
    [MZCouponConfig SetupMerchantID:txtMerchant Server:FALSE AccessToken:txtOAuthKey AccessKey:txtOAuthSecret];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
