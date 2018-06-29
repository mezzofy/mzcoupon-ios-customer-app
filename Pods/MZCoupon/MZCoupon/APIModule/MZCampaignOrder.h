//
//  MZCampaignOrder.h
//  ProWallet
//
//  Created by Inforios on 08/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZCampaignProductOrderListResponse.h"

@interface MZCampaignOrder : NSObject
//Orders
- (MZCampaignProductOrderListResponse *)GetOrders:(NSString *)CustomerID Offset:(NSInteger )pOffset;

@end
