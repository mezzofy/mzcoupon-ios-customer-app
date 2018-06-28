//
//  WalletData.h
//  Mezzofy
//
//  Created by Mezzofy on 24/08/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface WalletData : MZJastor
@property (nonatomic, strong) NSString *walletId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *walletCredit;
@property (nonatomic, strong) NSString *qrCode;
@property (nonatomic, strong) NSString *qrTime;
@property (nonatomic, strong) NSString *rewardPoint;
@property (nonatomic, strong) NSString *updatedOn;
@end
