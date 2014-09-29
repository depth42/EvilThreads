//
//  EVTAccount1.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount1.h"

@interface EVTAccount1 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@property (nonatomic, readwrite, copy)   NSDate*             lastTransactionDate;
@end

#pragma mark

@implementation EVTAccount1

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
