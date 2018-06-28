//
//  TblGiftcouponModel.m
//  
//
//  Created by Vasanth Inforios on 13/12/17.
//

#import "TblGiftcouponModel.h"

@implementation TblGiftcouponModel
@synthesize sharecoupon;

+(Class)sharecoupon_class {
    return [TblGiftcouponData class];
}
@end
