//
//  RestStructRequest.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface RestStructRequest : NSObject

@property (strong, nonatomic) NSMutableDictionary *params;
- (NSData *) toPostBody;

@end

@interface TopicIdStructRequest : RestStructRequest
@property (nonatomic,assign) NSInteger topic_id;
@end

@interface RestStructRegisterByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end

@interface RestStructLoginByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end

#pragma mark --闪屏请求与响应
@interface RestStructSplashScreenRequest : RestStructRequest
@property (strong, nonatomic) NSString *size;
@end

#pragma mark ---概述

@interface RestTestSummaryRequest : RestStructRequest
@property (strong,nonatomic) NSString *title;
@end

@interface RestTestDetailRequest : RestStructRequest
@property (strong,nonatomic) NSString *title;
@end


@interface RestStructEditProfileRequest : RestStructRequest
@property (strong,nonatomic) NSString *phone;
@end

@interface RestStructFinishedEditProfileRequest : RestStructRequest
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL sex;
@property (nonatomic,strong) NSString *region;
@property (nonatomic,strong) NSString *briefIntroduction;
@end

@interface RestStructMarriageLoveRequest : RestStructRequest
@property (nonatomic,assign) NSInteger category_id;
@property (nonatomic,strong) NSString *key;
@property (nonatomic,assign) NSInteger offset;
@property (nonatomic,assign) NSInteger limit;
@end

//评论
@interface CommentsRequest : RestStructRequest
@property (nonatomic,assign) NSInteger topic_id;
@end

//创建
@interface CommentCreationRequest : RestStructRequest
@property (nonatomic,strong) NSString *theme;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,assign) NSInteger praiseNum;
@property (nonatomic,assign) NSInteger commentsNum;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *headerImageUrl;
@end

//获取对应话题的评论
@interface TopicCommentsRequest : RestStructRequest
@property (nonatomic,assign) NSInteger topic_id;
@end

//发表评论
@interface CommentSendingRequest : RestStructRequest
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *person_phone;
@property (nonatomic,strong) NSString *headerImageUrl;
@property (nonatomic,strong) NSString *time;
@end

//一个话题中的所有评论
@interface CommentsOfTopicRequest : RestStructRequest
@property (nonatomic,assign) NSInteger topic_id;
@end

@interface TopicUPdatePraiseRequest : RestStructRequest
@property (nonatomic,assign) NSInteger praiseNum;
@property (nonatomic,assign) NSInteger topic_id;
@end

//反馈内容
@interface FeedbackRequest :RestStructRequest
@property (nonatomic,strong) NSString* iamgeurl_1;
@property (nonatomic,strong) NSString* iamgeurl_2;
@property (nonatomic,strong) NSString* iamgeurl_3;
@property (nonatomic,strong) NSString* feedback_text;
@end

@interface ResultTestStructRequest : RestStructRequest
@property (nonatomic,strong) NSString* title;
@end

@interface MyCommentsStructRequest : RestStructRequest
@property (nonatomic,strong) NSString * person_phone;
@end
