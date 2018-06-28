//
//  CampaignSearchDataModel.h
//  
//
//  Created by Mezzofy on 13/12/17.
//

#import "MZJastor.h"

#import "SiteData.h"
#import "CampaignData.h"
@interface CampaignSearchDataModel : MZJastor
@property (nonatomic, strong)NSMutableArray *sites;
@property (nonatomic, strong)NSMutableArray *groups;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, strong)NSString *latitude;
@property (nonatomic, strong)NSString *longitude;
@end
