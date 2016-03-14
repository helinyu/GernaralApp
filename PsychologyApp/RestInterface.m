//
//  RestInterface.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestInterface.h"
#import "HostManager.h"

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

//注册
+ (void)invokeRegisterWithRequest:(RestStructRegisterByPhoneRequest*)request withComplete:(void(^)(RestStructRegisterResponse *response,NSError *error))completeBlock{
    
    [RestInterface _invokeWithUrl:@"register" withRequest:request withComplete:^(NSData *data, NSError *error) {
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
    
    [RestInterface _invokeWithUrl:@"login" withRequest:request withComplete:^(NSData *data, NSError *error) {
        
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
        
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"arr is ;%@",arr);
        
    }];
}

@end
