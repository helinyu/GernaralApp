//
//  HostManager.m
//  CarCalc
//
//  Created by wen on 16/1/6.
//  Copyright © 2016年 Vanchu. All rights reserved.
//

#import "HostManager.h"
#import "AppDefinition.h"

@implementation HostManagerDataServer

@end

@implementation HostManager{
    HostManagerDataServer *_data;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static HostManager *thiz;
    dispatch_once(&once, ^{
        thiz = [self new];
    });
    return thiz;
}

- (instancetype)init {
    if (self = [super init]) {
        _data = [HostManagerDataServer new];
#ifdef ENV_TEST
        [self switchToTest];
#else
        [self switchToRelease];
#endif
    }
    return self;
}

- (void)switchToTest {
    _data.commonHost = @"localhost/foreheard";
}

- (void)switchToRelease {
    _data.commonHost = @"10.104.145.237:9000";
    }

- (HostManagerDataServer *)get {
    return _data;
}

@end
