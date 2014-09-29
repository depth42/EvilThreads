//
//  EVTAccountBalance.h
//  EvilThreads
//
//  Created by Frank Illenberger on 23.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVTAccountBalance : NSObject

- (instancetype)initWithAmount:(NSDecimalNumber*)amount
              transactionCount:(NSUInteger)transactionCount
                          date:(NSDate*)date;

- (instancetype)initWithAmount:(NSDecimalNumber*)amount
              transactionCount:(NSUInteger)transactionCount;

@property (nonatomic, readonly)     NSDecimalNumber*    amount;
@property (nonatomic, readonly)     NSUInteger          transactionCount;
@property (nonatomic, readonly)     NSDate*             date;

@end
