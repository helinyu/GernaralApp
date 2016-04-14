//
//  TopicService.h
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "TopicServiceData.h"
#import "RestInterface.h"


@interface TopicService : Service

//所有的话题
- (void)requestTopicsWithComplete:(void(^)(TopicServiceData* servicTeData ,NSError *error)) completeToView;

//创建话题
- (void)requestCreateComments:(NSString*)theme withOwner:(NSString *)owner withLocation:(NSString *)location withPraiseNum:(NSInteger)praiseNum withCommentsNum:(NSInteger)commentsNum withTime:(NSString*)time withHeaderImageUrl:(NSString *)headerImageUrl WithComplete:(void(^)(CommentsCreationServiceData* servicTeData ,NSError *error)) completeToView;

// 对话题进行评论
- (void)requestCommentSending:(NSInteger)topic_id withComment:(NSString *)comment withPerson_phone:(NSString *)person_phone withHeaderImageUrl:(NSString*)headerImageUrl withTime:(NSString*)time WithComplete:(void(^)(CommentSendingServiceData* servicTeData ,NSError *error)) completeToView;

//话题对应着的评论
- (void)requestCommentsOfTopic:(NSInteger)topic_id WithComplete:(void(^)(CommentsOfTopicServiceData* servicTeData ,NSError *error)) completeToView;

//更新点赞的数目
- (void)requestUPdatePraiseNumWithTopic_id:(NSInteger)topic_id withPraiseNum:(NSInteger)praiseNum WithComplete:(void(^)(TopicPraiseNumServiceData* servicTeData ,NSError *error)) completeToView;

@end
