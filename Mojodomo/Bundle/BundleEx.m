//
//  BundleEx.m
//  MzCouponWallet
//
//  Created by Kris on 21/8/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "BundleEx.h"

#import <objc/runtime.h>

static const char _bundle=0;

@interface BundleEx : NSBundle
@end

@implementation BundleEx
-(NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (Language)

+(NSBundle*) getLocalBundle{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle;
}

+(void)setLanguage:(NSString*)language
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      object_setClass([NSBundle mainBundle],[BundleEx class]);
                  });
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end