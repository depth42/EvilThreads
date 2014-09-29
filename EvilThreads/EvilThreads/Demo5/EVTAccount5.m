//
//  EVTAccount5.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount5.h"
#import "EVTDispatchQueue.h"

@interface EVTAccount5 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount5

- (instancetype)initWithDispatchQueue:(EVTDispatchQueue*)dispatchQueue
{
    NSParameterAssert(dispatchQueue);
    
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
        _dispatchQueue = dispatchQueue;
    }
    return self;
}

- (void)depositAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);
    NSAssert(EVTDispatchQueue.currentQueue == _dispatchQueue, @"Called on wrong dispatch queue!");
    
    _amount = [_amount decimalNumberByAdding:amount];
    _transactionCount++;
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);
    NSAssert(EVTDispatchQueue.currentQueue == _dispatchQueue, @"Called on wrong dispatch queue!");
    
    _amount = [_amount decimalNumberBySubtracting:amount];
    _transactionCount++;
}

- (NSDecimalNumber*)amount
{
    NSAssert(EVTDispatchQueue.currentQueue == _dispatchQueue, @"Called on wrong dispatch queue!");

    return _amount;
}

- (NSUInteger)transactionCount
{
    NSAssert(EVTDispatchQueue.currentQueue == _dispatchQueue, @"Called on wrong dispatch queue!");

    return _transactionCount;
}

@end
