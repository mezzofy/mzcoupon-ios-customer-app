//
//  ClassificationListViewController.m
//  MzCouponWallet
//
//  Created by Inforios on 03/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "ClassificationListViewController.h"
#import "CustomCell.h"
#import "UIImageView+WebCache.h"
#import "MerchantView.h"
#import "Common.h"
#import "EventsViewController.h"
#import "UIBarButtonItem+Badge.h"
#import "MyAnnotation.h"
#import "Utils.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface ClassificationListViewController (){
    NSMutableArray *arryclassificationList;
    NSMutableArray *arryeventlist;
    CLLocationManager *manager;
    CLLocationCoordinate2D locatios;
}

@end

@implementation ClassificationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self displaycart:Nil];
    NSString *netconnect = [Utils NetworkConnection];
    if (![netconnect isEqualToString:@"No Internet"]) {
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    //Replace the methods below with your required method name.
    if(IS_OS_8_OR_LATER){
        [manager requestWhenInUseAuthorization];
    }
    [manager startUpdatingLocation];

    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(displaycart:)
                                                 name:@"dispcartinfo" object:nil];
    
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    [modloader loadclassification:[Common compid]];
    
    
    }else
      [self loadClassificationList];
    // refresh control
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"PULLTOREFRESH", nil)
                                                                attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:title];
    
    [refresh setTintColor:[UIColor grayColor]];
    [refresh addTarget:self
                action:@selector(refreshView:)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Error"
                                          message:@"Failed to Get Your Location"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", nil)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                               }];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"CANCEL", nil)
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){}];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
   
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        //locatios.latitude=-8.742612;
        //locatios.longitude=115.166726;
        locatios.latitude = currentLocation.coordinate.latitude;
        locatios.longitude = currentLocation.coordinate.longitude;
        
        // [self loadmap];
        //[self zoomToFitMapAnnotations];
        
    }
}


-(void)refreshView:(UIRefreshControl *)refresh {
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Refreshing data..."
                                                                attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:title];
    // custom refresh logic would be placed here...
//    ProductModule *modprd = [[ProductModule alloc]init];
//    [modprd updatespecialStatus:@"U"];
//    LoaderModule *modloader = [[LoaderModule alloc]init];
//    [modloader loadclassification:[Common compid]];
//    EventModule *daoevt = [[EventModule alloc]init];
//    [daoevt updateEventAssigned:@"U"];
//    [modloader loadEventList:[Common compid]offset:0 size:30];
    [self loadbadgecount];

  
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"LASTUPDATED", nil),
                             [formatter stringFromDate:[NSDate date]]];
    
    NSAttributedString *updtitle = [[NSAttributedString alloc] initWithString:lastUpdated
                                                                   attributes: @{NSForegroundColorAttributeName:[UIColor grayColor]}];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:updtitle];
    
    [refresh endRefreshing];
    
    // Reload table data
    [self loadClassificationList];
    
}
- (void)loadClassificationList {
//    ClassificationModule *daoclass = [[ClassificationModule alloc]init];
//    arryclassificationList = [daoclass getclassificationList];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"specialbgx.jpg"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    self.tableView.backgroundView.layer.zPosition -= 1;
    [self loadbadgecount];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [arryclassificationList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cellclass" forIndexPath:indexPath];
    // Configure the cell...
//    TblClassification *tblclass = [arryclassificationList objectAtIndex:indexPath.row];
//    
//    [cell.imgSpecials sd_setImageWithURL:[NSURL URLWithString:[tblclass classificationImage]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageRefreshCached];
//    
//    
//    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
//    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
//    [cell setBackgroundColor:[UIColor clearColor]];
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showclass" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showclass"]) {
        
//        MerchantView *vcclass = segue.destinationViewController;
//        NSIndexPath *indxPath = [self.tableView indexPathForSelectedRow];
//        TblClassification *tblclass = [arryclassificationList objectAtIndex:indxPath.row];
//        vcclass.nClassificationId =[tblclass classificationId];
    }
    else if ([segue.identifier isEqualToString:@"shownews"]) {
//            EventsViewController *evt = segue.destinationViewController;
//            LoaderModule *modloader = [[LoaderModule alloc]init];
//            EventModule *daoevt = [[EventModule alloc]init];
//            [daoevt updateEventAssigned:@"U"];
//            [modloader loadEventList:[Common compid] offset:0 size:30];
            [self loadbadgecount];
        }

}

-(void)loadbadgecount{
//    EventModule *daoevent=[[EventModule alloc]init];
//    arryeventlist=[daoevent getEventCount];
    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arryeventlist count]];
    
    self.navigationItem.rightBarButtonItem.badgeValue = badgenumber;
}

- (IBAction)btnevent_Touch:(id)sender{
    [self performSegueWithIdentifier:@"shownews" sender:self];
}

-(void)displaycart:(NSNotification *)notice {
    
//    CompanyModule *daoComp = [[CompanyModule alloc]init];
//    TblCompany* tblComp = [daoComp getCompanyDetail:[Common compid]];
//    
//    CartModule *daoCart = [[CartModule alloc]init];
//    NSMutableArray* arrCartList = [daoCart getCartList:[Common staffid]];
//    double sumtot = 0;
//    for (TblCart *objres in arrCartList) {
//        sumtot += [[objres totalPrice] doubleValue];
//    }
//    
//    NSString* badgenumber = [NSString stringWithFormat:@"%lu", (unsigned long)[arrCartList count]];
    
//    if (![badgenumber isEqualToString:@"0"])
//        [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:badgenumber];
//    else
//        [[[[[self tabBarController] tabBar] items] objectAtIndex:3] setBadgeValue:nil];
//    
//    //[[[[[self tabBarController] tabBar] items] objectAtIndex:3] setTitle:[NSString stringWithFormat:@"%@ %@",[tblComp currency],[NSNumber numberWithDouble:sumtot]]];

    
}

@end
