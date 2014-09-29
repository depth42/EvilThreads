//
//  EVTDemo.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVTDemo : NSObject

// Completion handler gets called on main queue
- (void)concurrentlyPerformBlock:(dispatch_block_t)actionBlock
                           times:(NSUInteger)times
               completionHandler:(void (^)(NSDate* startDate))completionHandler;

@property (nonatomic, readwrite, copy)      NSDecimalNumber*    amount;
@property (nonatomic, readwrite)            NSUInteger          transactionCount;
@property (nonatomic, readwrite)            NSTimeInterval      duration;

@end
