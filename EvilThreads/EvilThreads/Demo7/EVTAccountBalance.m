//
//  EVTAccountBalance.m
//  EvilThreads
//
//  Created by Frank Illenberger on 23.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccountBalance.h"

@implementation EVTAccountBalance

- (instancetype)initWithAmount:(NSDecimalNumber*)amount
              transactionCount:(NSUInteger)transactionCount
                          date:(NSDate*)date
{
    NSParameterAssert(amount);
    NSParameterAssert(date);
    
    if(self = [super init])
    {
        _amount           = amount;
        _transactionCount = transactionCount;
        _date             = date;
    }
    return self;
}

- (instancetype)initWithAmount:(NSDecimalNumber*)amount
              transactionCount:(NSUInteger)transactionCount
{
    return [self initWithAmount:amount
               transactionCount:transactionCount
                           date:[NSDate date]];
}
@end
