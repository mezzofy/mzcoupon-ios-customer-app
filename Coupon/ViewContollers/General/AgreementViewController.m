//
//  AgreementViewController.m
//  SuPerk
//
//  Created by Eric Pang on 13/3/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "AgreementViewController.h"
#import "Utils.h"

@interface AgreementViewController ()
@end

@implementation AgreementViewController
@synthesize webViewAgreement;

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSString *urlString =  [NSString stringWithFormat:@"%@/welcome", [Utils serverpath]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
//    [webViewAgreement loadRequest:urlRequest];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create the data model
    _pageTitles = @[@"1", @"2"];
    _pageImages = @[@"tutorial-01.png", @"tutorial-02.png"];
    
    // Create page view controller
    self.pageViewTController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewTController"];
    self.pageViewTController.dataSource = self;
    
    PageContentViewTController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewTController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewTController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-15);

    [self addChildViewController:_pageViewTController];
    [self.view addSubview:_pageViewTController.view];
    [self.pageViewTController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkthrough:(id)sender {
    PageContentViewTController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewTController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewTController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewTController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewTController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
 
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewTController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewTController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewTController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewTController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewTController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewTController
{
    return 0;
}

- (IBAction)btnClickAgree:(id)sender {
//    [CommonModule Agreement:@"Y"];
    [self dismissViewControllerAnimated:FALSE completion:nil];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *sbFile = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbFile bundle:bundle];
    UIViewController  *vc=[storyboard instantiateViewControllerWithIdentifier:@"vcappstart"];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:vc];
}

@end

