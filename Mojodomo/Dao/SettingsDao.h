//
//  SettingsDao.h
//  ProWallet
//
//  Created by Inforios on 26/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsDao : NSObject
- (void)setValue:(NSString *)pkey Value:(NSString *)pvalue;
- (NSString *)getValue:(NSString *)pkey;
- (void)UpdateSettings:(NSString *)pkey Value:(NSString *)pvalue;
@end
