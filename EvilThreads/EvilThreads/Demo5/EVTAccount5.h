//
//  EVTAccount5.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVTDispatchQueue;

@interface EVTAccount5 : NSObject

- (instancetype)initWithDispatchQueue:(EVTDispatchQueue*)dispatchQueue;

@property (nonatomic, readonly)         EVTDispatchQueue*    dispatchQueue;

// Properties and methods need to be accessed on dispatchQueue of receiver
@property (nonatomic, readonly, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readonly)         NSUInteger          transactionCount;

- (void)depositAmount:(NSDecimalNumber*)amount;
- (void)withdrawAmount:(NSDecimalNumber*)amount;

@end
