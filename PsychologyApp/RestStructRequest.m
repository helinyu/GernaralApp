//
//  RestStructRequest.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestStructRequest.h"

@implementation RestStructRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.params = [NSMutableDictionary new];
//        [self.params setObject:APP_ID forKey:@"appId"];
//        [self.params setObject:CHANNEL forKey:@"channel"];
//        [self.params setObject:[[[Helper getDeviceID] stringByReplacingOccurrencesOfString:@"-" withString:@""]lowercaseString] forKey:@"deviceId"];
//        [self.params setObject:DEVICE_TYPE forKey:@"deviceType"];
//        [self.params setObject:[Helper appGetVersion] forKey:@"version"];
    }
    return self;
}

- (NSData *)toPostBody {
    
    NSMutableArray *parameterArray = [NSMutableArray array];
    
    [self.params enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        NSString *param = [NSString stringWithFormat:@"%@=%@", key, [self percentEscapeString:obj]];
        [parameterArray addObject:param];
    }];
    
    NSString *string = [parameterArray componentsJoinedByString:@"&"];
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

- (id)percentEscapeString:(id)obj
{
    if ([obj isKindOfClass:NSString.class]) {
        NSString *result = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                     (CFStringRef)obj,
                                                                                     (CFStringRef)@" ",
                                                                                     (CFStringRef)@":/?@!$&'()*+,;=",
                                                                                     kCFStringEncodingUTF8));
        return [result stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    }
    return obj;
}

@end

#pragma mark --register
@implementation RestStructRegisterByPhoneRequest

-(instancetype)init{
    self = [super init];
    if (self) {
        _phone = @"";
        _password = @"";
    }
    return self;
}

- (void)setPhone:(NSString *)phone{
    _phone = phone;
    [self.params setObject:phone forKey:@"phone"];
}

- (void)setPassword:(NSString *)password{
    _password = password;
    [self.params setObject:_password forKey:@"password"];
}

@end

#pragma mark --login
@implementation RestStructLoginByPhoneRequest

-(instancetype)init{
    self = [super init];
    if (self) {
        _phone = @"";
        _password = @"";
    }
    return self;
}

- (void)setPhone:(NSString *)phone{
    _phone = phone;
    [self.params setObject:phone forKey:@"phone"];
}

- (void)setPassword:(NSString *)password{
    _password = password;
    [self.params setObject:_password forKey:@"password"];
}

@end

#pragma mark --闪屏请求与响应
@implementation RestStructSplashScreenRequest

- (void)setSize:(NSString *)size{
    _size = size;
    [self.params setObject:size forKey:@"size"];
}

@end

@implementation RestTestSummaryRequest

- (void)setTitle:(NSString *)title{
    _title = title;
    [self.params setObject:title forKey:@"title"];
}

@end

@implementation RestTestDetailRequest
- (void)setTitle:(NSString *)title{
    _title = title;
    [self.params setObject:title forKey:@"title"];
}
@end


@implementation RestStructEditProfileRequest

- (void)setPhone:(NSString *)phone{
    _phone = phone;
    [self.params setObject:phone forKey:@"phone"];
}

@end


@implementation RestStructFinishedEditProfileRequest

- (void)setPhone:(NSString *)phone{
    _phone = phone;
    [self.params setObject:phone forKey:@"phone"];
}

- (void)setPassword:(NSString *)password{
    _password = password;
    [self.params setObject:password forKey:@"password"];
}
- (void)setAge:(NSInteger)age{
    _age = age;
    [self.params setObject:@(age) forKey:@"age"];
}
-(void)setSex:(BOOL)sex{
    _sex = sex;
    [self.params setObject:@(sex) forKey:@"sex"];
}

- (void)setNickname:(NSString *)nickname{
    _nickname = nickname;
    [self.params setObject:nickname forKey:@"nickname"];
}

- (void)setRegion:(NSString *)region{
    _region = region;
    [self.params setObject:region forKey:@"region"];
}

- (void)setBriefIntroduction:(NSString *)briefIntroduction{
    _briefIntroduction = briefIntroduction;
    [self.params setObject:briefIntroduction forKey:@"briefIntroduction"];
}
@end

@implementation RestStructMarriageLoveRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _limit = 0;
        _category_id = 0;
        _offset = 0;
        _key = @"";
    }
    return self;
}

- (void)setLimit:(NSInteger)limit{
    _limit = limit;
    [self.params setObject: @(limit) forKey:@"limit"];
}

- (void)setOffset:(NSInteger)offset{
    _offset = offset;
    [self.params setObject:@(offset) forKey:@"offset"];
}

- (void)setKey:(NSString *)key{
    _key = key;
    [self.params setObject:key forKey:@"key"];
}

- (void)setCategory_id:(NSInteger)category_id{
    _category_id = category_id;
    [self.params setObject:@(category_id) forKey:@"category_id"];
}

@end

