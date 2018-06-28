//
//  ImageViewController.h
//  WalnetCouponWallet
//
//  Created by Inforios on 08/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageContentView.h"

@interface ImageViewController : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *arrPhotos;
@property NSUInteger scrolpage;

@end
