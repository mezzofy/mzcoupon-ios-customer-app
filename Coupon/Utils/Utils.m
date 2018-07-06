//
//  Utils.m
//  hht
//
//  Created by Vasanth on 07/08/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import "Utils.h"
#import "Reachability.h"

#define BASIC_SECRET @"x"
#define BASIC_KEY @"NPNN10"


static NSString *_dbpath;
static NSString *_initpath;
static NSString *_logindbpath;
static BOOL iSLocal=FALSE;
static BOOL iSUAT=TRUE;

@implementation Utils


+ (NSString*)dbpath {
    return _dbpath;
}

+ (void)dbpath:(NSString *)path {
    _dbpath = path;
}


+ (NSString*) initialpath {
    return _initpath;
}

+ (void) initialpath:(NSString *)path {
    _initpath = path;
}
+ (NSString*) pathsettingforreg {
    
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:[Utils initialpath]];
    NSString *urlPath = [savedStock objectForKey:@"SettingsPath"];
    if(iSLocal)
        urlPath = [NSString stringWithFormat:@"http://platformuat.dev.com:8080/platformuat/"];
    else if (iSUAT)
        urlPath = [NSString stringWithFormat:@"http://platform.uat.mezzofy.com/"];
    else
        urlPath = [NSString stringWithFormat:@"http://platform.mezzofy.com/"];
    
    return urlPath;
}
+ (NSString*) pathsetting {
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:[Utils initialpath]];
    NSString *urlPath = [savedStock objectForKey:@"SettingsPath"];
    
    if(iSLocal)
        urlPath = [NSString stringWithFormat:@"http://%@.dev.com:8080/platformuat/",[Common merchantid]];
    else if (iSUAT)
        urlPath = [NSString stringWithFormat:@"http://%@.uat.mezzofy.com/",[Common merchantid]];
    else
        urlPath = [NSString stringWithFormat:@"http://%@.mezzofy.com/",[Common merchantid]];

    return urlPath;
}
+ (NSData *)encodegetURLdata:(NSString *)str {
    long ti = NSDate.date.timeIntervalSince1970;
    NSString* sessionstr = str;
    
    if ([str rangeOfString:@"?"].location == NSNotFound)
        sessionstr = [str stringByAppendingString:[NSString stringWithFormat:@"?session=%ld",ti]];
    else
        sessionstr = [str stringByAppendingString:[NSString stringWithFormat:@"&session=%ld",ti]];
    
    
    NSString *strEncode =[sessionstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *strURL =[NSURL URLWithString:strEncode];
    NSData *data =[NSData dataWithContentsOfURL:strURL options:NSDataReadingUncached error:nil];
    
    return data;
}

+ (NSString *)makeImagePath:(NSString *)imagename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath=[NSString stringWithFormat:@"%@/%@",documentsDir,imagename];
    return filePath;
}

+ (NSNumber*) currencyFormatToDouble:(NSString *)value
{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    NSNumber *retval = [formatter numberFromString:value];
    return retval;
}

+ (NSString *)currencyFormat:(NSNumber *)value Currency:(NSString*)pcurr
{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    [formatter setCurrencyCode:pcurr];
    NSString *strval =[formatter stringFromNumber:value];
    return strval;
}

+ (NSString *)getFormatedDate:(NSString*)str SrcFormat:(NSString*)psrcformat DstFormat:(NSString*)pdstformat{
    
    // convert to date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat setDateFormat:psrcformat] ; // ]@"YYYY-MM-dd'T'HH:mm:ss'+11:00'"];
    NSDate *dte = [dateFormat dateFromString:str];
    
    // back to string
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc] init];
    [dateFormat2 setDateFormat:pdstformat]; //@"YYYY-MM-dd'T'HH:mm:ssZZZ"];
    NSString *dateString = [dateFormat2 stringFromDate:dte];
    
    return dateString;
}

+ (NSString *)getCurrentDate:(NSString *)fmt {
    
    NSString *retval = NULL;
    // Get Date
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    dateFormatter.dateFormat = fmt; //@"yyyy-MM-dd";
    
    retval = [dateFormatter stringFromDate: localDate];
    return retval;
}

+ (NSString *)formatDate:(NSDate *)pdate Format:(NSString *)fmt {
    
    NSString *retval = NULL;
    // Get Date
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    dateFormatter.dateFormat = fmt; //@"yyyy-MM-dd";
    
    retval = [dateFormatter stringFromDate: pdate];
    return retval;
}

+(NSString *)generateUUID {
    NSString *UUID = [[NSUUID UUID] UUIDString];
    return UUID;
}

+(MKCoordinateRegion) getRegionByMiles:(double)miles Location:(CLLocationCoordinate2D)newLocation{
    
    double scalingFactor = ABS( (cos(2 * M_PI * newLocation.latitude / 360.0) ));
    
    MKCoordinateSpan span;
    
    span.latitudeDelta = miles/69.0;
    span.longitudeDelta = miles/(scalingFactor * 69.0);
    
    MKCoordinateRegion region;
    region.span = span;
    region.center = newLocation;
    
    return region;
}


+ (NSString *)NetworkConnection {
    
    NSString *retval = NULL;
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if(status == NotReachable) {
        retval = @"No Internet"; //No internet
    }
    else if (status == ReachableViaWiFi) {
        retval = @"WiFi";  //WiFi
    }
    else if (status == ReachableViaWWAN) {
        retval = @"3G";    //3G
        
    }
    return retval;
}


@end
