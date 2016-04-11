//
//  ReadingService.m
//  PsychologyApp
//
//  Created by felix on 16/4/7.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ReadingService.h"
#import "RestInterface.h"
#import "RestStructRequest.h"
#import "HostManager.h"

@implementation ReadingService

- (void)requestMarriageLove:(NSInteger)category_id withOffset:(NSInteger)offset withLimit:(NSInteger)limit withComplete:(void (^)(NSData *data,NSError *error))completeBlock{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 30;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://yiapi.xinli001.com/v2/yi/article-list.json/?category_id=%ld&key=e110509c8317557ef50ce777d107f4b3&offset=%ld&limit=%ld",(long)category_id,(long)offset,(long)limit]]];
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


//http://yiapi.xinli001.com/v2/yi/article-detail.json/?token=b3c24fad78542428c51df328c485da71&key=e110509c8317557ef50ce777d107f4b3
//
//- (void)requestMarriageLoveDetail:(NSString*)_id withComplete:(void (^)(NSData *data,NSError *error))completeBlock{
//    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
//    sessionConfig.timeoutIntervalForRequest = 30;
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"]]];
//    urlRequest.HTTPMethod = @"GET";
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        if (error) {
//            completeBlock(nil,error);
//        }else{
//            completeBlock(data,nil);
//        }
//    }];
//    [task resume];
//}



@end
