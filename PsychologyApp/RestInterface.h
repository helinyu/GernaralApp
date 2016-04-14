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
+ (void)invokeFromHomePageServiceOfPschologyTestSummaryService:(RestTestSummaryRequest*)request withComplete:(void (^)(RestStructPschologyTestSummaryResponse *response, NSError *error))completeToService ;
//心理测试的题目
+ (void)invokeFromHomePageServiceOfPschologyTestDServiceDetail:(RestStructRequest*)request WithComplete:(void (^)(RestStructPschologyTestDetailResponse *response, NSError * error))completeToService;

//更新
+ (void)invokeUpdateWithComplete:(void (^)(RestStructUpdateResponse *response, NSError * error))completeToService;

//编辑资料请求
+ (void)invokeEditProfile:(RestStructEditProfileRequest*)request withComplete:(void(^)(RestStructEditProfileResponse* response,NSError *error))completeToService;

//编辑之后保存请求
+ (void)invokeFinishedEditProfile:(RestStructFinishedEditProfileRequest*)request withComplete:(void(^)(RestStructFinishedEditProfileResponse* response,NSError *error))completeToService;

#pragma mark --话题
//topic
+ (void)invokeTopicsWithComplete:(void(^)(RestStructTopicResponse* response,NSError *error))completeToService;

//topic creation
+ (void)invokeCommentCreation:(CommentCreationRequest*)request WithComplete:(void(^)(CommentsCreationResponse* response,NSError *error))completeToService;

//发表评论
+ (void)invokeCommentSending:(CommentSendingRequest*)request withComplete:(void(^)(CommentSendingResponse *reponse, NSError *error))completeToService;

//一个话题对应这的评论
+ (void)invokecommentsOfTopic:(CommentsOfTopicRequest*)request withComplete:(void(^)(CommentsOfTopicResponse *reponse, NSError *error))completeToService;



@end
