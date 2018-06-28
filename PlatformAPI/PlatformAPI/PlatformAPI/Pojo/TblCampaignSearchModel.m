//
//  TblCampaignSearchModel.m
//  
//
//  Created by Vasanth Inforios on 13/12/17.
//

#import "TblCampaignSearchModel.h"

@implementation TblCampaignSearchModel
@synthesize page;
@synthesize sites;
@synthesize groups;
@synthesize latitude;
@synthesize longitude;

+(Class)sites_class{
    return [TblSite class];
}

+(Class)groups_class{
    return [TblCampaign class];
}
@end
