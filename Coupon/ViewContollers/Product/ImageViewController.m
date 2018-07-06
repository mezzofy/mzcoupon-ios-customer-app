//
//  ImageViewController.m
//  WalnetCouponWallet
//
//  Created by Inforios on 08/10/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "ImageViewController.h"
#import "TblCampaignImage.h"


@interface ImageViewController (){

    NSArray *_pageImages;
}

@end

@implementation ImageViewController
@synthesize arrPhotos;


- (void)viewDidLoad {
    [super viewDidLoad];
    _pageImages = arrPhotos;
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    ImageContentView *startingViewController = [self viewControllerAtIndex:self.scrolpage];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.pageViewController.view.backgroundColor=[UIColor blackColor];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}


- (ImageContentView *)viewControllerAtIndex:(NSUInteger)index
{

    if (([_pageImages count] == 0) || (index >= [_pageImages count])) {
        return nil;
    }
   
    // Create a new view controller and pass suitable data.
    ImageContentView *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    TblCampaignImage *tblimage=_pageImages[index];
    pageContentViewController.imageFile = [tblimage campaignImage];
    pageContentViewController.imagecount =[NSString stringWithFormat:@"%lu/%lu",(unsigned long)index+1,(unsigned long)[_pageImages count]];
   
    pageContentViewController.pageIndex = index;
    
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ImageContentView*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ImageContentView*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [_pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
