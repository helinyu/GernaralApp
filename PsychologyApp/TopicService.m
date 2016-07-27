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
            itemServiceData.praiseNum = item.praiseNum;
            itemServiceData.time = item.time;
            itemServiceData.headerImageUrl = item.headerImageUrl;
            [serviceData.topics addObject:itemServiceData];
        }
        completeToView(serviceData,nil);
    }];
}

- (void)requestTopic:(NSInteger)topic_Id WithComplete:(void(^)(TopicItemServiceData* itemServicTeData ,NSError *error)) completeToView{
    TopicIdStructRequest *request = [TopicIdStructRequest new];
    request.topic_id = topic_Id;
    
    [RestInterface invokeTopic:request WithComplete:^(RestStructTopicItemResponse *response, NSError *error) {
        if (error!=nil) {
            completeToView(nil,error);
            return ;
        }
        
        TopicItemServiceData *itemServiceData = [TopicItemServiceData new];
        itemServiceData.topic_id = response.topic_id;
        itemServiceData.theme = response.theme;
        itemServiceData.owner = response.owner;
        itemServiceData.location = response.location;
        itemServiceData.commentsNum = response.commentsNum;
        itemServiceData.praiseNum = response.praiseNum;
        itemServiceData.time = response.time;
        itemServiceData.headerImageUrl = response.headerImageUrl;
          completeToView(itemServiceData,nil);
    }];
}

- (void)requestCreateComments:(NSString*)theme withOwner:(NSString *)owner withLocation:(NSString *)location withPraiseNum:(NSInteger)praiseNum withCommentsNum:(NSInteger)commentsNum withTime:(NSString*)time withHeaderImageUrl:(NSString *)headerImageUrl WithComplete:(void(^)(CommentsCreationServiceData* servicTeData ,NSError *error)) completeToView{
    
    CommentCreationRequest *request = [CommentCreationRequest new];
    request.theme = theme;
    request.owner = owner;
    if (location == nil) {
        request.location = @"广东 深圳";
    }else{
        request.location = location;
    }
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


- (void)requestCommentSending:(NSInteger)topic_id withComment:(NSString *)comment withPerson_phone:(NSString *)person_phone withHeaderImageUrl:(NSString*)headerImageUrl withTime:(NSString*)time WithComplete:(void(^)(CommentSendingServiceData* servicTeData ,NSError *error)) completeToView{
    CommentSendingRequest *request = [CommentSendingRequest new];
    request.topic_id = topic_id;
    request.content = comment;
    request.headerImageUrl = headerImageUrl;
    request.person_phone = person_phone;
    request.time = time;
    
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
        
        CommentsOfTopicServiceData *ServiceData = [CommentsOfTopicServiceData new];
        ServiceData.number = reponse.number;
        
        for (CommentsOfTopicItemResponse *item in reponse.datas) {
            CommentsOfTopicItemServiceData *itemServiceData = [CommentsOfTopicItemServiceData new];
            itemServiceData.topic_id = item.topic_id;
            itemServiceData.person_phone = item.person_phone;
            itemServiceData.content = item.content;
            itemServiceData.time = item.time;
            itemServiceData.headerImageUrl = item.headerImageUrl;
            [ServiceData.datas addObject:itemServiceData];
        }
        completeToView(ServiceData,nil);
    }];
}

//更新话题点赞的数目
- (void)requestUPdatePraiseNumWithTopic_id:(NSInteger)topic_id withPraiseNum:(NSInteger)praiseNum WithComplete:(void(^)(TopicPraiseNumServiceData* servicTeData ,NSError *error)) completeToView{
    
    TopicUPdatePraiseRequest *request = [TopicUPdatePraiseRequest new];
    request.topic_id = topic_id;
    request.praiseNum = praiseNum;
    
    [RestInterface invokeUpdateTopicPraise:request withComplete:^(TopicUPdatePraiseResponse *reponse, NSError *error) {
        
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }

        TopicPraiseNumServiceData *serviceData = [TopicPraiseNumServiceData new];
        serviceData.ret = reponse.ret;
        completeToView(serviceData,nil);
    }];
}

@end
