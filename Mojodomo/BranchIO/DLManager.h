//
//  DLManager.h
//
//  Created by Lucas Lain on 4/25/14.
//

#import <UIKit/UIKit.h>
#import "DLProtocol.h"

@interface DLManager : NSObject

@property (weak)   UINavigationController           * rootNavController;
@property (weak)   UIStoryboard                     * storyboard;
@property (strong) UIViewController<DLProtocol>     * viewToPresent;

+ (void)        proceed                   :(id)sender;
+ (void)        process                   :(NSURL *)url;
+ (void)        setStoryboard             :(UIStoryboard *)sboard;
+ (void)        setNavigationController   :(UINavigationController *)navController;

+ (DLManager *) sharedInstance;

@end
