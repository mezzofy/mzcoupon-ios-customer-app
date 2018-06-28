//
//  PaymentMasterData.h
//  Mezzofy
//
//  Created by Mezzofy on 30/06/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "PaymentDataModel.h"
@interface PaymentMasterData : MZJastor
@property (nonatomic, strong)NSMutableArray *paymentdetails;
@property (nonatomic, strong)NSMutableArray *payments;





@end
