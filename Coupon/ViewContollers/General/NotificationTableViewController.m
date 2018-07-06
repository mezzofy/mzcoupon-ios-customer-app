//
//  NotificationTableViewController.m
//  ProWallet
//
//  Created by Kris on 2/22/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "NotificationTableViewController.h"
#import "NotificationTableViewCell.h"
#import "Common.h"
#import <MZCoupon/MZCoupon.h>
#import "NotificationModule.h"

@interface NotificationTableViewController (){
    NSMutableArray *arrnotification;
    UIImageView* bgView;
}
@property (nonatomic, assign) NSInteger rowsCount;
@property (nonatomic, assign) NSInteger pagesize;
@end

@implementation NotificationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pagesize=1;
    NotificationModule *modnotification = [[NotificationModule alloc]init];
    
    arrnotification=[[NSMutableArray alloc]init];
    arrnotification=[modnotification getNotificationListFromServerOffset:_pagesize resultarray:arrnotification];
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 0.1f;
    return 1;
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([arrnotification count] > 0){
        return [arrnotification count];
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
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notificationcell" forIndexPath:indexPath];
    _rowsCount=indexPath.row+3;
    NotificationData * objnotify = [arrnotification objectAtIndex:indexPath.row];
    
    cell.lblname.text=[objnotify notificationTitle];
    cell.lbldescription.text=[objnotify notificationDesc];
    cell.lbldatetime.text=[objnotify createdOn];
    
    return cell;
   }
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@",[Common dataResponse]);
    if(_rowsCount < [[Common dataResponse].totalsize integerValue]){
        if(_pagesize*20 < _rowsCount){
            _pagesize=_pagesize+1;
            NotificationModule *modnotification = [[NotificationModule alloc]init];
             arrnotification=[modnotification getNotificationListFromServerOffset:_pagesize resultarray:arrnotification];
            [self.tableView reloadData];
        }
    }
}

@end
