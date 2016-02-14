//
//  RestStructResponse.m
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestStructResponse.h"


@implementation RestStructResponse

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

//注册
@implementation RestStructRegisterResponse

-(instancetype)init{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end
