//
//  Model.m
//  PsychologyApp
//
//  Created by felix on 16/3/9.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Model.h"

@implementation Model


+ (instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static Model *thiz;

    dispatch_once(&once, ^{
            thiz = [self new];
        });
    return thiz;
}

@end
