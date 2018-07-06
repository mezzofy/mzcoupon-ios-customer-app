//
//  EventsViewController.m
//  CouponWallet
//
//  Created by Inforios on 14/05/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "EventsViewController.h"
#import "CustomCell.h"
#import "WebEventsViewController.h"
#import "UIImageView+WebCache.h"
#import "Common.h"

@interface EventsViewController (){
    NSMutableArray *arryeventlist;
}

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
//    EventModule *daoevent=[[EventModule alloc]init];
//    arryeventlist=[daoevent getEventlist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arryeventlist count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventcell" forIndexPath:indexPath];
//    TblEvent *objevent=[arryeventlist objectAtIndex:indexPath.row];
////    if( [indexPath row] % 2)
////        [cell setBackgroundColor:[UIColor whiteColor]];
////    else
////        [cell setBackgroundColor:[UIColor purpleColor]];
//  [self.tableView setSeparatorColor:[UIColor purpleColor]];
//    cell.lbltitle.text=[objevent eventTitle];
//    cell.lbldesc.text=[objevent eventDesc];
//    [cell.imgevent sd_setImageWithURL:[NSURL URLWithString:[objevent eventImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
    
    return cell;
}

- (IBAction)btnBack_Navigate_Touch:(id)sender {
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        [self performSegueWithIdentifier:@"showevent" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if ([segue.identifier isEqualToString:@"showevent"]) {
//        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
//        TblEvent *tblevt = [arryeventlist objectAtIndex:indPath.row];
//        WebEventsViewController *vc = segue.destinationViewController;
//        vc.neventid = [tblevt eventId];
//        EventModule *daoevent=[[EventModule alloc]init];
//        [daoevent updateEventCount:[tblevt eventId]];
//        
//    }
}

-(void)refresh
{
    NSLog(@"Refresh");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refreshtable:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

-(void)refreshtable:(UIRefreshControl *)sender
{
//    EventModule *daoevt = [[EventModule alloc]init];
//    [daoevt updateEventAssigned:@"U"];
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    [modloader loadEventList:[Common compid]offset:0 size:30];
//    arryeventlist=[daoevt getEventlist];
//    [self.tableView reloadData];
//    [sender endRefreshing];
}

@end

