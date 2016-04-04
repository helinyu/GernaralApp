//
//  EntityUser.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "EntityUser.h"

@implementation EntityUser

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLogined = false;
        _uId = @"" ;
    }
    return self;
}

@end
