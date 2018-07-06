//
//  TblOrderTrackModel.m
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "TblOrderTrackModel.h"

@implementation TblOrderTrackModel
@synthesize ordertrack;

+ (Class)ordertrack_class {
    return [TblOrderTrackData class];
}
@end
