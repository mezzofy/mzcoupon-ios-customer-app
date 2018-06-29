//
//  RegsisterModule.m
//  ProWallet
//
//  Created by Inforios on 04/08/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "RegsisterModule.h"
#import "Utils.h"
#import "TblCountryList.h"
#import "CustomerDao.h"
@implementation RegsisterModule
- (NSMutableArray *)getCountryListFromServer{
    MZCountryResponse *objmezzofy=[[MZCountryResponse alloc]init];
    MZRegsister *objMZRegsister=[[MZRegsister alloc]init];
    objmezzofy=[objMZRegsister GetCountties];
    NSMutableArray *arrcountry=[[NSMutableArray alloc]init];
    
        for (TblCountryModel *objcountmod in objmezzofy.countries) {
            [arrcountry addObject:objcountmod.country];
        }
    
    return arrcountry;
}
- (NSString *)postRegsisterDatatoServer:(CustomerDataModel*)pcustomermodel{
    NSString *retval;
    
    MZRegsisterResponse*objmezzofy=[[MZRegsisterResponse alloc]init];
    MZRegsister *objMZRegsister=[[MZRegsister alloc]init];
    
    objmezzofy=[objMZRegsister CustomerSignup:pcustomermodel];
        
        CustomerDao *daocust=[[CustomerDao alloc]init];
        if(objmezzofy.customer.customerEmail){
            [daocust DeleteCustomer];
            [Common setCustomertype:@"C"];
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

@end
