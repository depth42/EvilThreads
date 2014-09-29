//
//  EVTAccount6.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTAccount6.h"
#import "EVTDispatchQueue.h"
#import "pthread.h"

@interface EVTAccount6 ()
@property (nonatomic, readwrite, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readwrite)         NSUInteger          transactionCount;
@end

#pragma mark

@implementation EVTAccount6
{
    EVTDispatchQueue* _dispatchQueue;
    pthread_t         _currentThread;
    BOOL              _isPerforming;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _amount = [NSDecimalNumber zero];
        _dispatchQueue = [[EVTDispatchQueue alloc] initWithLabel:@"EVTAccount6" concurrent:NO];
    }
    return self;
}

- (void)depositAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);
    NSAssert(_isPerforming, @"Please wrap calls with -performBlock or -performBlockAndWait:");
    
    _amount = [_amount decimalNumberByAdding:amount];
    _transactionCount++;
}

- (void)withdrawAmount:(NSDecimalNumber*)amount
{
    NSParameterAssert(amount);
    NSAssert(_isPerforming, @"Please wrap calls with -performBlock or -performBlockAndWait:");

    _amount = [_amount decimalNumberBySubtracting:amount];
    _transactionCount++;
}

- (void)performBlock:(dispatch_block_t)block
{
    NSParameterAssert(block);

    [_dispatchQueue performBlock:^{
        NSAssert(!_isPerforming, nil);
        _isPerforming = YES;
        
        block();
        
        _isPerforming = NO;
    }];
}

- (void)performBlockAndWait:(dispatch_block_t)block
{
    NSParameterAssert(block);
    
    if(_currentThread == pthread_self())
        block();
    else
        [_dispatchQueue performBlockAndWait:^{
            _currentThread = pthread_self();
            _isPerforming = YES;

            block();
            
            _currentThread = NULL;
            _isPerforming = NO;
        }];
}

@end
