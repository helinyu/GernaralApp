//
//  TopicServiceData.m
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "TopicServiceData.h"

@implementation TopicServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _number = 0;
        _topics = (NSMutableArray<TopicItemServiceData>*)[NSMutableArray new];
    }
    return self;
}

@end

@implementation TopicItemServiceData : ServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topic_id = 0;
        _theme = @"";
        _owner = @"";
        _location = @"";
        _commentsNum = 0;
        _time = @"";
        _headerImageUrl = @"";
        _praiseNum = 0 ;
    }
    return self;
}

@end


@implementation commentItemServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _content = @"";
    }
    return self;
}

@end

@implementation CommentsServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _number = 0;
        _datas = (NSMutableArray<commentItemServiceData>*)[NSMutableArray new];
    }
    return self;
}

@end


@implementation CommentsCreationServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end

@implementation TopicCommentsServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _content=@"";
    }
    return self;
}

@end

