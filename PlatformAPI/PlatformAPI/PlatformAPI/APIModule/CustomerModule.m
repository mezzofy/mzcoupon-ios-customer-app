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

-(NSString *)loginwithserver:(TblCustomerDeviceModel *)pdevicemod{
    NSString *retval=@"";
    bool resval=false;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pdevicemod toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/auth"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                                 JSONObjectWithData:data
                                 options:kNilOptions
                                 error:&error];
        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
//        CustomerDao *daocust=[[CustomerDao alloc]init];
//        [daocust DeleteCustomer];
        if(objcustmdl.customer){
        [Common setCustomertype:@"C"];
        [Common setCustomerUsername:objcustmdl.customer.customerFirstName];
        [Common setCustomerEmailID:objcustmdl.customer.customerEmail];
        [Common setCustomerpassword:objcustmdl.customer.customerPassword];
        [Common setCustomerId:objcustmdl.customer.customerId];
//        resval=[daocust AddCustmerList:objcustmdl.customer];
           if(resval)
               retval=@"SUCCESS";
            else
               retval=[json valueForKey:@"message"];
        }
        
    }
    return retval;
}
- (NSString *)faceboookloginwithserver:(TblCustomerDeviceModel *)pdevicemod{
    NSString *retval;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pdevicemod toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/facebookauth"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
//        CustomerDao *daocust=[[CustomerDao alloc]init];
        if(objcustmdl.customer.customerId){
//            [daocust DeleteCustomer];
            [Common setCustomertype:@"F"];
            [Common setCustomerUsername:objcustmdl.customer.customerFirstName];
            [Common setCustomerEmailID:objcustmdl.customer.customerEmail];
            [Common setCustomerpassword:objcustmdl.customer.customerPassword];
            [Common setCustomerId:objcustmdl.customer.customerId];
            bool retrn;
//            =[daocust AddCustmerList:objcustmdl.customer];
            if(retrn)
                retval=@"SUCCESS";
        }else
            retval=[json valueForKey:@"message"];
            
        }
        
    
    return retval;
}

- (BOOL)getCustomerGroupFromServer{
    BOOL retval=FALSE;
//    CustomerDao *daocust=[[CustomerDao alloc]init];
    TblCustomerData *objcustdata=[[TblCustomerData alloc]init];
//    objcustdata=[daocust getCustmerList];
    
    NSData *data = [Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/customergroups/%@",objcustdata.customerGroupId] param:nil];
    if(data) {
        
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
//        if (json){
//
//            TblCustomerGroupModel *objcustmodel=[[TblCustomerGroupModel alloc]initWithDictionary:json];
//            CustomerDao *daocust=[[CustomerDao alloc]init];
//            LoaderModule *modloader=[[LoaderModule alloc]init];
//            [modloader UpdateDeleteFlagBeforeServerCall:@"tbl_customerGroup"];
//
//            if(objcustmodel.customergroup.customerGroupId){
//
//                TblCustomerGroupData *objcustgrpdata = [daocust getCustmerGroupList:objcustmodel.customergroup.customerGroupId];
//                if([objcustgrpdata.customerGroupId isEqualToString:objcustmodel.customergroup.customerGroupId] &&![objcustgrpdata.hashCode isEqualToString:objcustmodel.customergroup.hashCode])
//
//                   retval = [daocust UpdateCustmerGroupList:objcustmodel.customergroup];
//
//                else if([objcustgrpdata.customerGroupId isEqualToString:objcustmodel.customergroup.customerGroupId] &&[objcustgrpdata.hashCode isEqualToString:objcustmodel.customergroup.hashCode])
//
//                    [modloader updateDeleteFlagDataFromServer:@"tbl_customerGroup" tblcolumname:@"customerGroupId" tableid:objcustmodel.customergroup.customerGroupId];
//
//                else
//                retval = [daocust AddCustmerGroupList:objcustmodel.customergroup];
//            }
//
//            [modloader DeleteDataFromDataBaseWhereDelFlagEnable:@"tbl_customerGroup"];
//
//        }
    }
    
    return  retval;
}
- (NSString *)putEditProfileDatatoServer:(TblCustomerModel*)pcustomermodel{
    NSString *retval;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPutRequest:[NSString stringWithFormat:@"api/v1/customers/%@",[Common getCustomerId]] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
//        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
//        if(!objcustmdl.customer.customerEmail)
//        retval=[json valueForKey:@"message"];
//
//        CustomerDao *daocust=[[CustomerDao alloc]init];
//
//        if(objcustmdl.customer.customerEmail){
//            bool retrn=[daocust UpdateCustmerList:objcustmdl.customer];
//            if(retrn)
//            retval=@"SUCCESS";
//        }
    
    }
    return retval;
    
}
- (NSString *)sendForgetPasswordToServer:(TblCustomerModel*)pcustomermodel{
    NSString *retval;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPostRequest:[NSString stringWithFormat:@"api/v1/customers/forget"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
        if(!objcustmdl.customer.customerEmail)
        retval=[json valueForKey:@"message"];
        
//        CustomerDao *daocust=[[CustomerDao alloc]init];
//
//        if(objcustmdl.customer.customerEmail){
//            [Common setCustomerId:objcustmdl.customer.customerId];
//            [Common setCustomerpassword:objcustmdl.customer.customerPassword];
//            bool retrn=[daocust UpdateCustmerList:objcustmdl.customer];
//            if(retrn)
//            retval=@"SUCCESS";
//        }
        
    }
    return retval;
    
}
- (NSString *)sendChangePasswordToServer:(TblCustomerModel*)pcustomermodel{
    NSString *retval;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[pcustomermodel toDictionary] options:kNilOptions error:&error];
    NSData *data =[Utils urlPutRequest:[NSString stringWithFormat:@"api/v1/customers/changepassword"] body:jsonData];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
        
//        CustomerDao *daocust=[[CustomerDao alloc]init];
//
//        if(objcustmdl.customer.customerEmail){
//            [Common setCustomerId:objcustmdl.customer.customerId];
//            [Common setCustomerpassword:objcustmdl.customer.customerPassword];
//            bool retrn=[daocust UpdateCustmerList:objcustmdl.customer];
//            if(retrn)
//                retval=@"SUCCESS";
//            else
//                retval=[json valueForKey:@"message"];
//        }
        
    }
    return retval;
    
}
-(TblCustomerData *)CheckUserAvaliable:(NSString *)pemailId{
    TblCustomerData *objcustomer= [[TblCustomerData alloc]init];;
    NSMutableDictionary* reqparam = [[NSMutableDictionary alloc]init];
    [reqparam setValue:pemailId forKey:@"email"];
    NSData *data =[Utils urlGetRequest:[NSString stringWithFormat:@"api/v1/customers/customeremail"] param:reqparam];
    if(data){
        NSError *error;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        TblCustomerModel *objcustmdl=[[TblCustomerModel alloc]initWithDictionary:json];
        if(objcustmdl.customer.customerId.length>0)
            objcustomer=objcustmdl.customer;
    }
    return objcustomer;
}

@end
