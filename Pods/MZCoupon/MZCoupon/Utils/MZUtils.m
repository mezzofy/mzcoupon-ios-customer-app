//
//  MZUtils.m
//  Mezzofy
//
//  Created by Mezzofy on 07/08/14.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZUtils.h"


//#define BASIC_KEY @"3TN1FZ"
//#define BASIC_SECRET @"x"
//#define BASIC_KEY @"NPNN10"
//#define BASIC_KEY @"YT0KZO"

static NSString *_dbpath;
static NSString *_initpath;
static NSString *_logindbpath;
static BOOL iSLocal=FALSE;
//static BOOL iSLocal=TRUE;


//static BOOL iSUAT=FALSE;
@implementation MZUtils


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
    
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:[MZUtils initialpath]];
    NSString *urlPath = [savedStock objectForKey:@"SettingsPath"];
    if(iSLocal)
        urlPath = [NSString stringWithFormat:@"http://platformuat.dev.com:8080/platformuat/"];
    else if ([MZCouponConfig Server])
        urlPath = [NSString stringWithFormat:@"http://platform.mezzofy.com/"];
    else
         urlPath = [NSString stringWithFormat:@"http://platform.uat.mezzofy.com/"];
    
    return urlPath;
}
+ (NSString*) pathsetting {
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:[MZUtils initialpath]];
    NSString *urlPath = [savedStock objectForKey:@"SettingsPath"];
    
    if(iSLocal)
        urlPath = [NSString stringWithFormat:@"http://%@.dev.com:8080/platformuat/",[MZCouponConfig merchantid]];
    else if ([MZCouponConfig Server])
        urlPath = [NSString stringWithFormat:@"http://%@.mezzofy.com/",[MZCouponConfig merchantid]];
    else
        urlPath = [NSString stringWithFormat:@"http://%@.uat.mezzofy.com/",[MZCouponConfig merchantid]];

    return urlPath;
}
+ (NSData *)encodegetURLdata:(NSString *)str {
    long ti = NSDate.date.timeIntervalSince1970;
    NSString* sessionstr = str;
    
    if ([str rangeOfString:@"?"].location == NSNotFound)
        sessionstr = [str stringByAppendingString:[NSString stringWithFormat:@"?session=%ld",ti]];
    else
        sessionstr = [str stringByAppendingString:[NSString stringWithFormat:@"&session=%ld",ti]];

     NSString *strEncode = [sessionstr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
+ (NSData *)urlGetRequest:(NSString *)purl param:(NSMutableDictionary*)pparam {
    NSURL *baseURL = [NSURL URLWithString:[MZUtils pathsetting]];
    NSLog(@"%@", baseURL);
    
    __block NSData *retdata = NULL;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSData *plainData = [[NSString stringWithFormat:@"%@:%@", [MZCouponConfig AccessToken],[MZCouponConfig AccessKey]] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedUsernameAndPassword = [plainData base64EncodedStringWithOptions:0];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     NSString *request =[NSString stringWithFormat:@"%@%@",baseURL,purl];
    if(pparam == NULL)
        pparam = [[NSMutableDictionary alloc]init];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:request parameters:pparam error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req addValue:[NSString stringWithFormat:@"Basic %@", encodedUsernameAndPassword] forHTTPHeaderField:@"Authorization"];
    
    [[manager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, NSData* _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            retdata = responseObject;
            dispatch_semaphore_signal(semaphore);
            
        } else {
            retdata = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            dispatch_semaphore_signal(semaphore);
        }
    }]resume];
    
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    
    return retdata;
}


+ (NSData *)urlPostRequest:(NSString *)purl body:(NSData*)pbody {
    
    NSURL *baseURL = [NSURL URLWithString:[MZUtils pathsetting]];
    NSLog(@"%@", baseURL);
    
    __block NSData *retdata = NULL;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSData *plainData = [[NSString stringWithFormat:@"%@:%@", [MZCouponConfig AccessToken],[MZCouponConfig AccessKey]] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedUsernameAndPassword = [plainData base64EncodedStringWithOptions:0];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     NSString *request =[NSString stringWithFormat:@"%@%@",baseURL,purl];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:request parameters:nil error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req addValue:[NSString stringWithFormat:@"Basic %@", encodedUsernameAndPassword] forHTTPHeaderField:@"Authorization"];
    [req setHTTPBody:pbody];
    
    [[manager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, NSData* _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            retdata = responseObject;
            dispatch_semaphore_signal(semaphore);
        } else {
            retdata = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            dispatch_semaphore_signal(semaphore);
        }
    }]resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return retdata;
}
+ (NSData *)urlPutRequest:(NSString *)purl body:(NSData*)pbody {
    
    NSURL *baseURL = [NSURL URLWithString:[MZUtils pathsetting]];
    NSLog(@"%@", baseURL);
    
    __block NSData *retdata = NULL;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSData *plainData = [[NSString stringWithFormat:@"%@:%@", [MZCouponConfig AccessToken],[MZCouponConfig AccessKey]] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedUsernameAndPassword = [plainData base64EncodedStringWithOptions:0];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     NSString *request =[NSString stringWithFormat:@"%@%@",baseURL,purl];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"PUT" URLString:request parameters:nil error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req addValue:[NSString stringWithFormat:@"Basic %@", encodedUsernameAndPassword] forHTTPHeaderField:@"Authorization"];
    [req setHTTPBody:pbody];
    
    [[manager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, NSData* _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            retdata = responseObject;
            dispatch_semaphore_signal(semaphore);
            
        } else {
            retdata = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            
            dispatch_semaphore_signal(semaphore);
        }
    }]resume];
    
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    
    return retdata;
}


+ (NSString *)NetworkConnection {
    
    NSString *retval = NULL;
  //  Reachability *reachability = [Reachability //reachabilityForInternetConnection];
   // NetworkStatus status = [reachability currentReachabilityStatus];
    //if(status == NotReachable) {
  //      retval = @"No Internet"; //No internet
 //   }
 //   else if (status == ReachableViaWiFi) {
  //      retval = @"WiFi";  //WiFi
  //  }
//else if (status == ReachableViaWWAN) {
  //      retval = @"3G";    //3G
        
    //}
    return retval;
}
//Platform API For Country List
+ (NSData *)urlRegGetRequest:(NSString *)purl param:(NSMutableDictionary*)pparam {
    NSURL *baseURL = [NSURL URLWithString:[MZUtils pathsettingforreg]];
    NSLog(@"%@", baseURL);
    
    __block NSData *retdata = NULL;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSData *plainData = [[NSString stringWithFormat:@"%@:%@", @"By3I7fX",@"x"] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedUsernameAndPassword = [plainData base64EncodedStringWithOptions:0];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSString *request =[NSString stringWithFormat:@"%@%@",baseURL,purl];
    if(pparam == NULL)
        pparam = [[NSMutableDictionary alloc]init];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:request parameters:pparam error:nil];
    
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req addValue:[NSString stringWithFormat:@"Basic %@", encodedUsernameAndPassword] forHTTPHeaderField:@"Authorization"];
    
    [[manager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, NSData* _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            retdata = responseObject;
            dispatch_semaphore_signal(semaphore);
            
        } else {
            retdata = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            dispatch_semaphore_signal(semaphore);
        }
    }]resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return retdata;
}


@end
