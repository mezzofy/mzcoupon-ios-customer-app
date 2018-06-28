//
//  CustomerDataModel.h
//  Mezzofy
//
//  Created by Mezzofy on 25/07/17.
//  Copyright © 2018 Mezzofy. All rights reserved.
//

#import "MZJastor.h"
#import "CustomerData.h"
@interface CustomerDataModel : MZJastor
@property (nonatomic, strong) CustomerData *customer;
@end
