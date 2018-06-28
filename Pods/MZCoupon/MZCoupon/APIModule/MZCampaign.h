//
//  MZCampaign.h
//  ProWallet
//
//  Created by Inforios on 27/07/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZUtils.h"
#import "MZCampaignResponse.h"
#import "MZCampaignDetailResponse.h"
#import "MZCampaignGroupResponse.h"
#import "CampaignGroupsData.h"
#import "CampaignCodeData.h"
#import "CampaignSiteListDataModel.h"

@interface MZCampaign : NSObject
//Product List->Campaign List
- (MZCampaignResponse *)getCampaigns:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude;

//Product Detail From Server
- (MZCampaignDetailResponse *)getCampaignById:(NSString *)pcampaignId Latitude:(double)platitute Longitude:(double)plongitude;

//Top ten Product List->Campaign List
- (MZCampaignResponse *)getCampaignsTop;

//campaign Group
- (MZCampaignGroupResponse *)getCampaignGroups:(double)platitute Longitude:(double)plongitude;

//Product List->Campaign List with filter
- (MZCampaignResponse *)getCampaignsWithFilter:(NSInteger )poffset Latitude:(double)platitute Longitude:(double)plongitude Filtersite:(NSMutableArray *)pfiltersite FilterCampaignGroup:(NSMutableArray *)pfiltercampaigngroup;




@end
