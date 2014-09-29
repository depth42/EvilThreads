//
//  EVTAccount4.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount4.h"

@interface EVTAccount4 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount4
{
    dispatch_queue_t _dispatchQueue;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
        _dispatchQueue = dispatch_queue_create("EVTAccount4", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)depositAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    dispatch_barrier_async(_dispatchQueue, ^{
        _amount = [_amount decimalNumberByAdding:amount];
        _transactionCount++;
    });
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    dispatch_barrier_async(_dispatchQueue, ^{
        _amount = [_amount decimalNumberBySubtracting:amount];
        _transactionCount++;
    });
}

- (NSDecimalNumber*)amount
{
    __block NSDecimalNumber* amount;
    dispatch_sync(_dispatchQueue, ^{
        amount = _amount;
    });
    return amount;
}

- (NSUInteger)transactionCount
{
    __block NSUInteger transactionCount;
    dispatch_sync(_dispatchQueue, ^{
        transactionCount = _transactionCount;
    });
    return transactionCount;
}

@end
