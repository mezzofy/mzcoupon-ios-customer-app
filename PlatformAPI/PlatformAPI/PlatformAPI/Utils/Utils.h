//
//  Utils.h
//  hht
//
//  Created by Kaliyarajalu on 07/08/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AFNetworking/AFURLRequestSerialization.h>
#import "Common.h"


@interface Utils : NSObject

+ (NSString*) dbpath;
+ (void) dbpath:(NSString *)path;

+ (NSString*) initialpath;
+ (void) initialpath:(NSString *)path;

+ (NSString*) pathsetting;
+ (NSString*) pathsettingforreg;


+ (NSData *)encodegetURLdata:(NSString *)str;

+ (NSString *)makeImagePath:(NSString *)imagename;

+ (NSString *)currencyFormat:(NSNumber *)value Currency:(NSString*)pcurr;
+ (NSString *)getFormatedDate:(NSString*)str SrcFormat:(NSString*)psrcformat DstFormat:(NSString*)pdstformat;

+ (NSString *)getCurrentDate:(NSString *)fmt;
+ (NSString *)formatDate:(NSDate *)pdate Format:(NSString *)fmt;

//+ (NSString*)serverpath;

+(NSString *)generateUUID;

+(MKCoordinateRegion) getRegionByMiles:(double)miles Location:(CLLocationCoordinate2D)newLocation;


+ (NSData *)urlGetRequest:(NSString *)purl param:(NSMutableDictionary*)pparam;
+ (NSData *)urlPostRequest:(NSString *)purl body:(NSData*)pbody;
+(NSData *)urlPutRequest:(NSString *)purl body:(NSData*)pbody;
+ (NSString *)NetworkConnection;
+ (NSData *)urlRegGetRequest:(NSString *)purl param:(NSMutableDictionary*)pparam;
@end
