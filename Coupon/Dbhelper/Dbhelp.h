//
//  Dbhelp.h
//  hht
//
//  Created by Kaliyarajalu on 07/08/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface Dbhelp : NSObject

- (BOOL)CreateDataBase;
- (void)DeleteTables;

@end
