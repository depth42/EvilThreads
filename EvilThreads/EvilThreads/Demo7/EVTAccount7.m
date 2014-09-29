//
//  EVTAccount6.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount7.h"
#import "EVTAccountBalance.h"
#import "EVTDispatchQueue.h"

@interface EVTAccount7 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount7
{
    EVTDispatchQueue* _dispatchQueue;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
        _dispatchQueue = [[EVTDispatchQueue alloc] initWithLabel:@"EVTAccount7" concurrent:NO];
    }
    return self;
}

- (EVTAccountBalance*)newBalance
{
    NSAssert(EVTDispatchQueue.currentQueue == _dispatchQueue, @"Called on wrong dispatch queue!");
    
    return [[EVTAccountBalance alloc] initWithAmount:_amount
                                    transactionCount:_transactionCount];
}

- (void)balanceWithDispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
               completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler

{
    NSParameterAssert(completionHandler);
    
    [_dispatchQueue performBlock:^{
        EVTAccountBalance* balance = [self newBalance];
        [completionHandlerQueue performBlock:^{
            completionHandler(balance);
        }];
    }];
}

- (void)depositAmount:(NSDecimalNumber*)amount
        dispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
    completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler
{
    NSParameterAssert(amount);
    NSParameterAssert(completionHandlerQueue);
    NSParameterAssert(completionHandler);

    [_dispatchQueue performBlock:^{
        _amount = [_amount decimalNumberByAdding:amount];
        _transactionCount++;
        EVTAccountBalance* balance = [self newBalance];
        [completionHandlerQueue performBlock:^{
            completionHandler(balance);
        }];
    }];
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
         dispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
     completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler
{
    NSParameterAssert(amount);
    NSParameterAssert(completionHandlerQueue);
    NSParameterAssert(completionHandler);
   
    [_dispatchQueue performBlock:^{
        _amount = [_amount decimalNumberByAdding:amount];
        _transactionCount++;
        EVTAccountBalance* balance = [self newBalance];
        [completionHandlerQueue performBlock:^{
            completionHandler(balance);
        }];
    }];
}

@end
