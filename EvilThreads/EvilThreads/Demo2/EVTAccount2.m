//
//  EVTAccount2.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount2.h"

@interface EVTAccount2 ()
@property (atomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (atomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount2

- (instancetype)init
{
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
    }
    return self;
}

- (void)depositAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    self.amount = [self.amount decimalNumberByAdding:amount];
    self.transactionCount++;
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);

    self.amount = [self.amount decimalNumberBySubtracting:amount];
    self.transactionCount++;
}

@end
