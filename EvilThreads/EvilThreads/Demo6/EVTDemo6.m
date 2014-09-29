//
//  EVTDemo6.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo6.h"
#import "EVTAccount6.h"
#import "EVTDispatchQueue.h"

@implementation EVTDemo6

- (void)run
{
    EVTAccount6* account1 = [[EVTAccount6 alloc] init];
    EVTAccount6* account2 = [[EVTAccount6 alloc] init];
    
    NSDecimalNumber* amount1 = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    NSDecimalNumber* amount2 = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    dispatch_block_t block = ^{
        [account1 performBlock:^{
            [account1 depositAmount:amount1];
            (void)account1.amount;
        }];
        
        [account1 performBlockAndWait:^{
            [account2 performBlockAndWait:^{
                [account1 performBlockAndWait:^{
                    [account2 depositAmount:amount1];
                    [account1 withdrawAmount:amount2];
                }];
            }];
        }];
    };
    
    [self concurrentlyPerformBlock:block
                             times:20000
                 completionHandler:^(NSDate* startDate)
     {
         __block NSDecimalNumber* amount;
         __block NSUInteger transactionCount;
         [account1 performBlockAndWait:^{
             amount           = account1.amount;
             transactionCount = account1.transactionCount;
         }];
         
         self.amount           = amount;
         self.transactionCount = transactionCount;
         self.duration         = -startDate.timeIntervalSinceNow;
     }];
}

@end
