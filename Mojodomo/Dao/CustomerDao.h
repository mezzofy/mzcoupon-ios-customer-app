//
//  CustomerDao.h
//  
//
//  Created by Inforios on 26/07/17.
//
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "TblCustomerData.h"
#import "TblCustomerGroupData.h"

@interface CustomerDao : NSObject
- (TblCustomerData *)getCustmerList;
- (BOOL)AddCustomerList:(CustomerData *)pcustomerdata;
- (BOOL)UpdateCustmerList:(CustomerData *)pcustomerdata;
- (BOOL)DeleteCustomer;

//Customer Group
- (BOOL)AddCustmerGroupList:(CustomerGroupData *)pcustomergrpdata;
- (BOOL)UpdateCustmerGroupList:(CustomerGroupData *)pcustomergrpdata;
- (TblCustomerGroupData *)getCustmerGroupList:(NSString *)pcustomergroupId;
@end
