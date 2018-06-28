//
//  WalletModule.h
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblWalletData.h"
#import <MZCoupon/MZCoupon.h>

@interface WalletModule : NSObject
//WalletBalance
- (void)getWalletFromServer;

//Wallet QRCODE
- (WalletData *)getWalletQRCODERequestFromServer;

//DataBase
-(TblWalletData *)getwallet;
@end
