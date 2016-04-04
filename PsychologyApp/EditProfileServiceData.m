//
//  EditProfileServiceData.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "EditProfileServiceData.h"

@implementation EditProfileServiceData


- (instancetype)init
{
    self = [super init];
    if (self) {
        _phone = @"";
        _password = @"";
        _nickname = @"";
        _age = 0;
        _sex = false;
        _region = @"";
        _briefIntroduction = @"";
    }
    return self;
}

@end
