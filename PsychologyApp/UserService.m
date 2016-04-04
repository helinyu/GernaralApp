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
#import "Model.h"
#import "AppDefinition.h"

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
        
        NSUserDefaults *useDefualt = [NSUserDefaults standardUserDefaults];
        [useDefualt setObject:structRegisterByPhoneRequest.phone forKey:LOGIN_PHONE];
        [useDefualt synchronize];
        
        EntityUser *user = [Model sharedInstance].user;
        user.uId = structRegisterByPhoneRequest.phone;
        user.isLogined = true;
        [[Model sharedInstance] commitUser];

        completeBlock(response.ret);
    }];
}

- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withComplete:(void (^)(NSInteger ret))completeBlock{
    RestStructLoginByPhoneRequest *request = [RestStructLoginByPhoneRequest new];
    request.phone = phone;
    request.password = password;
    [RestInterface invokeLoginWithRequest:request withComplete:^(RestStructLoginResponse *response, NSError *error) {
        NSLog(@"response");
        
        if (error) {
            NSLog(@"数据转化失败");
            completeBlock(error.code);
            return ;
        }
        
        
        NSUserDefaults *useDefualt = [NSUserDefaults standardUserDefaults];
        [useDefualt setObject:request.phone forKey:LOGIN_PHONE];
        [useDefualt synchronize];
        
        EntityUser *user = [Model sharedInstance].user;
        user.uId = request.phone;
        user.isLogined = true;
        [[Model sharedInstance] commitUser];
        
        completeBlock(response.ret);
    }];
}

@end
