//
//  EVTDemo1.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo1.h"
#import "EVTAccount1.h"

@implementation EVTDemo1

- (void)run
{
    EVTAccount1* account = [[EVTAccount1 alloc] init];

    NSDecimalNumber* amount1 = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    NSDecimalNumber* amount2 = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    dispatch_block_t block = ^{
        [account depositAmount:amount1];
        [account withdrawAmount:amount2];
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
