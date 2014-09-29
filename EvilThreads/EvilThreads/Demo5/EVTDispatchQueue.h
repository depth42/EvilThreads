//
//  EVTDispatchQueue.h
//  EvilThreads
//
//  Created by Frank Illenberger on 23.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVTDispatchQueue : NSObject

+ (EVTDispatchQueue*)currentQueue;

+ (EVTDispatchQueue*)mainQueue;

- (instancetype)initWithUnderlyingQueue:(dispatch_queue_t)underlyingQueue;

- (instancetype)initWithLabel:(NSString*)label
                   concurrent:(BOOL)concurrent;

@property (nonatomic, readonly) dispatch_queue_t underlyingQueue;

- (void)performBlock:(dispatch_block_t)block;

- (void)performBlockAndWait:(dispatch_block_t)block;

@end
