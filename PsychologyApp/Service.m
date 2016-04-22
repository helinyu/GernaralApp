//
//  Service.m
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

@implementation Service
@end

@implementation ServiceData
@end


@implementation ServiceDataAdapter

+ (void)convertFrom:(id)fromData to:(id)toData{
    [NSException raise:@"Invalid Call" format:@"this method needs to be override in subclasses"];
}

@end

@implementation RetServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end