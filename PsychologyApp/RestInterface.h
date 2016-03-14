//
//  RestInterface.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestStructRequest.h"
#import "RestStructResponse.h"

@interface RestInterface : NSObject

//通过手机注册
+ (void)invokeRegisterWithRequest:(RestStructRegisterByPhoneRequest*)request withComplete:(void(^)(RestStructRegisterResponse *response,NSError *error))completeBlock ;

//通过手机进行登录
+ (void)invokeLoginWithRequest:(RestStructLoginByPhoneRequest*)request withComplete:(void(^)(RestStructLoginResponse *response,NSError *error))completeBlock;

//闪屏的调用
//闪屏
+ (void)invokeSplashScreenWithRequest:(RestStructSplashScreenRequest *)request withComplete:(void (^)(RestStructSplashScreenResponse *response,NSError *error))completeBlock;

//心理测试
+ (void)invokeFromHomePageServiceOfPyschologyServiceWithComplete:(void(^)(RestStructPsychologyTestResponse *response ,NSError *errro)) completeToService;

//心理概述
+ (void)invokeFromHomePageServiceOfPschologyTestSummaryServiceWithComplete:(void (^)(RestStructPschologyTestSummaryResponse *response, NSError * error))completeToService ;

@end
