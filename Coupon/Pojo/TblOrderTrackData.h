//
//  TblOrderTrackData.h
//  ProWallet
//
//  Created by Inforios on 06/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblOrderTrackData : Jastor
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *trackStatus;
@property (nonatomic, strong) NSString *trackSeq;
@property (nonatomic, strong) NSString *notificationMsg;
@property (nonatomic, strong) NSString *notificationStatus;
@property (nonatomic, strong) NSString *updatedOn;
@end
