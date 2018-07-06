//
//  TblWalletData.h
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "Jastor.h"

@interface TblWalletData : Jastor
@property (nonatomic, strong) NSString *walletId;
@property (nonatomic, strong) NSString *customerId;
@property (nonatomic, strong) NSString *walletCredit;
@property (nonatomic, strong) NSString *qrCode;
@property (nonatomic, strong) NSString *qrTime;
@property (nonatomic, strong) NSString *rewardPoint;
@property (nonatomic, strong) NSString *updatedOn;
@end
