//
//  CustomerModule.m
//  RgWallet
//
//  Created by Inforios on 15/09/15.
//  Copyright (c) 2015 Thoughts Igniter. All rights reserved.
//

#import "CustomerModule.h"
#import "TblCustomerModel.h"
#import "TblCustomerGroupList.h"
#import "Utils.h"
#import "LoaderModule.h"

@implementation CustomerModule

-(NSString *)loginwithserver:(CustomerDeviceDataModel *)pdevicemod{
    NSString *retval=@"";
    
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer LoginPlatform:pdevicemod];
    CustomerDao *daocust=[[CustomerDao alloc]init];
    [daocust DeleteCustomer];
    if(objmezzofy.customer){
        [Common setCustomertype:@"C"];
        [Common setCustomerUsername:objmezzofy.customer.customerFirstName];
        [Common setCustomerEmailID:objmezzofy.customer.customerEmail];
        [Common setCustomerpassword:objmezzofy.customer.customerPassword];
        [Common setCustomerId:objmezzofy.customer.customerId];
        [MZCouponConfig SetupCustomerID:objmezzofy.customer.customerId];
        
        BOOL resval=[daocust AddCustomerList:objmezzofy.customer];
        if(resval)
            retval=@"SUCCESS";
        else
            retval=[objmezzofy message];
    }
    
    
    return retval;
}
- (NSString *)faceboookloginwithserver:(CustomerDeviceDataModel *)pdevicemod{
    NSString *retval;
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer LoginFacebook:pdevicemod];
    CustomerDao *daocust=[[CustomerDao alloc]init];
    if(objmezzofy.customer.customerId){
        [daocust DeleteCustomer];
        [Common setCustomertype:@"F"];
        [Common setCustomerUsername:objmezzofy.customer.customerFirstName];
        [Common setCustomerEmailID:objmezzofy.customer.customerEmail];
        [Common setCustomerpassword:objmezzofy.customer.customerPassword];
        [Common setCustomerId:objmezzofy.customer.customerId];
        bool retrn=[daocust AddCustomerList:objmezzofy.customer];
        if(retrn)
            retval=@"SUCCESS";
    }else
        retval=[objmezzofy message];
    return retval;
}

- (BOOL)getCustomerGroupFromServer{
    BOOL retval=FALSE;
    
    
    MZCustomerGroupResponse *objmezzofy=[[MZCustomerGroupResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    CustomerDao *daocust=[[CustomerDao alloc]init];
    TblCustomerData *objcustdata=[[TblCustomerData alloc]init];
    objcustdata=[daocust getCustmerList];
    
    objmezzofy=[objMzcustomer GetCustomerGroupById:objcustdata.customerGroupId];
    
    LoaderModule *modloader=[[LoaderModule alloc]init];
    [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_customerGroup"];
    
    if(objmezzofy.customergroup.customerGroupId){
        
        TblCustomerGroupData *objcustgrpdata = [daocust getCustmerGroupList:objmezzofy.customergroup.customerGroupId];
        if([objcustgrpdata.customerGroupId isEqualToString:objmezzofy.customergroup.customerGroupId] &&![objcustgrpdata.hashCode isEqualToString:objmezzofy.customergroup.hashCode])
            
            retval = [daocust UpdateCustmerGroupList:objmezzofy.customergroup];
        
        else if([objcustgrpdata.customerGroupId isEqualToString:objmezzofy.customergroup.customerGroupId] &&[objcustgrpdata.hashCode isEqualToString:objmezzofy.customergroup.hashCode])
            
            [modloader updateDeleteFlagDataFromServer:@"tbl_customerGroup" tblcolumname:@"customerGroupId" tableid:objmezzofy.customergroup.customerGroupId];
        
        else
            retval = [daocust AddCustmerGroupList:objmezzofy.customergroup];
    }
    
    [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_customerGroup"];
    
    return  retval;
}
- (NSString *)putEditProfileDatatoServer:(CustomerDataModel *)pcustomermodel{
    NSString *retval;
    
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer CustomerUpdate:pcustomermodel];
    
    if(!objmezzofy.customer.customerEmail)
        retval=[objmezzofy message];
    
    CustomerDao *daocust=[[CustomerDao alloc]init];
    
    if(objmezzofy.customer.customerEmail){
        bool retrn=[daocust UpdateCustmerList:objmezzofy.customer];
            [Common setCustomerUsername:objmezzofy.customer.customerFirstName];
        if(retrn)
            retval=@"SUCCESS";
    }
    return retval;
    
}
- (NSString *)sendForgetPasswordToServer:(CustomerDataModel*)pcustomermodel{
    NSString *retval;
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer PasswordForgot:pcustomermodel];
    
    if(!objmezzofy.customer.customerEmail)
        retval=[objmezzofy message];
    
    CustomerDao *daocust=[[CustomerDao alloc]init];
    if(objmezzofy.customer.customerEmail){
        [Common setCustomerId:objmezzofy.customer.customerId];
        [Common setCustomerpassword:objmezzofy.customer.customerPassword];
        bool retrn=[daocust UpdateCustmerList:objmezzofy.customer];
        if(retrn)
            retval=@"SUCCESS";
    }
    return retval;
    
}
- (NSString *)sendChangePasswordToServer:(CustomerDataModel*)pcustomermodel{
    NSString *retval;
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer PasswordChange:pcustomermodel];
    CustomerDao *daocust=[[CustomerDao alloc]init];
    if(objmezzofy.customer.customerEmail){
        [Common setCustomerId:objmezzofy.customer.customerId];
        [Common setCustomerpassword:objmezzofy.customer.customerPassword];
        bool retrn=[daocust UpdateCustmerList:objmezzofy.customer];
        if(retrn)
            retval=@"SUCCESS";
        else
            retval=[objmezzofy message];
    }
    return retval;
    
}

-(CustomerData *)CheckUserAvaliable:(NSString *)pemailId{
    MZCustomerResponse *objmezzofy=[[MZCustomerResponse alloc]init];
    MZCustomer *objMzcustomer=[[MZCustomer alloc]init];
    objmezzofy=[objMzcustomer CheckUserAvaliable:pemailId];
    CustomerData *objcustomer= [[CustomerData alloc]init];;
    if(objmezzofy.customer.customerId.length>0)
        objcustomer=objmezzofy.customer;
    
    return objcustomer;
}
- (TblCustomerData *)getCustmerList{
    CustomerDao *objcust=[[CustomerDao alloc]init];
    return [objcust getCustmerList];
}
- (BOOL)AddCustomerList:(CustomerData *)pcustomerdata{
    CustomerDao *objcust=[[CustomerDao alloc]init];
    return [objcust AddCustomerList:pcustomerdata];
}
@end
