//
//  VIEW.m
//  Regal Glory
//
//  Created by Eric Pang on 13/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "WalletTxnView.h"
#import "UITableViewController+ENFooterActivityIndicatorView.h"

#import "Common.h"
#import "Utils.h"
#import "ActivityCell.h"
#import "UIBarButtonItem+Badge.h"

@interface WalletTxnView (){
    NSMutableArray *arryTxnlist;
    UIActivityIndicatorView *activeIndicator;
    UIView* actvityview;
    NSNumber* _totalrows;
    NSNumber* totcount;
    NSNumber *size;
    NSMutableArray *arrycountlist;
    UIImageView *bgView;


}
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;

@end

@implementation WalletTxnView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshcontroller];
    
//    activeIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//  
//    actvityview = [Common getActivityViewer];
//    [NSThread detachNewThreadSelector:@selector(showActivityViewer:) toTarget:[Common class]  withObject:actvityview];
    
    //This block runs when the table view scrolled to the bottom
    __weak typeof(self) weakSelf = self; //Don't forget to make weak pointer to self
    [self setTableScrolledDownBlock:^void() {
        //Put here your data loading logic
        if (!weakSelf.isLoading)
            [weakSelf loadNextBatch];
    }];
    
    
    [self gettranslist];
    
    _totalrows=totcount;
    
//    if(actvityview)
//        [Common hideActivityViewer:actvityview];
//    
//    [Common hideActivityViewer:activeIndicator];
  
    [self loadtransList];
    [self.tableView reloadData];
}
- (void)loadtransList {
//    WalletModule *daotxn=[[WalletModule alloc]init];
//    arryTxnlist=[daotxn getwalletTransList];
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
   
    if([arryTxnlist count] > 0){
        return [arryTxnlist count];
    }else{
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-coupon.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"NOTXN", nil);
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
    static NSString *CellIdentifier=@"transcell";
    
    ActivityCell *cell=(ActivityCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    TblTranscation *tbltxn=[arryTxnlist objectAtIndex:indexPath.row];
//    [cell.lblTxnId setText:[tbltxn transaction_reference]];
//  //  [cell.lblTxnPrice setText:[Utils currencyFormat:[tbltxn transaction_amount] Currency:@"HKD"]];
//    CompanyModule *daoComp = [[CompanyModule alloc]init];
//    TblCompany *tblComp = [daoComp getCompanyDetail:[Common compid]];
//    
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//    [formatter setGroupingSeparator:groupingSeparator];
//    [formatter setGroupingSize:3];
//    [formatter setAlwaysShowsDecimalSeparator:NO];
//    [formatter setUsesGroupingSeparator:YES];
//    NSString *formattedString = [formatter stringFromNumber:[tbltxn transaction_amount]];
//    [cell.lblTxnPrice setText:[NSString stringWithFormat:@"%@ %@",[tblComp currency],formattedString]];
//    
//    [cell.lblTxnDateTime setText:[NSString stringWithFormat:@"%@",[Utils getFormatedDate:[tbltxn created_on] SrcFormat:@"YYYYMMddHHmm" DstFormat:@"dd-MMM-YYYY HH:mm"]]];
//    [cell.lblTxnStatus setText:[tbltxn transaction_status]];
//    
//    if([tbltxn.transaction_status isEqualToString:@"T"]){
//        [cell.lblTxnStatus setText:NSLocalizedString(@"Topup", nil)];
//        [cell.lblTxnStatus setTextColor:[UIColor cyanColor]];
//    }else if([tbltxn.transaction_status isEqualToString:@"P"]){
//        [cell.lblTxnStatus setText:NSLocalizedString(@"Pending", nil)];
//        [cell.lblTxnStatus setTextColor:[UIColor orangeColor]];
//    }else if([tbltxn.transaction_status isEqualToString:@"D"]){
//        [cell.lblTxnStatus setText:NSLocalizedString(@"paid", nil)];
//        [cell.lblTxnStatus setTextColor:[UIColor greenColor]];
//    }else if([tbltxn.transaction_status isEqualToString:@"F"]){
//        [cell.lblTxnStatus setText:NSLocalizedString(@"Reject", nil)];
//        [cell.lblTxnStatus setTextColor:[UIColor redColor]];
//    }else if([tbltxn.transaction_status isEqualToString:@"A"]){
//        [cell.lblTxnStatus setText:NSLocalizedString(@"ADJUSTMENT", nil)];
//        [cell.lblTxnStatus setTextColor:[UIColor redColor]];
//    }
    return cell;
}


-(void)loadbadgecount{
//    WalletModule *daotxn=[[WalletModule alloc]init];
//    arrycountlist=[daotxn getPendingCount];
    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrycountlist count]];
    self.navigationItem.rightBarButtonItem.badgeValue = badgenumber;
}
- (void)viewWillAppear:(BOOL)animated {
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    [self loadbadgecount];
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)gettranslist{
  
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v5/wallet_transactions/0?size=10&customer_id=%@",[Common staffid]] param:nil];
//    if (data) {
//        [self performSelectorOnMainThread:@selector(fetchedtrans:) withObject:data waitUntilDone:YES];
//    }
}

- (void)fetchedtrans:(NSData *)responsedata {
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responsedata
                          options:kNilOptions
                          error:&error];
    NSLog(@"%@",json);
    
    if ([json objectForKey:@"result"]) {
        NSDictionary *arritemres = [json objectForKey:@"result"];
        NSString* payreceipt = [arritemres valueForKey:@"response_code"];
        totcount = [arritemres valueForKey:@"total"];
        size = [arritemres valueForKey:@"size"];
      
        if ([payreceipt isEqualToString:@"0"]){
//            _rowsCount +=[size integerValue];
//            TblTransList *objtran =NULL;
//            objtran=[[TblTransList alloc]initWithDictionary:json];
//            NSLog(@"%@",[objtran toDictionary]);
//            WalletModule *daowallet= [[WalletModule alloc]init];
//            for(int i=1;i<[[objtran transactions] count];i++){
//                TblTranscation *tbltrans = [[objtran transactions] objectAtIndex:i];
//    
//                TblTranscation *objspl = [daowallet getWalletTrans:[tbltrans transaction_reference]];
//                if (objspl !=NULL) {
//                    
//                if (![tbltrans.hash_code isEqualToString:[objspl hash_code]]) {
//                    [daowallet updateWalletTrans:tbltrans];
//                    continue;
//                }
//                }else {
//                    [daowallet addWalletTrans:tbltrans];
//                }
//            }
        }
        else{
            NSLog(@"failed");
        }
    }
}


#pragma mark - Product Pagination
-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    //Clear loaded data
    _rowsCount = 0;
     [self gettranslist];
    [self loadNextBatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [refresh endRefreshing];
    
}

#pragma mark - Data loading logic
- (void)loadNextBatch {
    _isLoading = YES;
    if (![self footerActivityIndicatorView])
        [self addFooterActivityIndicatorWithHeight:80.f];//Add ENFooterActivityIndicatorView to tableView's footer
    
    if (_rowsCount < [_totalrows intValue])
        [self performSelectorOnMainThread:@selector(addNewData) withObject:nil waitUntilDone:FALSE ];
    else
        [self removeFooterActivityIndicator];
}

- (void)addNewData {
    
    dispatch_queue_t processQueue = dispatch_queue_create("Process Queue",NULL);
    
    dispatch_async(processQueue, ^{
       
//        NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v5/wallet_transactions/%ld?size=10&customer_id=%@",(long)_rowsCount,[Common staffid]] param:nil];
//        if (data) {
//            [self performSelectorOnMainThread:@selector(fetchedtrans:) withObject:data waitUntilDone:YES];
//        }
//
        [self loadtransList];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _isLoading = NO;
            [self.tableView reloadData];
            
            if (_rowsCount == [_totalrows intValue])
                [self removeFooterActivityIndicator];
        });
        
    });
}


@end

