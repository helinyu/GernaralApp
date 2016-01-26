//
//  UserService.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "UserService.h"

@implementation UserService


#pragma mark 服务层手机发送登录请求
- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withDeviceToken:(NSString *)deviceToken {
//    __weak id<UserAccountServiceDelegate> delegate = self.accountDelegate;
//    
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
}



@end
