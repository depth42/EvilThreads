//
//  EVTDemo.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDemo.h"

@implementation EVTDemo

- (void)concurrentlyPerformBlock:(dispatch_block_t)actionBlock
                           times:(NSUInteger)times
               completionHandler:(void (^)(NSDate* startDate))completionHandler
{
    NSParameterAssert(actionBlock);
    NSParameterAssert(completionHandler);

    NSDate* startDate = [NSDate date];
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_apply(times, queue, ^(size_t index) {
        actionBlock();
    });

    completionHandler(startDate);
}

@end
