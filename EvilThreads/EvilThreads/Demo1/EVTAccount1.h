//
//  EVTAccount1.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVTAccount1 : NSObject

@property (nonatomic, readonly, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readonly)         NSUInteger          transactionCount;

- (void)depositAmount:(NSDecimalNumber*)amount;
- (void)withdrawAmount:(NSDecimalNumber*)amount;

@end
