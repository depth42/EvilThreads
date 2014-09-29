//
//  EVTAccount6.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVTDispatchQueue;

@interface EVTAccount6 : NSObject

// Access to properties and methods must be wrapped by a call to
// -performBlock: or -performBlockAndWait:
@property (nonatomic, readonly, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readonly)         NSUInteger          transactionCount;

- (void)depositAmount:(NSDecimalNumber*)amount;
- (void)withdrawAmount:(NSDecimalNumber*)amount;

- (void)performBlock:(dispatch_block_t)block;
- (void)performBlockAndWait:(dispatch_block_t)block;

@end
