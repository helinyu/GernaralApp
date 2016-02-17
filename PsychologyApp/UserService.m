//
//  UserService.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "UserService.h"
#import "RestStructRequest.h"
#import "RestInterface.h"

@implementation UserService

- (void)requestRegisterWithMobile:(NSString *)phone withPassword:(NSString *)password withComplete:(void (^)(NSInteger ret))completeBlock
{

    RestStructRegisterByPhoneRequest *structRegisterByPhoneRequest = [RestStructRegisterByPhoneRequest new];
    structRegisterByPhoneRequest.phone = phone;
    structRegisterByPhoneRequest.password = password;
    
    [RestInterface invokeRegisterWithRequest:structRegisterByPhoneRequest withComplete:^(RestStructRegisterResponse *response, NSError *error) {
        NSLog(@"service 层次");

        if (error) {
            NSLog(@"数据解析出现错误");
            return ;
        }
        completeBlock(response.ret);
    }];
}

- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withComplete:(void (^)(NSInteger ret))completeBlock{
    RestStructLoginByPhoneRequest *request = [RestStructLoginByPhoneRequest new];
    request.phone = phone;
    request.password = password;
    [RestInterface invokeLoginWithRequest:request withComplete:^(RestStructRegisterResponse *response, NSError *error) {
        NSLog(@"response");
        
        completeBlock(response.ret);
    }];
}

@end
