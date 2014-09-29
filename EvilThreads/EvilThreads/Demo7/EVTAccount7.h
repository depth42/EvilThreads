//
//  EVTAccount7.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVTAccountBalance;
@class EVTDispatchQueue;

@interface EVTAccount7 : NSObject

// Methods can be called from any dispatch queue.

- (void)balanceWithDispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
               completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler;

- (void)depositAmount:(NSDecimalNumber*)amount
        dispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
    completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler;

- (void)withdrawAmount:(NSDecimalNumber*)amount
         dispatchQueue:(EVTDispatchQueue*)completionHandlerQueue
     completionHandler:(void (^)(EVTAccountBalance* balance))completionHandler;

@end
