//
//  ImageContentView.m
//  WalnetCouponWallet
//
//  Created by Inforios on 08/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "ImageContentView.h"
#import "UIImageView+WebCache.h"

#define MINIMUM_SCALE 0.5
#define MAXIMUM_SCALE 6.0

@interface ImageContentView ()

@property CGPoint translation;
@end

@implementation ImageContentView
@synthesize backgroundImageView;
@synthesize lbl_ImagesCount;
@synthesize scrllview;


- (void)viewDidLoad {
    [super viewDidLoad];
    [backgroundImageView sd_setImageWithURL:[NSURL URLWithString:self.imageFile] placeholderImage:[UIImage imageNamed:@"downloadx.png"] options:SDWebImageProgressiveDownload];
    lbl_ImagesCount.text=self.imagecount;
    scrllview.delegate = self;

}
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return backgroundImageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)scaleImage:(UIPinchGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateEnded) {
        if ([recognizer scale]<1.0f) {
            [recognizer setScale:1.0f];
        }
       
        CGAffineTransform transform = CGAffineTransformMakeScale([recognizer scale],  [recognizer scale]);
        backgroundImageView.transform = transform;
    }
//        recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
//    recognizer.scale = 1;
//    
}
- (IBAction)btn_back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
