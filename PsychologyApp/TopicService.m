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

- (void)requestCreateComments:(NSString*)theme withOwner:(NSString *)owner withLocation:(NSString *)location withPraiseNum:(NSInteger)praiseNum withCommentsNum:(NSInteger)commentsNum withTime:(NSString*)time withHeaderImageUrl:(NSString *)headerImageUrl WithComplete:(void(^)(CommentsCreationServiceData* servicTeData ,NSError *error)) completeToView{
    
    CommentCreationRequest *request = [CommentCreationRequest new];
    request.theme = theme;
    request.owner = owner;
    request.location = location;
    request.praiseNum = praiseNum;
    request.commentsNum = commentsNum;
    request.time = time;
    request.headerImageUrl  = headerImageUrl;
    
    [RestInterface invokeCommentCreation:request WithComplete:^(CommentsCreationResponse *response, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        CommentsCreationServiceData *creationServiceData = [CommentsCreationServiceData new];
        creationServiceData.ret = response.ret;
        completeToView(creationServiceData,nil);
    }];
}


- (void)requestCommentSending:(NSInteger)topic_id withComment:(NSString *)comment WithComplete:(void(^)(CommentSendingServiceData* servicTeData ,NSError *error)) completeToView{
    
    CommentSendingRequest *request = [CommentSendingRequest new];
    request.topic_id = topic_id;
    request.commentText = comment;
    
    [RestInterface invokeCommentSending:request withComplete:^(CommentSendingResponse *reponse, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        CommentSendingServiceData *sendingServiceData = [CommentSendingServiceData new];
        sendingServiceData.ret = reponse.ret;
        completeToView(sendingServiceData,nil);
    }];
}

- (void)requestCommentsOfTopic:(NSInteger)topic_id WithComplete:(void(^)(CommentsOfTopicServiceData* servicTeData ,NSError *error)) completeToView{
    
    CommentsOfTopicRequest *request = [CommentsOfTopicRequest new];
    request.topic_id = topic_id;
    
    [RestInterface invokecommentsOfTopic:request withComplete:^(CommentsOfTopicResponse *reponse, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        
        
        
    }];
    
}

@end
