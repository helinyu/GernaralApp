//
//  TopicServiceData.m
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "TopicServiceData.h"

//话题（所有）
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

//
//@implementation CommentItemServiceData
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _content = @"";
//    }
//    return self;
//}
//
//@end
//
//@implementation CommentsServiceData
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _number = 0;
//        _datas = (NSMutableArray<CommentItemServiceData>*)[NSMutableArray new];
//    }
//    return self;
//}
//
//@end

//评论创建
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

//评论发表
@implementation CommentSendingServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end


//话题对的评论
@implementation CommentsOfTopicItemServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _content= @"";
        _time = @"";
        _person_phone = @"";
        _topic_id = 0;
        _headerImageUrl = @"";
    }
    return self;
}
@end

@implementation CommentsOfTopicServiceData
- (instancetype)init
{
    self = [super init];
    if (self) {
        _number = 0;
        _datas = (NSMutableArray<CommentsOfTopicItemServiceData>*)[NSMutableArray new];
    }
    return self;
}
@end


@implementation TopicPraiseNumServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end

