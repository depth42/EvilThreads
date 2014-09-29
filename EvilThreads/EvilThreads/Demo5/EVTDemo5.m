//
//  EVTDemo5.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo5.h"
#import "EVTAccount5.h"
#import "EVTDispatchQueue.h"

@implementation EVTDemo5

- (void)run
{
    EVTDispatchQueue* queue = [[EVTDispatchQueue alloc] initWithLabel:@"EVTDemo5" concurrent:NO];
    EVTAccount5* account1 = [[EVTAccount5 alloc] initWithDispatchQueue:queue];
    EVTAccount5* account2 = [[EVTAccount5 alloc] initWithDispatchQueue:queue];

    NSDecimalNumber* amount1 = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    NSDecimalNumber* amount2 = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    dispatch_block_t block = ^{
        [queue performBlock:^{
            (void)account1.transactionCount;
            [account1 depositAmount:amount1];
            (void)account1.amount;
            [account1 withdrawAmount:amount2];
            (void)account1.transactionCount;
            
            (void)account2.transactionCount;
            [account2 depositAmount:amount1];
            (void)account2.amount;
            [account2 withdrawAmount:amount2];
            (void)account2.transactionCount;
        }];
    };

    [self concurrentlyPerformBlock:block
                             times:20000
                 completionHandler:^(NSDate* startDate)
     {
         __block NSDecimalNumber* amount;
         __block NSUInteger transactionCount;
         [queue performBlockAndWait:^{
             amount           = account1.amount;
             transactionCount = account1.transactionCount;
         }];
         
         self.amount           = amount;
         self.transactionCount = transactionCount;
         self.duration         = -startDate.timeIntervalSinceNow;
     }];
}

@end
