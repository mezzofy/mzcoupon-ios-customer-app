# MZCoupon iOS Library

![](http://www.mezzofy.com/images/logoz.png)
#### Installation with CocoaPods
CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](https://cocoapods.org) section for more details.

#### Installation Guide for MZCoupon
######You want to add pod 'MZCoupon', '~> 1.0' similar to the following to your Podfile:

target 'MyApp' do
pod 'MZCoupon', '~> 1.0'
end
Then run a pod install inside your terminal, or from CocoaPods.app.

######Alternatively to give it a test run, run the command:

pod try MZCoupon
## Initialize MZCoupon
#import "AppDelegate.h"
#import <MZCoupon/MZCoupon.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

[MZCouponConfig SetupMerchantID:@"COM_CODE" Server:FALSE AccessToken:@"XXXXX" AccessKey:@"x"];

return YES;

***Hints:*** 
*1.Where "COM_CODE" companycode, AccessToken ("XXXXX") and AccessKey ("x") provide by the Merchant*
*2.Where Server set False while you Test and For Production Set as True*
*3.After Login Or Register  you set Customer_ID in MZCouponConfig *
```objc
[MZCouponConfig SetupCustomerID:@"CUSTOMER_ID"];
```

##### How to get Company Code & AccessToken
Login to Merchant Account 

![](https://s3-ap-southeast-1.amazonaws.com/mzcouponuat/email/merchant_profile.jpg)


#### Import headers in your source files
In the source files where you need to use the library, import the header file:
#import "ViewController.h"
#import <MZCoupon/MZCoupon.h>

### Implementation Guide

** Call Function For Campaign** 
``` objc
MZCampaign *objmezzofy=[[MZCampaign alloc]init];
MZCampaignResponse *objres=[[MZCampaignResponse alloc]init];
objres=[objmezzofy getCampaigns:poffset Latitude:platitute Longitude:plongitude];
```
** Return **
MZCampaignResponse

** Call Function For Coupon ** 
``` objc
MZCouponModule *objcoupon=[[MZCouponModule alloc]init];
MZCouponResponse *objcouponresponse=[[MZCouponResponse alloc]init];
objcouponresponse=[objcoupon getCoupons:pcouponstatus Offset:poffset];
```
** Return **
MZCouponResponse

##### Click here for [Full Implementation Guide](https://github.com/mezzofy/mzcoupon-ios-customer-lib/blob/master/Implementation_Guide.md)
# Licenses
All source code is licensed under the [MIT License.](https://raw.githubusercontent.com/mezzofy/mzcoupon-ios-customer-lib/master/LICENSE)
###End
