//
//  LuckyDrawViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "LuckyDrawViewController.h"
#import "Common.h"
#import "UIImageView+WebCache.h"
#import "PromoCommonTableCell.h"

@interface LuckyDrawViewController (){
NSString *trimmedString;
double height;
}
@end

@implementation LuckyDrawViewController
@synthesize parent,tbl_luckydraw;

- (void)viewDidLoad {
    [super viewDidLoad];
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataDrawDetailResponse *res = [modpromo getLuckyDrawDetails:[Common.PromoTag code]];
//    if(res != NULL){
//        [self.lblLuckyDrawName setText:[res.result name]];
//        [self.lblLuckyDrawCode setText:[res.result code]];
//        [self.lblLuckyDrawDescription setText:[res.result description]];
//              
//        [self.imgLuckyDraw  sd_setImageWithURL:[NSURL URLWithString:[res.result imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
//
//    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataDrawDetailResponse *res = [modpromo getLuckyDrawDetails:[Common.PromoTag code]];
//    if(res != NULL){
//        
//        if (indexPath.row == 0) {
//            PromoCommonTableCell* cells = [tableView dequeueReusableCellWithIdentifier:@"Imgcell" forIndexPath:indexPath];
//            
//            [cells.imgLuckyDraw  sd_setImageWithURL:[NSURL URLWithString:[res.result imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
//            
//            cell = cells;
//            
//        }else if (indexPath.row == 1) {
//            PromoCommonTableCell* cellname = [tableView  dequeueReusableCellWithIdentifier:@"Namecell" forIndexPath:indexPath];
//            [cellname.lblLuckyDrawName setText:[res.result name]];
//            [cellname.lblLuckyDrawCode setText:[res.result code]];
//            cell = cellname;
//            
//        }else if (indexPath.row == 2) {
//            PromoCommonTableCell* celldesc = [tableView dequeueReusableCellWithIdentifier:@"Desccell" forIndexPath:indexPath];
//           
//            [celldesc.lblLuckyDrawDescription setText:[res.result description]];
//            cell = celldesc;
//            
//        }
//    }
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth= screenRect.size.width;
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataDrawDetailResponse *res = [modpromo getLuckyDrawDetails:[Common.PromoTag code]];
//    
//        if (indexPath.row==0) {
//            
//            return 400.0f;
//            
//        } else if (indexPath.row==1) {
//            
//             return 100;
//            
//        } else if (indexPath.row==2) {
////            trimmedString = [[res.result description] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//            
//            //NSInteger output = trimmedString.length;
//            //CGSize maximumLabelSize = CGSizeMake;
//            
//            NSString *trimmedString2 = [[res.result description] stringByTrimmingCharactersInSet:
//                                        [NSCharacterSet whitespaceCharacterSet]];
//            CGSize maximumLabelSize2 = CGSizeMake(screenWidth-40, 9999);
//           CGRect textRect = [trimmedString2 boundingRectWithSize:maximumLabelSize2
//                                                    options:NSStringDrawingUsesLineFragmentOrigin
//                                                 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
//                                                    context:nil];
//            return textRect.size.height+20;
//            
//            
////            CGRect textRect;
////            
////            textRect = [trimmedString boundingRectWithSize:(screenWidth-40, 9999)
////                                                   options:NSStringDrawingUsesLineFragmentOrigin
////                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
////                                                   context:nil];
////            return height;
//            
//        }
//        
    
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLuckydraw_click:(id)sender {
//    [Common PromoAction:@"L"];
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

- (IBAction)btn_close:(id)sender {
    [self dismissViewControllerAnimated:FALSE completion:nil];
}
@end
