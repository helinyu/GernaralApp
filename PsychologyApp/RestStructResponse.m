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
//+ (JSONKeyMapper *)keyMapper
//{
//    return [[JSONKeyMapper alloc] initWithDictionary:@{@"data.btnDesc":@"btnDesc",
//                                                       @"data.btnLink": @"btnLink",
//                                                       @"data.endTimestamp": @"endTimestamp",
//                                                       @"data.img":@"img"
//                                                       }];
//}

@end

//心理测试

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
                                 @"item.id":@"id",
                       @"item.header_image":@"header_image",
                                 @"item.title":@"title",
                                 @"item.test_number":@"test_number" ,
                                 @"item.comment_number":@"comment_number"
                                 }];
}

//+ (BOOL)propertyIsOptional:(NSString *)propertyName{
//    return YES;
//}

@end

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

//+ (BOOL)propertyIsOptional:(NSString *)propertyName{
//    return YES;
//}

@end


