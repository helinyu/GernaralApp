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

//登录
@implementation RestStructLoginResponse

-(instancetype)init{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}

@end


//闪屏广告
@implementation RestStructSplashScreenResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _btnDesc = @"";
//        _btnLink= @"";
//        _endTimestamp = 0;
//        _img = @"";
        _image_link = @"";
        _image_name = @"";
    }
    return self;
}


+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      @"image_name":@"image_name",
                                                      @"image_link":@"image_link"
                                                      }];
}

@end

//心理测试

@implementation RestStructPsychologyTestResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _item = (NSArray<RestStructPsychologyTestResponseItem> *)@[];
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"item":@"item"}];
}

@end

@implementation RestStructPsychologyTestResponseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _id = 0;
        _header_image = @"";
        _title  = @"";
        _test_number = 0 ;
        _comment_number = 0;
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{
                                 @"id":@"id",
                                 @"header_image":@"header_image",
                                 @"title":@"title",
                                 @"test_number":@"test_number" ,
                                 @"comment_number":@"comment_number"
                                 }
            ];
}

@end


//心理测试概要
@implementation RestStructPschologyTestSummaryResponseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"";
        _content = @"";
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{
                                 @"title":@"title",
                                 @"content":@"content",
                                 }
            ];
}

@end

@implementation RestStructPschologyTestSummaryResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = (NSArray<RestStructPschologyTestSummaryResponseItem> *)@[];
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{
                                 @"data":@"data",
                                 }
            ];
}

@end

@implementation RestStructPschologyTestDetailResponseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tilte = @"";
        _aChoice = @"";
        _bChoice = @"";
        _cChoice = @"";
        _dChoice = @"";
    }
    return self;
}

+ (JSONKeyMapper* )keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      @"title":@"title",
                                                      @"aChoice":@"aChoice",
                                                      @"bChoice":@"bChoice",
                                                      @"cChoice":@"cChoice",
                                                      @"dChoice":@"dChoice",
                                                      }];
}

@end

@implementation RestStructPschologyTestDetailResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = (NSArray<RestStructPschologyTestDetailResponseItem>*)@[];
    }
    return self;
}

+ (JSONKeyMapper* )keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"data":@"data"}];
}

@end

@implementation RestStructUpdateResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _url = @"";
        _version = @"";
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      @"data.version":@"version",
                                                      @"data.url":@"url",
                                                      }];
}

@end


@implementation RestStructEditProfileResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _briefIntroduction = @"";
        _sex = 0 ;
        _age = 0 ;
        _phone = @"";
        _region = @"";
        _nickname = @"";
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    return  [[JSONKeyMapper alloc]initWithDictionary:@{
                                                       @"data.briefIntroduction":@"briefIntroduction",
                                                       @"data.phone":@"phone",
                                                       @"data.password":@"password",
                                                       @"data.nickname":@"nickname",
                                                       @"data.age":@"age",
                                                       @"data.sex":@"sex",
                                                       @"data.region":@"region",
                                                       }];
}

@end


@implementation RestStructFinishedEditProfileResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ret = 0;
    }
    return self;
}
+ (JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"ret":@"ret",}];
}

@end

@implementation RestStructTopicItemResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topic_id = 0;
        _theme = @"";
        _owner = @"";
        _location = @"";
        _praiseNum = 0;
        _commentsNum = 0;
        _time = @"";
        _headerImageUrl = @"";
    }
    return self;
}

@end

@implementation RestStructTopicResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topic = (NSArray<RestStructTopicItemResponse>*) @[];
    }
    return self;
}

@end

//评论
@implementation CommentItemStructReponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _content = @"";
    }
    return self;
}

@end
@implementation CommentsStructResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _number = 0;
        _data = (NSArray<CommentItemStructReponse>*)@[];
    }
    return self;
}

@end
