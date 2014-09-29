//
//  EVTDemo2.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo2.h"
#import "EVTAccount2.h"

@implementation EVTDemo2

- (void)run
{
    EVTAccount2* account = [[EVTAccount2 alloc] init];

    NSDecimalNumber* amount1 = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    NSDecimalNumber* amount2 = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    dispatch_block_t block = ^{
        (void)account.transactionCount;
        [account depositAmount:amount1];
        (void)account.amount;
        [account withdrawAmount:amount2];
        (void)account.transactionCount;
    };

    [self concurrentlyPerformBlock:block
                             times:20000
                 completionHandler:^(NSDate* startDate)
     {
         self.amount           = account.amount;
         self.transactionCount = account.transactionCount;
         self.duration         = -startDate.timeIntervalSinceNow;
     }];
}

@end
