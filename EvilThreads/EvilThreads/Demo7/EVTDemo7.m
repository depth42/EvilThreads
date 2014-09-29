//
//  EVTDemo7.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo7.h"
#import "EVTAccount7.h"
#import "EVTDispatchQueue.h"
#import "EVTAccountBalance.h"

@implementation EVTDemo7

- (void)run
{
    EVTAccount7* account = [[EVTAccount7 alloc] init];
    NSDecimalNumber* amount = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    
    EVTDispatchQueue* queue = [[EVTDispatchQueue alloc] initWithLabel:@"test" concurrent:NO];
    
    dispatch_block_t block = ^ {
        [account depositAmount:amount
                 dispatchQueue:queue
             completionHandler:^(EVTAccountBalance *balance) {
                 // ...
             }];
    };
    
    [self concurrentlyPerformBlock:block
                             times:10000
                 completionHandler:^(NSDate* startDate)
     {
         [account balanceWithDispatchQueue:EVTDispatchQueue.mainQueue
                         completionHandler:^(EVTAccountBalance* balance)
          {
              self.amount           = balance.amount;
              self.transactionCount = balance.transactionCount;
              self.duration         = -startDate.timeIntervalSinceNow;
          }];
     }];
}

@end
