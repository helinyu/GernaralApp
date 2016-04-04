//
//  SettingServiceData.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "SettingServiceData.h"

@implementation SettingServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _version = @"";
        _url = @"";
    }
    return self;
}

@end
