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


#pragma mark 服务层手机发送登录请求
//- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withDeviceToken:(NSString *)deviceToken {//
//    RestStructLoginByPhoneRequest *request = [RestStructLoginByPhoneRequest new];
//    request.phone = phone;
//    request.password = password;
//    request.deviceId = deviceToken;
//    
//    [RestInterfaces invokeLoginByPhone:request withResponseCallback:^(RestStructLoginByPhoneResponse *response, RestError *error) {
//        if(error.result != 0) {
//            if ([delegate respondsToSelector:@selector(userService:loginFailed:)]) {
//                [delegate userService:self loginFailed:[NSError errorWithDomain:@"Application" code:error.result userInfo:nil]];
//                NSLog(@"error.result is : %ld",error.result);
//            }
//        }
//        else{
//            EntityUserCredential *credential = [EntityUserCredential new];
//            [UserServiceDataAdapter convertFrom:response to:credential];
//            
//            MTA_REPORT(@"v210_login", @{@"value":@"login_phone"});
//            [self loginWithCredential:credential isFirstTime:response.isFirst isBindMobile:YES andDelegate:delegate];
//        }
//    }];
//}

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

@end
