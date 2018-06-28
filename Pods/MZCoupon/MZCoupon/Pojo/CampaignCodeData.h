//
//  CampaignCodeData.h
//  Mezzofy
//
//  Created by Mezzofy on 01/01/17.
//  Copyright © 2018 Mezzofy. All Rights Reserved.
//

#import "MZJastor.h"

@interface CampaignCodeData : MZJastor

@property (nonatomic, copy) NSString* campaignCode;
@property (nonatomic, copy) NSString* leftcoupon;
@property (nonatomic, copy) NSString* soldcoupon;

@end
