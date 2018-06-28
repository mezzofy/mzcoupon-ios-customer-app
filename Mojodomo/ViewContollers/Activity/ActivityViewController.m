//
//  ActivityViewController.m
//  EB
//
//  Created by Inforios on 12/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "UITableViewController+ENFooterActivityIndicatorView.h"
#import "ActivityViewController.h"
#import "ActivityCell.h"
#import "ActivityDetailViewController.h"
#import "Utils.h"
#import "Common.h"
#import "TblProductOrder.h"
#import "ProductOrderModule.h"


@interface ActivityViewController (){
    NSMutableArray *arryTxnlist;
    UIActivityIndicatorView *activeIndicator;
    ProductOrderModule *modprod;
    NSNumber* _totalrows;
    UIView* actvityview;
    UIImageView *bgView;
}
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) NSInteger rowsCount;
@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    modprod=[[ProductOrderModule alloc]init];

    if ([[Common getCustomertype] isEqualToString:@"G"]) {
        
    }else {
    
        [self refreshcontroller];
        //This block runs when the table view scrolled to the bottom
        __weak typeof(self) weakSelf = self; //Don't forget to make weak pointer to self
        [self setTableScrolledDownBlock:^void() {
            //Put here your data loading logic
            if (!weakSelf.isLoading)
                [weakSelf loadNextBatch];
        }];
        [modprod loadProductorderListfromserver:1];
        
        [self.tableView reloadData];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.tableView.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
    [self.tableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

-(void)refreshcontroller
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    //Clear loaded data
    _rowsCount = 0;
    [self loadNextBatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [refresh endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    for (UIView* view in bgView.subviews){
        [view removeFromSuperview];
    }
    if([modprod getTransactionRecordsCount]>0)
        return [modprod getTransactionRecordsCount];
    else {
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50, 100, 100)];
        dot.image=[UIImage imageNamed:@"empty-coupon.png"];
        [bgView addSubview:dot];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - 13 + 50 + 10, self.view.frame.size.width, 26)];
        
        messageLabel.text = NSLocalizedString(@"DIGITALRECEIPTS", nil);
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
    static NSString *CellIdentifier=@"activitycell";
    
    ActivityCell *cell=(ActivityCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TblProductOrder *objprod=[modprod getTransactionRecordsOffset:indexPath.row];
    [cell.lblTxnId setText:[objprod poId]];
        [cell.lblTxnNo setText:[objprod poNo]];

    
//    TblTrans *tbltxn=[arryTxnlist objectAtIndex:indexPath.row];
//    //    CompanyModule *daoComp = [[CompanyModule alloc]init];
//    TblCompany *tblComp = [daoComp getCompanyDetail:[Common compid]];
//    
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
//    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
//    [formatter setGroupingSeparator:groupingSeparator];
//    [formatter setGroupingSize:3];
//    [formatter setAlwaysShowsDecimalSeparator:NO];
//    [formatter setUsesGroupingSeparator:YES];
//    NSString *formattedString = [objprod poTotal];

    [cell.lblTxnPrice setText:[NSString stringWithFormat:@"%@ %@",[Common getMerchantCurrency],[objprod poTotal]]];
     if(objprod.poDate.length>10){
    NSString *newStr = [[objprod poDate] substringWithRange:NSMakeRange(0, 10)];
    
    NSTimeInterval timest = [newStr  doubleValue];
    NSDate * dt = [NSDate dateWithTimeIntervalSince1970:timest];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *enddate = [formatter stringFromDate:dt];
    [cell.lblTxnDateTime setText:enddate];
     }
    if([objprod.payResponse isEqualToString:@"0"]){
        if ([objprod poStatus]!=nil)
            if ([[objprod poStatus] isEqualToString:@"Success - Received from Agent"]) {
                [cell.lblTxnStatus setText:NSLocalizedString(@"SuccessReceivedfromAgent",nil)];
            }else
                [cell.lblTxnStatus setText:[objprod poStatus]];
        
            else
                [cell.lblTxnStatus setText:NSLocalizedString(@"SUCCESS", nil)];
    }
    else
        [cell.lblTxnStatus setText:NSLocalizedString(@"FAILURE", nil)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showdetaillist" sender:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showdetaillist"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TblProductOrder *objprod=[modprod getTransactionRecordsOffset:indexPath.row];
        ActivityDetailViewController *vclist = segue.destinationViewController;
        vclist.poId=[objprod poId];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
//        NSLog(@"%ld",(long)indexPath.row);
//        
//        TxnModule *daotxn=[[TxnModule alloc]init];
//        TblTrans *tbltxn=[arryTxnlist objectAtIndex:indexPath.row];
//        NSLog(@"%@", [tbltxn transactionId]);
//        
//        [self removeTxn:[tbltxn transactionId]];
//        
//        [daotxn Deletetrans:[tbltxn transactionId]];
//        
//        arryTxnlist=[daotxn getTransList:[Common staffid]];
        [self.tableView reloadData];
        
    }
}
//-(void)removeTxn:(NSNumber*)pTransId{
//    
//    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"ws/v6/remove_transaction/%@",pTransId] param:nil];
//    if (data){
//        NSError *error;
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        
//        if ([json objectForKey:@"response"]) {
//            NSDictionary *arritemres = [json objectForKey:@"response"];
//            NSString* response_code = [arritemres valueForKey:@"response_code"];
//            
//            if ([response_code isEqualToString:@"0"]){
//                
//                NSLog(@"data =%@",data);
//            }
//        }
//    }
//}
- (IBAction)btnBack_Modal_Touch:(id)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
//    dispatch_async(processQueue, ^{
//        LoaderModule *modloader = [[LoaderModule alloc]init];
//        NSString *count =[objdataresp size];
//        _rowsCount += [count integerValue];
//        JsonActivityList *objtrans = [modloader getActivityList:[Common staffid] offset:_rowsCount size:10];
//        [modloader pageLoadActivityList:objtrans.transactions];
//        
//        TxnModule *daotxn=[[TxnModule alloc]init];
//        arryTxnlist=[daotxn getTransList:[Common staffid]];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _isLoading = NO;
//            [self.tableView reloadData];
//            
//            if (_rowsCount == [_totalrows intValue])
//                [self removeFooterActivityIndicator];
//        });
//        
//    });
}

@end
