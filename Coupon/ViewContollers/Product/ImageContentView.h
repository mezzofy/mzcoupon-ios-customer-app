//
//  ImageContentView.h
//  WalnetCouponWallet
//
//  Created by Inforios on 08/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageContentView : UIViewController<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (retain, nonatomic) IBOutlet UILabel *lbl_ImagesCount;
@property (retain, nonatomic) IBOutlet UIScrollView *scrllview;

- (IBAction)scaleImage:(UIPinchGestureRecognizer *)recognizer;
@property NSUInteger pageIndex;
@property NSString *imageFile;
@property NSString *imagecount;
- (IBAction)btn_back:(id)sender;

@end
