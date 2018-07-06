//
//  LoaderViewController.h
//  EB
//
//  Created by Kaliyarajalu on 27/11/14.
//  Copyright (c) 2014 Kaliyarajalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderViewController : UIViewController<UITabBarDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Activity;

@end
