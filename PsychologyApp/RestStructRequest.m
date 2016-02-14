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
