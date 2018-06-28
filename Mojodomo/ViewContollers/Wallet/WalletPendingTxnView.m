//
//  VIEW.m
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "WalletPendingTxnView.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "Common.h"
#import "Utils.h"
#import "WalletTopUpTransactionModule.h"
#import "ActivityCell.h"
#import "NSString+MD5.h"

@interface WalletPendingTxnView (){
    
    WalletTopUpTransactionModule *modwallettxn;
    
    
    
    NSMutableArray *arrycountlist;
    UIImageView *bgView;

    
}
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;

@end

@implementation WalletPendingTxnView


- (void)viewDidLoad {
    [super viewDidLoad];
    modwallettxn=[[WalletTopUpTransactionModule alloc]init];
    [modwallettxn getWalletAllTransationListFromServer:@"P" Offset:1];
    [self.tableView reloadData];
}



- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if([modwallettxn getWalletTransactioncountStatus:@"P"] > 0){
        return [modwallettxn getWalletTransactioncountStatus:@"P"];
    }else{
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-coupon.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"NOPENDINGPAYMENT", nil);
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        
        [bgView addSubview:messageLabel];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"transdetl";
    
    ActivityCell *cell=(ActivityCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TblWalletTxnData *objwallettxndata=[modwallettxn getWalletTransactionbyOffset:indexPath.row Status:@"P"];

    cell.lblTxnId.text=objwallettxndata.transactionPayRef;
    
    [cell.lblTxnPrice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],objwallettxndata.transactionAmount]];
    
    cell.lblTxnDateTime.text=[NSString stringWithFormat:@"%@",objwallettxndata.updatedOn];
    cell.lblTxnStatus.text=objwallettxndata.status;
    cell.lblTxnMerchant.text=[Common getMerchantName];
    cell.lblTxnOutlet.text=[objwallettxndata siteId];
    [cell.lblTxnStaff setText:@""];
    
    if([objwallettxndata.status isEqualToString:@"P"]){
        [cell.lblTxnStatus setText:NSLocalizedString(@"Pending", nil)];
        [cell.lblTxnStatus setTextColor:[UIColor orangeColor]];
    }
    
//    [cell.btndecline addTarget:self action:@selector(customActionDecline:event:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.btnapprove addTarget:self action:@selector(customActionApprove:event:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)customActionDecline:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    NSLog(@"%ld",indexPath.row);
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"DECLINE",nil)
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {}];
    
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:NSLocalizedString(@"CANCEL", @"Ok action")
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction *action)
                             {}];
    [alertController addAction:okAction];
    [alertController addAction:cancel];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
}
- (void)customActionApprove:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    NSLog(@"%ld",(long)indexPath.row);
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"APPROVE",nil)
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {}];
    
    UIAlertAction *cancel = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"CANCEL", @"Ok action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {}];
    [alertController addAction:okAction];
    [alertController addAction:cancel];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"%ld",(long)alertView.tag); // Your Indexpath is here
    
//    if(buttonIndex != 0){
//        if (alertView.tag%10==1) {
//            TblTranscation *tbltrans=[arryTxnlist objectAtIndex:alertView.tag/10];
//            [self rejectRequest:tbltrans];
//        }else if (alertView.tag%10==2){
//            TblTranscation *tbltrans=[arryTxnlist objectAtIndex:alertView.tag/10];
//            [self approveRequest:tbltrans];
//        }
//    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//-(BOOL) approveRequest:(TblTranscation*)pobjtxn {
//    BOOL retval;
//    NSError* error;
//    NSString *pstrurl =[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v5/wallet_payresponse/%@",[Common staffid]]];
//
//    NSDictionary *dict =@{@"wallet_payment":[self buildpayresponse:pobjtxn ResponseCode:@"1"]};
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:pstrurl]];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:jsonData];
//    
//    NSURLResponse *requestResponse;
//    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
//    
//    if(requestHandler != NULL){
//        NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
//        NSData* data1 = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"requestReply: %@", requestReply);
//        if (requestReply != nil) {
//            [self performSelectorOnMainThread:@selector(fetchedResponse:) withObject:data1 waitUntilDone:YES];
//        }
//    }
//    return retval;
//}
//
//-(BOOL) rejectRequest:(TblTranscation*)pobjtxn {
//    BOOL retval;
//    
//    NSError* error;
//    NSString *requrl =[NSString stringWithFormat:@"%@%@",[Utils pathsetting],[NSString stringWithFormat:@"ws/v5/wallet_payresponse/%@",[Common staffid]]];
//    
//    NSDictionary *dict =@{@"wallet_payment":[self buildpayresponse:pobjtxn ResponseCode:@"2"]};
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:requrl]];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:jsonData];
//    
//    NSURLResponse *requestResponse;
//    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
//    
//    if(requestHandler != NULL){
//        NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
//        NSData* data1 = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"requestReply: %@", requestReply);
//        if (requestReply != nil) {
//            [self performSelectorOnMainThread:@selector(fetchedResponse:) withObject:data1 waitUntilDone:YES];
//        }
//    }else{
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"FAILlRP",nil) message:NSLocalizedString(@"SERVERCONNECTIONFAIL",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    
//    return retval;
//}


- (void)fetchedResponse:(NSData *)responseRegData {
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseRegData
                          options:kNilOptions
                          error:&error];
    NSLog(@"%@",json);
    
    if ([json objectForKey:@"result"]) {
        NSDictionary *arritemres = [json objectForKey:@"result"];
        NSString* payreceipt = [arritemres valueForKey:@"response_code"];
        
        if ([payreceipt isEqualToString:@"0"]){
            NSDictionary *arryres = [json objectForKey:@"customer"];
//            [self getPendinglist];
//            [self loadtransList];
            [self.tableView reloadData];
            
        }  else if([payreceipt isEqualToString:@"11008"]){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:NSLocalizedString(@"FAILRP",nil)
                                                  message:NSLocalizedString(@"RPAMTNOTENOUGHT",nil)
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {}];
            [alertController addAction:okAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });

        }else{
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:NSLocalizedString(@"FAILRP",nil)
                                                  message:NSLocalizedString(@"APPROVALFAIL",nil)
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {}];
            [alertController addAction:okAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });

        }
        
    }
    else {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:NSLocalizedString(@"FAILlRP",nil)
                                              message:NSLocalizedString(@"SERVERCONNECTIONFAIL",nil)
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"Ok action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {}];
        [alertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });

    }
}

//-(NSDictionary *)buildpayresponse:(TblTranscation*)pobjtxn ResponseCode:(NSString*)presponsecode {
//    
//    NSString* approvalbase = [NSString stringWithFormat:@"%@%.02f%@%@",[pobjtxn transaction_reference],[[pobjtxn transaction_amount] doubleValue], [Common staffid], presponsecode];
//    NSString* approvalcode = [[[approvalbase MD5Digest] MD5Digest] MD5Digest];
//    
//    NSDictionary *jsondic=@{@"transaction_reference":[pobjtxn transaction_reference], @"payment_response":presponsecode, @"transaction_amount":[pobjtxn transaction_amount],@"approval_code":approvalcode,@"created_on":[Utils getCurrentDate:@"yyyyMMddHHmm"]};
//    
//    return jsondic;
//    
//}
//-(void)getPendinglist{
//    
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v5/wallet_paypending?customer_id=%@",[Common staffid]] param:nil];
//    if (data) {
//        [self performSelectorOnMainThread:@selector(fetchedtrans:) withObject:data waitUntilDone:YES];
//    }
//}

//- (void)fetchedtrans:(NSData *)responsedata {
//    
//    NSError* error;
//    NSDictionary* json = [NSJSONSerialization
//                          JSONObjectWithData:responsedata
//                          options:kNilOptions
//                          error:&error];
//    NSLog(@"%@",json);
//    
//    if ([json objectForKey:@"result"]) {
//        NSDictionary *arritemres = [json objectForKey:@"result"];
//        NSString* payreceipt = [arritemres valueForKey:@"response_code"];
//        NSString* rectotal = [arritemres valueForKey:@"total"];
//
//        
//        if ([payreceipt isEqualToString:@"0"]){
//            
//            TblTransList *objtran =NULL;
//            objtran=[[TblTransList alloc]initWithDictionary:json];
//            NSLog(@"%@",[objtran toDictionary]);
//            WalletModule *daowallet= [[WalletModule alloc]init];
//            [daowallet deletepending];
//            
//            for(int i=1;i<[[objtran transactions] count];i++){
//                TblTranscation *tbltrans = [[objtran transactions] objectAtIndex:i];
//                [daowallet addWalletTrans:tbltrans];
//                
//            }
//        }else if ([rectotal isEqualToString:@"0"]){
//            WalletModule *daowallet= [[WalletModule alloc]init];
//            [daowallet deletepending];
//        }
//        else{
//            NSLog(@"failed");
//        }
//    }
//}

@end

