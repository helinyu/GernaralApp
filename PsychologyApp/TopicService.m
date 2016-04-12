//
//  TopicService.m
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "TopicService.h"

@implementation TopicService

- (void)requestTopicsWithComplete:(void(^)(TopicServiceData* servicTeData ,NSError *error)) completeToView{
    
    [RestInterface invokeTopicsWithComplete:^(RestStructTopicResponse *response, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        
        TopicServiceData *serviceData = [TopicServiceData new];
        serviceData.number = response.number;
        for (RestStructTopicItemResponse *item in response.topic) {
            TopicItemServiceData *itemServiceData = [TopicItemServiceData new];
            itemServiceData.topic_id = item.topic_id;
            itemServiceData.theme = item.theme;
            itemServiceData.owner = item.owner;
            itemServiceData.location = item.location;
            itemServiceData.commentsNum = item.commentsNum;
            itemServiceData.time = item.time;
            itemServiceData.headerImageUrl = item.headerImageUrl;
            [serviceData.topics addObject:itemServiceData];
        }
        
        completeToView(serviceData,nil);

    }];
}


- (void)requestCommetns:(NSInteger)topic_id WithComplete:(void(^)(CommentsServiceData* servicTeData ,NSError *error)) completeToView{
    
    CommentsRequest *request = [CommentsRequest new];
    request.topic_id = topic_id;
    [RestInterface invokeCommets:request WithComplete:^(CommentsStructResponse *response, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        CommentsServiceData *serviceData = [CommentsServiceData new];
        serviceData.number = response.number;
        
        for (commentItemServiceData *item in response.data) {
            commentItemServiceData *itemServiceData = [commentItemServiceData new];
            itemServiceData.content = item.content;
        }
        
        completeToView(serviceData,nil);
    }];
}

@end
