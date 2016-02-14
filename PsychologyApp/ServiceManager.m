//
//  ServiceManager.m
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//
//
//  ServiceManager.m
//  guimiquan
//
//  Created by Chen Rui on 11/14/14.
//  Copyright (c) 2014 Vanchu. All rights reserved.
//

#import "ServiceManager.h"
#import "Service.h"

@interface ServiceManager()
{
    NSMutableDictionary *_serviceMap;
}
@end

@implementation ServiceManager

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static ServiceManager *thiz;
    dispatch_once(&once, ^{
        thiz = [self new];
    });
    return thiz;
}

- (instancetype)init {
    self = [super init];
    if(self){
        _serviceMap = [NSMutableDictionary new];
    }
    return self;
}

- (id)serviceWithClass:(Class)class {
    Service *service = _serviceMap[NSStringFromClass(class)];
    if(service == nil){
        service = [class new];
        [_serviceMap setObject:service forKey:NSStringFromClass(class)];
    }
    return service;
}

@end
