//
//  TblCampaignSearchModel.h
//  
//
//  Created by Vasanth Inforios on 13/12/17.
//

#import "Jastor.h"

#import "TblSite.h"
#import "TblCampaign.h"
@interface TblCampaignSearchModel : Jastor
@property (nonatomic, strong)NSMutableArray *sites;
@property (nonatomic, strong)NSMutableArray *groups;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, strong)NSString *latitude;
@property (nonatomic, strong)NSString *longitude;
@end
