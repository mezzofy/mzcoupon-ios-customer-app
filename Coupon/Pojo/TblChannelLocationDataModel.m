//
//  TblChannelLocationDataModel.m
//  Coupon
//
//  Created by Vasanth Inforios on 02/11/18.
//  Copyright © 2018 Thoughts Igniter. All rights reserved.
//

#import "TblChannelLocationDataModel.h"

@implementation TblChannelLocationDataModel
@synthesize location;
@synthesize coupongroups;
@synthesize coupons;

+(Class)location_class{
    return [TblChannelLocationData class];
}
+(Class)coupongroups_class{
    return [TblChannelPlayListData class];
}
+(Class)coupons_class{
    return [TblChannelPromotionData class];
}
@end
