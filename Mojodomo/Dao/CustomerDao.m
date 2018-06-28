//
//  CustomerDao.m
//  
//
//  Created by Inforios on 26/07/17.
//
//

#import "CustomerDao.h"


@implementation CustomerDao
- (TblCustomerData *)getCustmerList{
    
    TblCustomerData *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT * FROM tbl_customer"];
    if ([res next])
        retval = [[TblCustomerData alloc]initWithDictionary:[res resultDictionary]];
    
    [database close];
    return retval;
}
- (BOOL)AddCustomerList:(CustomerData *)pcustomerdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];

    retval=[database executeUpdate:@"insert into tbl_customer (customerId, merchantId, customerGroupId, customerFirstName, customerLastName, customerPassword, customerEmail, countryCode, customerDob, customerMobile, customerGender, customerAddress, userType, vipNo, dgvipNo, fbToken, customerStatus, hashCode, createdOn, updatedOn, updatedBy, customerUsername, customerImageUrl)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[pcustomerdata customerId], [pcustomerdata merchantId], [pcustomerdata customerGroupId], [pcustomerdata customerFirstName], [pcustomerdata customerLastName], [pcustomerdata customerPassword], [pcustomerdata customerEmail], [pcustomerdata countryCode], [pcustomerdata customerDob], [pcustomerdata customerMobile], [pcustomerdata customerGender], [pcustomerdata customerAddress], [pcustomerdata userType], [pcustomerdata vipNo], [pcustomerdata dgvipNo], [pcustomerdata fbToken], [pcustomerdata customerStatus], [pcustomerdata hashCode], [pcustomerdata createdOn], [pcustomerdata updatedOn], [pcustomerdata updatedBy], [pcustomerdata customerUsername], [pcustomerdata customerImageUrl]];
    
    [database close];
    return retval;
}
- (BOOL)UpdateCustmerList:(CustomerData *)pcustomerdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"UPDATE tbl_customer SET  merchantId =?, customerGroupId =?, customerFirstName =?, customerLastName =?, customerPassword =?, customerEmail =?, countryCode =?, customerDob =?, customerMobile =?, customerGender =?, customerAddress =?, userType =?, vipNo =?, dgvipNo =?, fbToken =?, customerStatus =?, hashCode =?, createdOn =?, updatedOn =?, updatedBy =?, customerUsername =?, customerImageUrl =? where customerId =? ", [pcustomerdata merchantId], [pcustomerdata customerGroupId], [pcustomerdata customerFirstName], [pcustomerdata customerLastName], [pcustomerdata customerPassword], [pcustomerdata customerEmail], [pcustomerdata countryCode], [pcustomerdata customerDob], [pcustomerdata customerMobile], [pcustomerdata customerGender], [pcustomerdata customerAddress], [pcustomerdata userType], [pcustomerdata vipNo], [pcustomerdata dgvipNo], [pcustomerdata fbToken], [pcustomerdata customerStatus], [pcustomerdata hashCode], [pcustomerdata createdOn], [pcustomerdata updatedOn], [pcustomerdata updatedBy], [pcustomerdata customerUsername], [pcustomerdata customerImageUrl],[pcustomerdata customerId]];
    
    
    [database close];
    return retval;
}

- (BOOL)DeleteCustomer{
    
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    retval=[database executeUpdate:@"delete from tbl_customer"];
    
    [database close];
     return retval;
    
}


- (BOOL)AddCustmerGroupList:(CustomerGroupData *)pcustomergrpdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval=[database executeUpdate:@"insert into tbl_customerGroup (customerGroupId, merchantId, groupName, groupStatus, dollarSpending, rewardPoint, hashCode, updatedOn, delflag)values(?,?,?,?,?,?,?,?,'N')",[pcustomergrpdata customerGroupId], [pcustomergrpdata merchantId], [pcustomergrpdata groupName], [pcustomergrpdata groupStatus] ,[pcustomergrpdata dollarSpending] ,[pcustomergrpdata rewardPoint] ,[pcustomergrpdata hashCode] ,[pcustomergrpdata updatedOn]];
    
    [database close];
    return retval;
}
- (BOOL)UpdateCustmerGroupList:(CustomerGroupData *)pcustomergrpdata{
    BOOL retval=FALSE;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    retval=[database executeUpdate:@"UPDATE tbl_customerGroup SET merchantId = ?, groupName = ?, groupStatus = ?, dollarSpending =?, rewardPoint =?, hashCode =?, updatedOn =?, delflag ='N' where customerGroupId =?",[pcustomergrpdata merchantId], [pcustomergrpdata groupName], [pcustomergrpdata groupStatus] ,[pcustomergrpdata dollarSpending] ,[pcustomergrpdata rewardPoint] ,[pcustomergrpdata hashCode] ,[pcustomergrpdata updatedOn],[pcustomergrpdata customerGroupId]];
    
    [database close];
    return retval;
}
- (TblCustomerGroupData *)getCustmerGroupList:(NSString *)pcustomergroupId{
    
    
    TblCustomerGroupData *retval = NULL;
    FMDatabase *database =[FMDatabase databaseWithPath:[Utils dbpath]];
    [database open];
    
    FMResultSet *res = [database executeQuery:@"SELECT * FROM tbl_customerGroup where customerGroupId =?",pcustomergroupId];
    if ([res next])
        retval = [[TblCustomerGroupData alloc]initWithDictionary:[res resultDictionary]];
    
    [database close];
    return retval;
}

@end
