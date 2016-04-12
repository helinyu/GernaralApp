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

- (void)requestTopicsWithComplete:(void(^)(TopicServiceData* servicTeData ,NSError *error)) completeToView;


- (void)requestCommetns:(NSInteger)topic_id WithComplete:(void(^)(CommentsServiceData* servicTeData ,NSError *error)) completeToView;


//创建话题
- (void)requestCreateComments:(NSString*)theme withOwner:(NSString *)owner withLocation:(NSString *)location withPraiseNum:(NSInteger)praiseNum withCommentsNum:(NSInteger)commentsNum withTime:(NSString*)time withHeaderImageUrl:(NSString *)headerImageUrl WithComplete:(void(^)(CommentsCreationServiceData* servicTeData ,NSError *error)) completeToView;

@end
