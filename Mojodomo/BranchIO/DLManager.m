//
//  DLManager.m
//  Qikonnect
//
//  Created by Inforios Technologies on 07/10/15.
//  Copyright © 2015 Inforios Technologies. All rights reserved.
//

#import "DLManager.h"

@implementation DLManager

static DLManager * sharedInstance = nil;

+ (DLManager *)sharedInstance
{
    // Singleton
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[DLManager alloc] init];
        }
    }

    return sharedInstance;
}

- (UINavigationController *) discoverRootNavController
{
    
    if (![DLManager sharedInstance].rootNavController) {
        
        /*
         * We pop to the top of the corresponding
         */
        id rootClass = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        if ([[rootClass class] isSubclassOfClass:[UINavigationController class]]) {
            
            // The top is a navigationController
            [DLManager sharedInstance].rootNavController = rootClass;
            
        } else if ([[rootClass class] isSubclassOfClass:[UITabBarController class]]) {
            
            // The top is a uitabbarController
            UITabBarController * tabController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            tabController.selectedIndex = 0;
            UINavigationController * navCon = (UINavigationController*)tabController.selectedViewController;
            [DLManager sharedInstance].rootNavController = navCon;
            
        } else {
            // by default, use modal windows
            NSLog(@"Not navigation controller found with this name: %@",[rootClass class]);
        }
        
        [[DLManager sharedInstance].rootNavController popToRootViewControllerAnimated:YES];
        
    }

    return [DLManager sharedInstance].rootNavController;
}

+ (void) setNavigationController :(UINavigationController *)navController
{
    
    [DLManager sharedInstance].rootNavController = navController;
}

+ (UIStoryboard *) storyboard
{
    
    if (![DLManager sharedInstance].storyboard) {

        NSLog(@"Storyboard not set");
        // throw exception
        
    }
    
    return [DLManager sharedInstance].storyboard;
}

+ (void) setStoryboard  :(UIStoryboard *)sboard
{
    [DLManager sharedInstance].storyboard = sboard;
}

- (NSDictionary *)parseQueryString:(NSString *)query {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6] ;
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    if ([[pairs objectAtIndex:0] isEqualToString:@""])
        return nil;
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

+ (void) proceed :(id)sender
{
    // TODO: If we can't find a navController, automatically use Modal
    if (![[DLManager sharedInstance] rootNavController]) {
        [[DLManager sharedInstance] setRootNavController:[[DLManager sharedInstance] discoverRootNavController]];
    }
    
    [[[DLManager sharedInstance] rootNavController] pushViewController:[DLManager sharedInstance].viewToPresent animated:YES];
    
    NSLog(@"View is presented");
}

+ (void) process :(NSURL *)url
{
    NSLog(@"Looking for StoryboardID: %@",[url host]);
    
    NSDictionary * params = [[DLManager sharedInstance] parseQueryString:[url query]];
    
    if ([url host]) {
        
        [DLManager sharedInstance].viewToPresent = [[[DLManager sharedInstance] storyboard] instantiateViewControllerWithIdentifier:[url host]];
        
        if (![DLManager sharedInstance].viewToPresent) {
            NSLog(@"No ViewController with that StoryboardID");
        }
        
        if ([[DLManager sharedInstance].viewToPresent respondsToSelector:@selector(viewPreload:)]) {
            @try {
                [[DLManager sharedInstance].viewToPresent viewPreload:params];
            }
            @catch (NSException *exception) {
                NSLog(@"Exception preloading %@: %@", [[DLManager sharedInstance].viewToPresent class],[exception description]);
            }
        } else {
            [DLManager proceed:nil];
        };
    }
}

@end
