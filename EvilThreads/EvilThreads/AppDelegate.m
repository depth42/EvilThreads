//
//  AppDelegate.m
//  EvilThreads
//
//  Created by Frank Illenberger on 22.09.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "AppDelegate.h"
#import "EVTDemo1.h"
#import "EVTDemo2.h"
#import "EVTDemo3.h"
#import "EVTDemo4.h"
#import "EVTDemo5.h"
#import "EVTDemo6.h"
#import "EVTDemo7.h"

@interface AppDelegate ()

@property (nonatomic, readwrite, strong)    EVTDemo1* demo1;
@property (nonatomic, readwrite, strong)    EVTDemo2* demo2;
@property (nonatomic, readwrite, strong)    EVTDemo3* demo3;
@property (nonatomic, readwrite, strong)    EVTDemo4* demo4;
@property (nonatomic, readwrite, strong)    EVTDemo5* demo5;
@property (nonatomic, readwrite, strong)    EVTDemo6* demo6;
@property (nonatomic, readwrite, strong)    EVTDemo7* demo7;

- (IBAction)runDemo1:(id)sender;
- (IBAction)runDemo2:(id)sender;
- (IBAction)runDemo3:(id)sender;
- (IBAction)runDemo4:(id)sender;
- (IBAction)runDemo5:(id)sender;
- (IBAction)runDemo6:(id)sender;
- (IBAction)runDemo7:(id)sender;

@end

#pragma mark

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification*)notification
{
    [self setupDemos];
}

- (void)setupDemos
{
    self.demo1 = [[EVTDemo1 alloc] init];
    self.demo2 = [[EVTDemo2 alloc] init];
    self.demo3 = [[EVTDemo3 alloc] init];
    self.demo4 = [[EVTDemo4 alloc] init];
    self.demo5 = [[EVTDemo5 alloc] init];
    self.demo6 = [[EVTDemo6 alloc] init];
    self.demo7 = [[EVTDemo7 alloc] init];
}

- (IBAction)runDemo1:(id)sender
{
    [self.demo1 run];
}

- (IBAction)runDemo2:(id)sender
{
    [self.demo2 run];
}

- (IBAction)runDemo3:(id)sender
{
    [self.demo3 run];
}

- (IBAction)runDemo4:(id)sender
{
    [self.demo4 run];
}

- (IBAction)runDemo5:(id)sender
{
    [self.demo5 run];
}

- (IBAction)runDemo6:(id)sender
{
    [self.demo6 run];
}

- (IBAction)runDemo7:(id)sender
{
    [self.demo7 run];
}
@end
