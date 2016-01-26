//
//  RestInterface.m
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestInterface.h"

@implementation RestInterface

+ (void)_invokeUsingHttpWithUrl:(NSURL *)url withRequest:(RestStructRequest *)request withResponseCallback:(void (^)(NSString *interface, NSData* response))responseBlock {
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Guimiquan/%@ (%@;%@ %@)", [Helper appGetVersion], [Helper getSysModel], @"IOS", [Helper getSysVersion]] forHTTPHeaderField:@"User-Agent"];
//    manager.requestSerializer.timeoutInterval = 15.0f;
//    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
//    [manager POST:url.absoluteString parameters:request.params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            responseBlock(url.path, responseObject);
//        });
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            responseBlock(url.path, nil);
//        });
//    }];
}


@end
