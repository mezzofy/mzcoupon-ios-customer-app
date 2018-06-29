//
//  MZWallet.h
//  ProWallet
//
//  Created by Inforios on 24/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZWalletResponse.h"

@interface MZWallet : NSObject
//WalletBalance
- (MZWalletResponse *)GetCustomerWallet:(NSString *)CustomerID;

//Wallet QRCODE
- (MZWalletResponse *)GetCustomerWalletQR:(NSString *)CustomerID;



@end
