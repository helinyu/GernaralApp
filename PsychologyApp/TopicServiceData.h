//
//  TopicServiceData.h
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

//话题
@protocol TopicItemServiceData <NSObject>
@end
@interface TopicItemServiceData : ServiceData
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *theme;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,assign) NSInteger commentsNum;
@property (nonatomic,assign) NSInteger praiseNum;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *headerImageUrl;
@end
@interface TopicServiceData : ServiceData
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSMutableArray <TopicItemServiceData>* topics;
@end

//创建评论的结果
@interface CommentsCreationServiceData: ServiceData
@property (nonatomic,assign) NSInteger ret;
@end

//发表评论
@interface CommentSendingServiceData: ServiceData
@property (nonatomic,assign) NSInteger ret;
@end

//话题对应的评论
@protocol CommentsOfTopicItemServiceData <NSObject>
@end
@interface CommentsOfTopicItemServiceData : ServiceData
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *person_phone;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *headerImageUrl;
@end
@interface CommentsOfTopicServiceData : ServiceData
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSMutableArray<CommentsOfTopicItemServiceData>* datas;
@end

//更新点赞的数目
@interface TopicPraiseNumServiceData : ServiceData
@property (nonatomic,assign) NSInteger ret;

@end
