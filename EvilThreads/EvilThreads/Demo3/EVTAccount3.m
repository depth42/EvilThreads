//
//  EVTAccount2.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount3.h"

@interface EVTAccount3 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount3
{
    dispatch_queue_t _dispatchQueue;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
        _dispatchQueue = dispatch_queue_create("EVTAccount3", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)depositAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    dispatch_async(_dispatchQueue, ^{
        _amount = [_amount decimalNumberByAdding:amount];
        _transactionCount++;
    });
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    dispatch_async(_dispatchQueue, ^{
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
