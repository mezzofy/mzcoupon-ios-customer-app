//
//  LuckyDrawTableViewController.m
//  ProWallet
//
//  Created by Kris on 2/15/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "LuckyDrawTableViewController.h"
#import "Common.h"
#import "LuckyDrawTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface LuckyDrawTableViewController (){
    NSArray* drawlist;
    UIImageView* bgView;
}

@end

@implementation LuckyDrawTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataLuckyDrawListResponse* res = [modpromo getLuckyDrawListByUserId:[Common.currentUser customer_id]];
//    
//    drawlist = [[NSArray alloc]init];
//    if(res != NULL && [res.response.response_code isEqualToString:@"0"]){
//        drawlist = res.result;
//    }
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if([drawlist count] > 0){
        return [drawlist count]-1;
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


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [drawlist count]-1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LuckyDrawTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"luckydrawcell" forIndexPath:indexPath];
    
//    DataLuckyDraw* draw = [drawlist objectAtIndex:[indexPath row]+1];
//    
//    [cell.lblname setText:[draw.luckydraw name]];
//    [cell.lbldescription setText:[draw.luckydraw description]];
//    [cell.lblsno setText:[draw.member sno]];
//    [cell.img  sd_setImageWithURL:[NSURL URLWithString:[draw.luckydraw imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];

    return cell;
}

- (IBAction)btnBack_Touch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
