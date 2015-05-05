//
//  AutoLockTests.m
//  AutoLockTests
//
//  Created by mengfei.mf on 5/5/15.
//  Copyright (c) 2015 mengfei.mf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AutoLock.h"

void func1(dispatch_semaphore_t sema)
{
    LOCK_WITH(sema);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
}

void func2(dispatch_semaphore_t sema)
{
    LOCK_WITH(sema);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
    NSLog(@"%s", __func__);
}

@interface AutoLockTests : XCTestCase

@end

@implementation AutoLockTests

static dispatch_semaphore_t s_sema = dispatch_semaphore_create(1);

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        func1(s_sema);
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        func2(s_sema);
    });
    //console中func1与func2不会交叉出现，断言省去
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
