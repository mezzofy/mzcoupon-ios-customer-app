//
//  BundleEx.h
//  MzCouponWallet
//
//  Created by Kris on 21/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Language)
+(void)setLanguage:(NSString*)language;
+(NSBundle*) getLocalBundle;
@end