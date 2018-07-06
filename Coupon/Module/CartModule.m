//
//  CartModule.m
//  ProWallet
//
//  Created by Inforios on 22/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import "CartModule.h"
#import "CartDao.h"

@implementation CartModule
- (BOOL)addCartItemsData:(TblProduct *)pprod{
    CartDao *daocart=[[CartDao alloc]init];
   return [daocart addCartItemsData:pprod];
}
- (BOOL)updateCartItemsData:(TblProduct *)pprod{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart updateCartItemsData:pprod];
}
- (BOOL)deteleCartItemsDataFromTable:(NSNumber *)pcart_id{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart deteleCartItemsDataFromTable:pcart_id];
}
- (TblProduct *)getCartdetailsFromTabels:(NSInteger)poffset{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart getCartdetailsFromTabels:poffset];
}
- (NSInteger)getCartItemsCount{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart getCartItemsCount];
}
- (NSInteger)getTotalPriceCartItems{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart getTotalPriceCartItems];
}
- (TblProduct *)getCartdetailsCartId:(NSInteger)pcartId{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart getCartdetailsCartId:pcartId];
}
- (BOOL)deteleCartItemsAfterPayment{
    CartDao *daocart=[[CartDao alloc]init];
    return [daocart deteleCartItemsAfterPayment];
}
@end
