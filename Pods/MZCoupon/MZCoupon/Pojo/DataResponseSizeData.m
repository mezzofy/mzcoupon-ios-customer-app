//
//  DataResponseSizeData.m
//  Mezzofy
//
//  Created by Mezzofy on 10/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "DataResponseSizeData.h"
#import "DataReaponseDataModel.h"
@implementation DataResponseSizeData
@synthesize size;
+ (Class)size_class {
    return [DataReaponseDataModel class];
}
@end
