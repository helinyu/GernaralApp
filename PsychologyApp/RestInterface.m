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
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@",OBTAIN_COMMON_HOST,urlStr]]];
    
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
        }
        
        NSError *errorJson = nil;
        RestStructRegisterResponse *response = [[RestStructRegisterResponse alloc] initWithData:data error:&errorJson];
        completeBlock(response,errorJson);
    }];
}

//登录
+ (void)invokeLoginWithRequest:(RestStructLoginByPhoneRequest*)request withComplete:(void(^)(RestStructRegisterResponse *response,NSError *error))completeBlock{
    [RestInterface _invokeWithUrl:@"login" withRequest:request withComplete:^(NSData *data, NSError *error) {
        NSLog(@"实现进行登录");
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict is : %@",dict);
        NSLog(@"error is :%@",error);
        
        if (error) {
            NSLog(@"发送网络请求出现错误，没有返回正常的值返回");
        }
        
        NSError *errorJson = nil;
        RestStructRegisterResponse *response = [[RestStructRegisterResponse alloc] initWithData:data error:&errorJson];
        completeBlock(response,errorJson);
    }];
}

@end
