//
//  WalletTxnData.h
//  Mezzofy
//
//  Created by Mezzofy on 15/09/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"

@interface WalletTxnData : MZJastor

@property (strong, nonatomic)NSString *transactionReference;
@property (strong, nonatomic)NSString *userId;
@property (strong, nonatomic)NSString *merchantId;
@property (strong, nonatomic)NSString *siteId;
@property (strong, nonatomic)NSString *customerId;
@property (strong, nonatomic)NSString *walletId;
@property (strong, nonatomic)NSString *transactionType;
@property (strong, nonatomic)NSString *transactionAmount;
@property (strong, nonatomic)NSString *transactionPayRef;
@property (strong, nonatomic)NSString *paidOn;
@property (strong, nonatomic)NSString *processBy;
@property (strong, nonatomic)NSString *status;
@property (strong, nonatomic)NSString *transactionNotes;
@property (strong, nonatomic)NSString *hashCode;
@property (strong, nonatomic)NSString *transactionDate;
@property (strong, nonatomic)NSString *paymentResponse;
@property (strong, nonatomic)NSString *rewardPoint;
@property (strong, nonatomic)NSString *updatedOn;
@property (strong, nonatomic)NSString *approvalCode;


@end
