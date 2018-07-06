//
//  CartModule.h
//  ProWallet
//
//  Created by Inforios on 22/09/17.
//  Copyright © 2017 Thoughts Igniter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TblProduct.h"

@interface CartModule : NSObject
- (BOOL)addCartItemsData:(TblProduct *)pprod;
- (BOOL)updateCartItemsData:(TblProduct *)pprod;
- (BOOL)deteleCartItemsDataFromTable:(NSNumber *)pcart_id;
- (TblProduct *)getCartdetailsFromTabels:(NSInteger)poffset;
- (NSInteger)getCartItemsCount;
- (NSInteger)getTotalPriceCartItems;
- (TblProduct *)getCartdetailsCartId:(NSInteger)pcartId;
- (BOOL)deteleCartItemsAfterPayment;
@end
