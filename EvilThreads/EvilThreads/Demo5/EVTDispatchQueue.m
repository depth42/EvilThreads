//
//  EVTDispatchQueue.m
//  EvilThreads
//
//  Created by Frank Illenberger on 23.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "EVTDispatchQueue.h"

@implementation EVTDispatchQueue

static const void* kCurrentQueueKey;

- (instancetype)initWithUnderlyingQueue:(dispatch_queue_t)underlyingQueue
{
    if(self = [super init])
    {
        _underlyingQueue = underlyingQueue;
        dispatch_queue_set_specific(_underlyingQueue, &kCurrentQueueKey, (__bridge void*)self, /* destructor */ NULL);
    }
    return self;
}

- (instancetype)initWithLabel:(NSString*)label
                   concurrent:(BOOL)concurrent
{
    dispatch_queue_t queue = dispatch_queue_create(label.UTF8String, concurrent ? DISPATCH_QUEUE_CONCURRENT : DISPATCH_QUEUE_SERIAL);
    return [self initWithUnderlyingQueue:queue];
}

+ (EVTDispatchQueue*)currentQueue
{
    return (__bridge EVTDispatchQueue*) dispatch_get_specific(&kCurrentQueueKey);
}

+ (EVTDispatchQueue*)mainQueue
{
    static EVTDispatchQueue* mainQueue;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        mainQueue = ([[EVTDispatchQueue alloc] initWithUnderlyingQueue:dispatch_get_main_queue()]);
    });
    return mainQueue;
}

- (void)performBlock:(dispatch_block_t)block
{
    NSParameterAssert(block);
    
    dispatch_async(_underlyingQueue, block);
}

- (void)performBlockAndWait:(dispatch_block_t)block
{
    NSParameterAssert(block);
    
    dispatch_sync(_underlyingQueue, block);
}

@end
