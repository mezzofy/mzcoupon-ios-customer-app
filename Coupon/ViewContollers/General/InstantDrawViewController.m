//
//  InstantDrawViewController.m
//  ProWallet
//
//  Created by Inforios Technologies on 04/02/16.
//  Copyright © 2016 Thoughts Igniter. All rights reserved.
//

#import "InstantDrawViewController.h"
#import "Common.h"

#import "UIImageView+WebCache.h"
#import "PromoCommonTableCell.h"

@interface InstantDrawViewController ()

@end

@implementation InstantDrawViewController
@synthesize parent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       
        
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = NULL;
    
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//    DataDrawDetailResponse *res = [modpromo getInstantDrawDetails:[Common.PromoTag code]];
//    if(res != NULL){
//        
//        if (indexPath.row == 0) {
//            PromoCommonTableCell* cells = [tableView dequeueReusableCellWithIdentifier:@"imgcell" forIndexPath:indexPath];
//            
//            [cells.imgInstDraw  sd_setImageWithURL:[NSURL URLWithString:[res.result imagePath]] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
//            
//            cell = cells;
//            
//        }else if (indexPath.row == 1) {
//            PromoCommonTableCell* cellname = [tableView  dequeueReusableCellWithIdentifier:@"namecell" forIndexPath:indexPath];
//            [cellname.lblInstDrawName setText:[res.result name]];
//            [cellname.lblInstDrawMerchant setText:[res.result code]];
//            cell = cellname;
//            
//        }else if (indexPath.row == 2) {
//            PromoCommonTableCell* celldesc = [tableView dequeueReusableCellWithIdentifier:@"desccell" forIndexPath:indexPath];
//            
//             [celldesc.lblInstDrawMessage setText:[res.result description]];
//            cell = celldesc;
//            
//        }else if (indexPath.row == 3) {
//            PromoCommonTableCell* celldesc = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
//            
//            //[celldesc.lblLuckyDrawDescription setText:[res.result description]];
//            cell = celldesc;
//
//    }
//    }
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth= screenRect.size.width;
//    PromotionModule* modpromo = [[PromotionModule alloc]init];
//   DataDrawDetailResponse *res = [modpromo getInstantDrawDetails:[Common.PromoTag code]];
//    
//    if (indexPath.row==0) {
//        
//        return 400.0f;
//        
//    } else if (indexPath.row==1) {
//        
//        return 100;
//        
//    } else if (indexPath.row==2) {
//        //            trimmedString = [[res.result description] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        
//        //NSInteger output = trimmedString.length;
//        //CGSize maximumLabelSize = CGSizeMake;
//        
//        NSString *trimmedString2 = [[res.result description] stringByTrimmingCharactersInSet:
//                                    [NSCharacterSet whitespaceCharacterSet]];
//        CGSize maximumLabelSize2 = CGSizeMake(screenWidth-40, 9999);
//        CGRect textRect = [trimmedString2 boundingRectWithSize:maximumLabelSize2
//                                                       options:NSStringDrawingUsesLineFragmentOrigin
//                                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
//                                                       context:nil];
//        return textRect.size.height+20;
//        
//        
//        //            CGRect textRect;
//        //
//        //            textRect = [trimmedString boundingRectWithSize:(screenWidth-40, 9999)
//        //                                                   options:NSStringDrawingUsesLineFragmentOrigin
//        //                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}
//        //                                                   context:nil];
//        //            return height;
//        
//    }else if (indexPath.row==3) {
//        
//        return 44;
//    }
//    
    
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDownload_click:(id)sender {
//    [Common PromoAction:@"I"];
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

- (IBAction)btn_close:(id)sender {
//    [Common PromoAction:NULL];
    [self dismissViewControllerAnimated:FALSE completion:nil];
}
@end
