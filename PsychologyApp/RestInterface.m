 //
//  RestInterface.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestInterface.h"
#import "HostManager.h"
#import "AFNetworking.h"
#import <UIKit/UIKit.h>

@implementation RestInterface

// 公共模块
+ (void)_invokeWithUrl:(NSString *)urlStr withRequest:(RestStructRequest *)request withComplete:(void (^)(NSData *data,NSError *error))completeBlock{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 30;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@",OBTAIN_COMMON_HOST,urlStr]]];
    urlRequest.HTTPBody = [request toPostBody];
    urlRequest.HTTPMethod = @"POST";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completeBlock(nil,error);
        }else{
            completeBlock(data,nil);
        }
    }];
    [task resume];
}

+ (void)_invokeWithGETUrl:(NSString *)urlStr withComplete:(void (^)(NSData *data,NSError *error))completeBlock{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 30;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@",OBTAIN_COMMON_HOST,urlStr]]];
    urlRequest.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completeBlock(nil,error);
        }else{
            completeBlock(data,nil);
        }
    }];
    [task resume];
}

//注册
+ (void)invokeRegisterWithRequest:(RestStructRegisterByPhoneRequest*)request withComplete:(void(^)(RestStructRegisterResponse *response,NSError *error))completeBlock{

    [RestInterface _invokeWithUrl:@"/Login/account_register.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict is : %@",dict);
        NSLog(@"error is :%@",error);
        
        if (error) {
            NSLog(@"发送网络请求出现错误，没有返回正常的值返回");
            return ;
        }

        NSError *errorJson = nil;
        RestStructRegisterResponse *response = [[RestStructRegisterResponse alloc] initWithData:data error:&errorJson];
        completeBlock(response,errorJson);
    }];
}

//登录
+ (void)invokeLoginWithRequest:(RestStructLoginByPhoneRequest*)request withComplete:(void(^)(RestStructLoginResponse *response,NSError *error))completeBlock{
    
    [RestInterface _invokeWithUrl:@"/Login/account_login.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        
        if (error) {
            NSLog(@"发送网络请求出现错误，没有返回正常的值返回");
            return ;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict is : %@",dict);
        NSLog(@"error is :%@",error);
        
        
        NSError *errorJson = nil;
        RestStructLoginResponse *response = [[RestStructLoginResponse alloc] initWithData:data error:&errorJson];
        completeBlock(response,errorJson);

    }];
}

//闪屏接口
+ (void)invokeSplashScreenWithRequest:(RestStructSplashScreenRequest *)request withComplete:(void (^)(RestStructSplashScreenResponse *response,NSError *error))completeBlock{
    
    NSLog(@"resquest is: %@",request);
    [RestInterface _invokeWithUrl:@"content/splashscreen.json" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code) {
            completeBlock(nil,error);
            return;
        }
        
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        NSLog(@"json's dat is :  %@",json);
        NSError *restError = nil;
        RestStructSplashScreenResponse *restResponse = [[RestStructSplashScreenResponse alloc] initWithData:data error:&restError];
        NSLog(@"response is  ： %@",restResponse);
        completeBlock(restResponse,error);
    }];
}

//心理测试
+ (void)invokeFromHomePageServiceOfPyschologyServiceWithComplete:(void(^)(RestStructPsychologyTestResponse *response ,NSError *errro)) completeToService{
    
    [RestInterface _invokeWithUrl:@"/homePage/psychology_test/fetch_Pschology_test.php" withRequest:[RestStructRequest new] withComplete:^(NSData *data, NSError *error) {
        
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *errorOfResponse = nil;
        RestStructPsychologyTestResponse *response = [[RestStructPsychologyTestResponse alloc] initWithData:data error:&errorOfResponse];
        
        completeToService(response,errorOfResponse);
//        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"arr is ;%@",arr);
        
    }];
}

//心理概要
+ (void)invokeFromHomePageServiceOfPschologyTestSummaryService:(RestTestSummaryRequest*)request withComplete:(void (^)(RestStructPschologyTestSummaryResponse *response, NSError *error))completeToService {
    
    [RestInterface _invokeWithUrl:@"/homePage/psychology_test/fetch_Pschology_summary.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return;
        }

        NSError * errorOfResponse = nil;
        RestStructPschologyTestSummaryResponse *summaryResponse = [[RestStructPschologyTestSummaryResponse alloc]initWithData:data error:&errorOfResponse];
        completeToService(summaryResponse,nil);
    }];
}

//测试的题目
+ (void)invokeFromHomePageServiceOfPschologyTestDServiceDetail:(RestStructRequest*)request WithComplete:(void (^)(RestStructPschologyTestDetailResponse *response, NSError * error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/homePage/psychology_test/fetch_Pschology_detail.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        NSError *errorOfResponse = nil;
        RestStructPschologyTestDetailResponse *detailResponse = [[RestStructPschologyTestDetailResponse alloc]initWithData:data error:&errorOfResponse];
              completeToService(detailResponse,nil);
    }];
}


//UPDATE
+ (void)invokeUpdateWithComplete:(void (^)(RestStructUpdateResponse *response, NSError * error))completeToService{

    [RestInterface _invokeWithUrl:@"/updates/update.php" withRequest:[RestStructRequest new] withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0 ) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *errorOfResponse = nil;
        RestStructUpdateResponse *updateResponse = [[RestStructUpdateResponse alloc]initWithData:data error:&errorOfResponse];
        
        
        completeToService(updateResponse,nil);
    }];
}

//EditProfile
+ (void)invokeEditProfile:(RestStructEditProfileRequest*)request withComplete:(void(^)(RestStructEditProfileResponse* response,NSError *error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/mine/editprofile.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        RestStructEditProfileResponse *response = [[RestStructEditProfileResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
//        dispatch_async(dispatch_get_main_queue(), ^{ completeToService(response, error);});
//        为什么使用主线程？？？
    }];
}

+ (void)invokeFinishedEditProfile:(RestStructFinishedEditProfileRequest*)request withComplete:(void(^)(RestStructFinishedEditProfileResponse* response,NSError *error))completeToService{
    [RestInterface _invokeWithUrl:@"/mine/finishedEditProfile.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        RestStructFinishedEditProfileResponse *response = [[RestStructFinishedEditProfileResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
    }];
}

#pragma mark -- 对应的话题
//一个topic_id的话题
+ (void)invokeTopic:(TopicIdStructRequest*)request WithComplete:(void(^)(RestStructTopicItemResponse* response,NSError *error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/mine/topic_byTopicId.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }

//        NSError *structError = nil  ;
//        NSArray* arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&structError];
//        NSLog(@"arr is : %@",arr);
        
        NSError *restError = nil;
        RestStructTopicItemResponse *response = [[RestStructTopicItemResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
    }];
    
}
//所有的话题
+ (void)invokeTopicsWithComplete:(void(^)(RestStructTopicResponse* response,NSError *error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/topics/topicMain.php" withRequest:[RestStructRequest new] withComplete:^(NSData *data, NSError *error) {
        
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        RestStructTopicResponse *response = [[RestStructTopicResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
    }];
    
}

//话题创建
+ (void)invokeCommentCreation:(CommentCreationRequest*)request WithComplete:(void(^)(CommentsCreationResponse* response,NSError *error))completeToService{
    [RestInterface _invokeWithUrl:@"/topics/topicCreate.php" withRequest:request withComplete:^(NSData *data, NSError *error) {

        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }

        NSError *restError = nil;
        CommentsCreationResponse *response = [[CommentsCreationResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
    }];
}

//发表评论
+ (void)invokeCommentSending:(CommentSendingRequest*)request withComplete:(void(^)(CommentSendingResponse *reponse, NSError *error))completeToService{

    [RestInterface _invokeWithUrl:@"/topics/commentSending.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        CommentSendingResponse *response = [[CommentSendingResponse alloc]initWithData:data error:&restError];
        completeToService(response,error);
    }];
}

//话题对应这的评论
+ (void)invokecommentsOfTopic:(CommentsOfTopicRequest*)request withComplete:(void(^)(CommentsOfTopicResponse *reponse, NSError *error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/topics/commentsOfATopic.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }

        NSError *restError = nil;
        CommentsOfTopicResponse *response = [[CommentsOfTopicResponse alloc] initWithData:data error:&restError];
        completeToService(response,error);
    }];
}

//更新点赞数目
+ (void)invokeUpdateTopicPraise:(TopicUPdatePraiseRequest*)request withComplete:(void(^)(TopicUPdatePraiseResponse *reponse, NSError *error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/topics/updateTopicPraise.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        NSError *restError = nil;
        TopicUPdatePraiseResponse *response = [[TopicUPdatePraiseResponse alloc] initWithData:data error:&error];
        completeToService(response,restError);
    }];
}

+ (void)invokeFeedback:(FeedbackRequest*)request withComplete:(void(^)(RetResponse *reponse, NSError *error))completeToService{
    [RestInterface _invokeWithUrl:@"/mine/feedback.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        NSError *restError = nil;
        RetResponse *response = [[RetResponse alloc] initWithData:data error:&error];
        completeToService(response,restError);
    }];
}

//测试的结果
+ (void)invokeTestResult:(ResultTestStructRequest*)request WithComplete:(void (^)(ResultTestResponse *response, NSError * error))completeToService{

    [RestInterface _invokeWithUrl:@"/homePage/psychology_test/result_test.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        NSError *restError = nil;
        ResultTestResponse *response = [[ResultTestResponse alloc] initWithData:data error:&error];
        completeToService(response,restError);
    }];
}

//测试结果score
+ (void)invokeTestScoreResult:(ResultTestStructRequest*)request WithComplete:(void (^)(ScoreResultTestResponse *response, NSError * error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/homePage/psychology_test/score_result.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        ScoreResultTestResponse *response = [[ScoreResultTestResponse alloc] initWithData:data error:&error];
        completeToService(response,restError);
    }];
}



//我的页面的comment集合
+ (void)invoketopicOfMyComments:(MyCommentsStructRequest*)request  WithComplete:(void (^)(CommentsOfTopicResponse *response, NSError * error))completeToService{
    
    [RestInterface _invokeWithUrl:@"/mine/my_comments.php" withRequest:request withComplete:^(NSData *data, NSError *error) {
        if (error.code != 0) {
            completeToService(nil,error);
            return ;
        }
        
        NSError *restError = nil;
        CommentsOfTopicResponse *response = [[CommentsOfTopicResponse alloc] initWithData:data error:&restError];
        completeToService(response,error);
    }];
}

+ (void)_invokeUploadWithUrl:(NSURL *)url withRequest:(RestStructRequest *)request withResponseCallback:(void (^)(NSString *interface, NSData* response))responseBlock {

    NSMutableURLRequest *requestParams = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http:upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"http://localhost/upload_Photo/"] name:@"file" fileName:@"file.jpg" mimeType:@"image/jpeg" error:nil];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:requestParams
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                          [[UIProgressView new] setProgress:uploadProgress.fractionCompleted];
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
        [uploadTask resume];
}


@end

