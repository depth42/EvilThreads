//
//  EVTAccount3.h
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVTAccount3 : NSObject

// Properties and methods can be accessed from any dispatch queue.

@property (nonatomic, readonly, copy)   NSDecimalNumber*    amount;
@property (nonatomic, readonly)         NSUInteger          transactionCount;

- (void)depositAmount:(NSDecimalNumber*)amount;
- (void)withdrawAmount:(NSDecimalNumber*)amount;

@end
