//
//  FLIndexPath.m
//  PsychologyApp
//
//  Created by felix on 16/4/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "FLIndexPath.h"

@implementation FLIndexPath

- (instancetype)init
{
    self = [super init];
    if (self) {
        _indexPath = [NSIndexPath new];
        _hasChoice = false;
    }
    return self;
}

@end
