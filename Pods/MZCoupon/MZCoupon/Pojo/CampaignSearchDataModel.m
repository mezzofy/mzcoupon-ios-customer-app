//
//  CampaignSearchDataModel.m
//  
//
//  Created by Mezzofy on 13/12/17.
//

#import "CampaignSearchDataModel.h"

@implementation CampaignSearchDataModel
@synthesize page;
@synthesize sites;
@synthesize groups;
@synthesize latitude;
@synthesize longitude;

+(Class)sites_class{
    return [SiteData class];
}

+(Class)groups_class{
    return [CampaignData class];
}
@end
